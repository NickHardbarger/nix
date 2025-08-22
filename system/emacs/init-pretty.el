(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

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

;; Temporary
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
(use-package vundo
  :ensure t
  ;; I use C-/ for regular undo
  :bind ("C-x u" . vundo))
