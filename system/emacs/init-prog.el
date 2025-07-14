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
