;; -*- mode: elisp -*-
(setq inhibit-startup-message t
      visible-bell t
      display-line-numbers 'relative
      modus-themes-mode-line '(accented)
      modus-themes-region '(accented) ;(bg-only)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-paren-match '(bold intense)
      modus-themes-syntax '(alt-syntax))
(require 'org
	 'gruvbox-theme)
	 ;ob-shell)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)))
(menu-bar-mode -1)
(global-display-line-numbers-mode 1)
(hl-line-mode 1)
(blink-cursor-mode 1)
(load-theme 'manoj-dark t)
;; EVIL MODE ;;
; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

; Enable Evil
(require 'evil)
(evil-mode -1) ; refraining from evil... for now
(custom-set-variables
 ; custom-set-variables was added by Custom.
 ; If you edit it by hand, you could mess it up, so be careful.
 ; Your init file should contain only one such instance.
 ; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ; custom-set-faces was added by Custom.
 ; If you edit it by hand, you could mess it up, so be careful.
 ; Your init file should contain only one such instance.
 ; If there is more than one, they won't work right.
 )
