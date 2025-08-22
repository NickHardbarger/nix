;;; early-init.el --- Emacs pre package.el & UI configuration -*- lexical-binding: t; -*-
;;; Code:

(setq inhibit-default-init nil
      native-comp-async-report-warnings-errors nil)

;; GC
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
	  (lambda () (setq gc-cons-threshold (* 1000 1000 8)))) ;; 8mb

;; UI
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(alpha-background . 90) default-frame-alist)
(push '(fullscreen . maximized) default-frame-alist)

(push '(font . "JetBrainsMonoNF-12") default-frame-alist)
(set-face-font 'default "JetBrainsMonoNF-12")
(set-face-font 'variable-pitch "DejaVu Sans")
(copy-face 'default 'fixed-pitch)

(setq-default fill-column 80)
(global-display-fill-column-indicator-mode)
(set-face-attribute 'fill-column-indicator nil :foreground "#928374")

;; Allows switching to Ancient Greek keyboard layout with C-\
(setq default-input-method "greek-ibycus4")

(setq column-number-mode t)

(advice-add #'x-apply-session-resources :override #'ignore)

(setq server-client-instructions nil
      frame-inhibit-implied-resize t
      ring-bell-function #'ignore
      inhibit-startup-screen t
      frame-title-format "emacs")

;; TODO: make it look pretty
(setq-default mode-line-format
	      '("%e" mode-line-front-space
		(:eval (if (eq (buffer-modified-p) t)
			   (format "%s  " (propertize
					 (buffer-name) 'face 'warning))
			 (format "%s  " (propertize
				       (buffer-name) 'face 'bold))))
		mode-line-position (project-mode-line project-mode-line-format)
		(:eval (format "%s" (propertize
				      (symbol-name major-mode) 'face 'bold)))
	        (vc-mode vc-mode)
		(:propertize ("" flymake-mode-line-format))
		(:propertize (" " current-input-method-title))))

(provide 'early-init)
;;; early-init.el ends here
