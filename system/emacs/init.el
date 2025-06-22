;; -*- lexical-binding: t; -*-

;; ELPACA ;;
;; Installer
(defvar elpaca-installer-version 0.10)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Windows users must be able to create symlinks, or enable elpaca-no-symlink-mode
(when (eq system-type 'windows-nt) (elpaca-no-symlink-mode))

;; For using elpaca with use-package :ensure
(elpaca elpaca-use-package
  (elpaca-use-package-mode))
(elpaca-wait)
;; ELPACA END ;;

;; ORG ;;
(use-package org ; told me to put this early in the config
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)))
  (add-to-list 'org-agenda-files "~/notes/agenda.org")
  (setq org-clock-sound "~/.emacs.d/ding.wav")) ; https://freesound.org/people/.Andre_Onate/sounds/484665/

(use-package org-drill
  :after org
  :ensure t)

(use-package org-bullets
  :after org
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-auto-tangle
  :after org
  :ensure t
  :config
  (add-hook 'org-mode-hook 'org-auto-tangle-mode)
  (setq org-auto-tangle-default nil
	calendar-week-start-day 1))

;; AESTHETICS ;;
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package diminish
  :ensure t)

(use-package page-break-lines
  :ensure t
  :config
  (global-page-break-lines-mode))

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-dired
  :after nerd-icons
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package colorful-mode
  :ensure t
  :custom
  (colorful-use-prefix t)
  :config
  (global-colorful-mode t))

;; BUILT-INS ;;
(use-package emacs
  :ensure nil
  :custom
  (scroll-conservatively 101)
  (display-fill-column-indicator-column 80)
  (truncate-lines t)
  (frame-title-format "vi"))

(use-package help
  :ensure nil
  :custom (help-window-select t))

(use-package bytecomp
  :ensure nil
  :custom (byte-compile-warnings nil))

(use-package files
  :ensure nil
  :custom
  (make-backup-files nil))

(use-package startup
  :ensure nil
  :custom
  (inhibit-startup-message nil))

(use-package display-line-numbers
  :ensure nil
  :custom
  (display-line-numbers-type 'relative)
  (column-number-mode t)
  :config
  (global-display-line-numbers-mode))

(use-package display-fill-column-indicator
  :ensure nil
  :config
  (global-display-fill-column-indicator-mode))

(set-face-attribute 'fill-column-indicator nil :foreground "#928374")

(use-package mule
  :ensure nil
  :config
  (set-selection-coding-system      ;; apparently, utf-16-le is best on windows
   (if (eq system-type 'windows-nt) ;; if set to nil, emacs will interpret character encoding based on clipboard contents
       'utf-16-le
     nil)))

(use-package mule-cmds
  :ensure nil
  ;; Allows switching to Ancient Greek keyboard layout with C-\
  :custom (default-input-method "greek-ibycus4"))

(use-package dictionary
  :ensure nil
  :custom
  (dictionary-server "dict.org")
  :bind
  ("C-c C-l" . dictionary-lookup-definition))

(use-package simple
  :ensure nil
  :config
  (global-visual-line-mode 1))

(use-package novice
  :ensure nil
  :config
  ;; Enables all commands that are disabled by default
  (setq disabled-command-function nil))

(use-package cus-edit
  :ensure nil
  :custom
  (custom-file null-device "Don't store customizations"))

(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

(use-package delsel
  :ensure nil
  :init
  (delete-selection-mode 1))

(use-package elec-pair
  :ensure nil
  :custom
  (electric-pair-pairs '((?\' . ?\') (?\" . ?\") (?\{ . ?\})))
  :hook (after-init . electric-pair-mode))

(use-package frame
  :ensure nil
  :config
  (blink-cursor-mode 1))

(use-package css-mode
  :ensure nil
  :custom
  ;; Can interfere with colorful-mode
  (css-fontify-colors nil))

;; HL-TODO ;;
;; (use-package hl-todo-mode
  ;; :ensure t
  ;; :config
  ;; (global-hl-todo-mode))

;; PDF TOOLS ;;
(use-package pdf-tools
  :ensure t
  :config
  (pdf-loader-install)
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-tools-enable-minor-modes))
  :hook
  (pdf-tools-enable-minor-modes . display-line-numbers-mode))

;; EXPAND REGION ;;
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

;; POLYMODE ;;
;; (use-package poly-org
  ;; :ensure t
  ;; :config
  ;; (add-to-list 'auto-mode-alist '("\\.org" . poly-org-mode)))
; seems to cause issues with org mode source blocks

;; DOOM MODELINE ;;
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; ANZU
(use-package anzu
  :ensure t
  :config (global-anzu-mode))

;; EDITORCONFIG ;;
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; SERVER ;;
(use-package server
  :ensure nil
  :config
  (unless (server-running-p)
    (server-start)))

;; GIT ;;
;; Emacs' built-in transient does not meet magit's version requirement
(use-package transient
  :ensure t)

(use-package magit
  :after (nerd-icons transient)
  :ensure t
  :bind ("C-x g" . magit-status)
  :custom
  (magit-format-file-function #'magit-format-file-nerd-icons))

(use-package magit-todos
  :after magit
  :ensure t
  :config (magit-todos-mode 1))

(use-package diff-hl
  :ensure t
  :config
  (diff-hl-margin-mode)
  (diff-hl-dired-mode)
  (diff-hl-flydiff-mode)
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

;; PROJECTILE ;;
;; (use-package projectile
  ;; :ensure t
  ;; :config
  ;; (projectile-mode 1)
  ;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; DASHBOARD ;;
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (add-to-list 'dashboard-items '(agenda) t)
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name))
	dashboard-startup-banner '2
	dashboard-center-content t
	dashboard-vertically-center-content t
	dashboard-show-shortcuts t
	dashboard-display-icons-p t
	dashboard-icon-type 'nerd-icons
	;dashboard-set-heading-icons t
	dashboard-set-file-icons t
	dashboard-week-agenda t
	dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
  (setq dashboard-items '((agenda . 5)
			  (recents . 5)))
					;(projects . 5)))
  (setq dashboard-startupify-list '(dashboard-insert-banner
				    dashboard-insert-init-info
				    dashboard-insert-items)))

