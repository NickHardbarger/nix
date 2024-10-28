(setq inhibit-startup-message nil
      visible-bell t
      display-line-numbers 'relative
      scroll-conservatively most-positive-fixnum)

(server-start)
(require 'magit)
(add-hook 'after-init-hook 'global-company-mode)
(menu-bar-mode -1)
(global-display-line-numbers-mode 1)
(hl-line-mode 1)
(blink-cursor-mode 1)

;; THEME ;;
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)

;; ORG ;;
(require 'org)
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (shell . t)))

;; NEOTREE ;;
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; TREE SITTER ;;
(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; MELPA ;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)
