; PACKAGES
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

; THEME
(straight-use-package 'gruvbox-theme)
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-medium t)

; TRANSPARENCY
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook #'on-after-init)
;; [[https://stackoverflow.com/questions/19054228/emacs-disable-theme-background-color-in-terminal/33298750#33298750][Emacs: disable theme background color in terminal - Stack Overflow]]
(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))
(add-hook 'after-make-frame-functions #'on-frame-open)

; GENERAL
(setq inhibit-startup-message nil
	visible-bell t
	scroll-conservatively most-positive-fixnum
	make-backup-files nil)
(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(straight-use-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 1)
(straight-use-package 'hyperbole)
(hyperbole-mode 1)
(straight-use-package 'diminish)
(require 'diminish)
(straight-use-package 'page-break-lines)
(global-page-break-lines-mode)
(straight-use-package 'nerd-icons)
(require 'nerd-icons)
(add-to-list 'default-frame-alist
           '(font . "JetBrainsMonoNF-12"))
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

; POLYMODE
(use-package poly-org
  :straight t)
(add-to-list 'auto-mode-alist '("\\.org" . poly-org-mode))

; DOOM MODELINE
(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1))

; EDITORCONFIG
(use-package editorconfig
  :straight t
  :config
  (editorconfig-mode 1))

; SERVER
(require 'server)
(unless (server-running-p)
  (server-start))

; MAGIT
(straight-use-package 'magit)
(require 'magit)
(define-key global-map (kbd "C-x g") 'magit-status)
(use-package 'magit-todos
  :straight t
  :after magit
  :config (magit-todos-mode 1))

; PROJECTILE
(straight-use-package 'projectile)
(projectile-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

; DASHBOARD
(straight-use-package 'dashboard)
(require 'dashboard)
(dashboard-setup-startup-hook)
(add-to-list 'dashboard-items '(agenda) t)
(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name))
	dashboard-banner-logo-title "[https://github.com/NickHardbarger]"
	dashboard-startup-banner 'official ;2
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
			;(bookmarks . 5)
			;(projects . 5)
			;(registers . 5)))
  
(setq dashboard-startupify-list '(dashboard-insert-banner
				  dashboard-insert-newline
				  dashboard-insert-banner-title
				  dashboard-insert-newline
				  dashboard-insert-navigator
				  dashboard-insert-newline
				  dashboard-insert-init-info
				  dashboard-insert-items
				  dashboard-insert-newline
				  dashboard-insert-footer))

; IVY
(straight-use-package 'ivy)
(ivy-mode)
(setq ivy-use-virtual-buffers t
      enable-recursive-minibuffers t)

; ORG
(require 'org)
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (shell . t)))
(straight-use-package 'org-bullets)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(straight-use-package 'org-auto-tangle)
(require 'org-auto-tangle)
(add-hook 'org-mode-hook 'org-auto-tangle-mode)
(setq org-auto-tangle-default nil
      calendar-week-start-day 1)
(add-to-list 'org-agenda-files "~/notes/agenda.org")
(setq org-clock-sound "~/.emacs.d/ding.wav") ; https://freesound.org/people/.Andre_Onate/sounds/484665/

; NEOTREE
(straight-use-package 'neotree)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

; SMARTPARENS
(straight-use-package 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)

; MULTIPLE CURSORS
(straight-use-package 'multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

; TREE SITTER
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-langs)
(require 'tree-sitter-debug)
(require 'tree-sitter-query)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

; EGLOT
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format nil t)))
(straight-use-package 'nix-mode)
(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
	       '(nix-mode . ("nixd"))))
(add-hook 'nix-mode-hook 'eglot-ensure)
(add-hook 'shell-mode-hook 'eglot-ensure)
(add-hook 'perl-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'java-mode-hook 'eglot-ensure)
(add-hook 'html-mode-hook 'eglot-ensure)
(add-hook 'css-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)

; WEB DEV
(straight-use-package 'js2-mode)
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(straight-use-package 'skewer-mode)
(require 'skewer-mode)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(use-package web-mode
  :straight t
  :mode
  (("\\.cshtml\\'" . web-mode)
   ("\\.aspx\\'" . web-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(org-fold-core-style 'overlays))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
