;; -*- mode: elisp -*-
(setq inhibit-startup-message nil
      visible-bell t
      display-line-numbers 'relative
      scroll-conservatively most-positive-fixnum
      modus-themes-mode-line '(accented)
      modus-themes-region '(accented) ;(bg-only)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-paren-match '(bold intense)
      modus-themes-syntax '(alt-syntax))
(require 'org)
;(require 'ob-shell)
(require 'gruvbox-theme)
(require 'magit)
;; NEOTREE ;;
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; TREE SITTER ;;
(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
(add-hook 'after-init-hook 'global-company-mode)
(server-start)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)))
(menu-bar-mode -1)
(global-display-line-numbers-mode 1)
(hl-line-mode 1)
(blink-cursor-mode 1)
(load-theme 'gruvbox-dark-hard t)
; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)
