;; EGLOT ;;
(use-package eglot
  :ensure nil
  :hook
  (nix-mode . eglot-ensure)
  (go-mode . eglot-ensure)
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (csharp-mode . eglot-ensure)
  (java-mode . eglot-ensure)
  (html-mode . eglot-ensure)
  (css-mode . eglot-ensure)
  (js-mode . eglot-ensure)
  (prog-mode .
		  (lambda ()
		    (add-hook 'before-save-hook 'eglot-format nil t)))
  :config
  ;; (setq eglot-report-progress nil)
  (add-to-list 'eglot-server-programs
	       '(nix-mode . ("nixd"))
	       '(go-mode . ("gopls"))))

;; FLYMAKE ;;
(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode))

;; EDITORCONFIG ;;
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; DAPE ;;
(use-package dape
  :ensure t)

;; LANGS ;;
(use-package cc-vars
  :ensure nil
  :custom (c-default-style "k&r"))

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package go-mode
  :ensure t
  :mode "\\.go\\'")

;; DOTNET ;;
(use-package sharper
  :ensure t
  :bind
  ("C-c n" . sharper-main-transient))

(use-package nxml-mode
  :ensure nil
  :mode "\\.csproj\\'")

(use-package web-mode
  :ensure t
  :mode ("\\.cshtml\\'" "\\.aspx\\'"))

(use-package emmet-mode
  :ensure t)