;; COMPLETIONS ;;
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :after marginalia
  :ensure t
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides nil))

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-quit-at-boundary 'separator)
  (corfu-echo-documentation 0.25)
  (corfu-preview-current 'insert)
  (corfu-preselect-first nil)
  :init
  (global-corfu-mode)
  :config
  (setq corfu-popupinfo-delay '(0.25 . 0.25))
  (corfu-popupinfo-mode 1))

(use-package nerd-icons-corfu
  :after corfu
  :ensure t
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

;; NEOTREE ;;
(use-package neotree
  :after nerd-icons
  :ensure t
  :bind ("<f8>" . neotree-toggle)
  :config
  (setq neo-theme (if (display-graphic-p) 'nerd-icons 'arrow))
  (custom-set-variables '(neo-window-position (quote right))))

;; BREADCRUMB ;;
(use-package breadcrumb
  :ensure t
  :config
  (fset 'breadcrumb--project-crumbs-1 #'ignore))

; seems useless. better done with C-u, maybe macros?
;; MULTIPLE CURSORS ;;
;; (use-package multiple-cursors
  ;; :ensure t
  ;; :config
  ;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  ;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  ;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  ;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; TREE SITTER ;;
(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :after tree-sitter
  :ensure t
  :config
  (require 'tree-sitter-hl)
  (require 'tree-sitter-debug)
  (require 'tree-sitter-query))

;; EGLOT ;;
;; Fixes error "feature project is now provided by a different file" 
(load "project.elc")
(load "xref.elc")

;; (setq eglot-report-progress nil)

(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format nil t)))

;; (use-package eglot-booster
  ;; :ensure t
  ;; :after eglot
  ;; :config (eglot-booster-mode))

(use-package markdown-mode
  :ensure t)

(use-package nix-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))

(use-package rust-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))

(use-package go-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
	       '(nix-mode . ("nixd"))
	       '(go-mode . ("gopls"))))
	       ;; '(rust-mode . ("rust-analyzer"))))
	       ;; '(c-mode . ("ccls"))))

(setq c-default-style "k&r")
(add-hook 'nix-mode-hook 'eglot-ensure)
(add-hook 'shell-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'java-mode-hook 'eglot-ensure)
(add-hook 'csharp-mode-hook 'eglot-ensure)
(add-hook 'html-mode-hook 'eglot-ensure)
(add-hook 'css-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)

(add-to-list 'auto-mode-alist '("\\.csproj\\'" . xml-mode))

;; SHARPER ;;
(use-package sharper
  :after transient
  :ensure t
  :bind
  ("C-c n" . sharper-main-transient))

;; DAPE ;;
(use-package dape
  :ensure t)

;; WEB DEV ;;
(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package skewer-mode
  :after js2-mode
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode))

(use-package web-mode
  :ensure t
  :mode
  (("\\.cshtml\\'" . web-mode)
   ("\\.aspx\\'" . web-mode)))

(use-package emmet-mode
  :ensure t)

;; YASNIPPET
(use-package yasnippet
  :ensure t
  :config
  ;; Shouldn't need this with global mode turned on
  ;; (yas-reload-all)
  (yas-global-mode)
  ;; Binds snippet expansion to space; Tab is taken up by corfu
  (define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand))

(use-package yasnippet-snippets
  :after yasnippet
  :ensure t)

;; ENVRC ;;
;; Must be placed last in config
(use-package envrc
  :ensure t
  :config (envrc-global-mode))
