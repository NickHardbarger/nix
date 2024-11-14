;; GENERAL ;;
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
(hyperbole-mode 1)

;; PROJECTILE ;;
(projectile-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; IVY ;;
(ivy-mode)
(setq ivy-use-virtual-buffers t
      enable-recursive-minibuffers t)

;; TRANSPARENCY ;;
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

;; THEME ;;
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)

;; ORG ;;
(require 'org)
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (shell . t)))
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(require 'org-auto-tangle)
(add-hook 'org-mode-hook 'org-auto-tangle-mode)
(setq org-auto-tangle-default t)

;; NEOTREE ;;
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; SMARTPARENS ;;
(require 'smartparens-config)
(smartparens-global-mode t)

;; MULTIPLE CURSORS ;;
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; TREE SITTER ;;
(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-langs)
(require 'tree-sitter-debug)
(require 'tree-sitter-query)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; EGLOT ;;
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format nil t)))
(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
	       '(nix-mode . ("nixd"))))
(add-hook 'nix-mode-hook 'eglot-ensure)
(add-hook 'shell-mode-hook 'eglot-ensure)
(add-hook 'perl-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot ensure)
(add-hook 'java-mode-hook 'eglot ensure)
(add-hook 'html-mode-hook 'eglot-ensure)
(add-hook 'css-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)

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
