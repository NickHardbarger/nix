(setq inhibit-startup-message nil
      visible-bell t
      display-line-numbers 'relative
      scroll-conservatively most-positive-fixnum
      make-backup-files nil)

(server-start)
(require 'magit)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
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

;; EGLOT ;;
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format nil t)))

(with-eval-after-load 'eglot
  (dolist (mode '((nix-mode . ("nixd"))))
    (add-to-list 'eglot-server-programs mode)))

;; LSP ;;
;(require 'lsp-mode)
;;(add-hook 'XXX-mode-hook #'lsp-deferred)
;(with-eval-after-load 'lsp-mode
;  (lsp-register-client
;    (make-lsp-client :new-connection (lsp-stdio-connection "nixd")
;                     :major-modes '(nix-mode)
;                     :priority 0
;                     :server-id 'nixd)))
;(setq gc-cons-percentage 100000000
;      read-process-output-max (* 1024 1024)
;      lsp-idle-delay 0.500
;      lsp-log-io nil
;      lsp-keymap-prefix "C-c l"
;      lsp-nix-nixd-server-path "nixd"
;      lsp-nix-nixd-formatting-command [ "nixfmt" ]
;      lsp-nix-nixd-nixpkgs-expr "import <nixpkgs> { }"
;      lsp-nix-nixd-nixos-options-expr "(builtins.getFlake \"/home/nb/nixos\").nixosConfigurations.mnd.options"
;      lsp-nix-nixd-home-manager-options-expr "(builtins.getFlake \"/home/nb/nixos\").homeConfigurations.\"nb@mnd\".options")
;
;(add-hook 'nix-mode-hook
;         ;; enable autocompletion with company
;         (setq company-idle-delay 0.1))

;; MELPA ;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)
