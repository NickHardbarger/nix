;; -*- lexical-binding: t; -*-

;; ELPACA ;;
(load "~/.emacs.d/init-elpaca.el")
(setq use-package-compute-statistics t)
;; ORG ;;
(load "~/.emacs.d/init-org.el")

;; AESTHETICS ;;
(load "~/.emacs.d/init-pretty.el")

;; BUILT-INS ;;
(use-package emacs
  :ensure nil
  :custom
  (scroll-conservatively 101)
  (truncate-lines t)
  ;; Use Super key as Meta, Alt as Alt
  (x-super-keysym 'meta)
  (x-meta-keysym 'alt))

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

(use-package dired
  :ensure nil
  :custom (dired-listing-switches "-Ahgo --color=auto --group-directories-first"))

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

;; COMPLETIONS ;;
(load "~/.emacs.d/init-completions.el")

; seems useless. better done with C-u, maybe macros?
;; MULTIPLE CURSORS ;;
;; (use-package multiple-cursors
  ;; :ensure t
  ;; :config
  ;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  ;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  ;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  ;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; PROGRAMMING ;;
(load "~/.emacs.d/init-prog.el")

;; YASNIPPET
(use-package yasnippet
  :ensure t
  :config
  ;; Shouldn't need this with global mode turned on
  ;; (yas-reload-all)
  (yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet
  :ensure t)

;; ENVRC ;;
;; Should be enabled after other global minor modes
(use-package envrc
  :ensure t
  :config (envrc-global-mode))

;; SCRATCH BUFFER
(add-hook 'emacs-startup-hook
	  (setq initial-scratch-message
		(concat ";; Emacs " emacs-version
			(emacs-init-time " initialized in %.2f seconds\n"))))
