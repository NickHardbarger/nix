;; -*- lexical-binding: t; -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archive-priorities '(("gnu" . 20)("melpa" . 10)))

;; Temporary profiling
(use-package use-package-core
  :ensure nil
  :custom (use-package-compute-statistics t))

(load "~/.emacs.d/init-org.el")

(load "~/.emacs.d/init-pretty.el")

;; BUILT-INS ;;
(use-package emacs
  :ensure nil
  :custom
  (scroll-conservatively 101)
  (truncate-lines t))

(use-package help
  :ensure nil
  :custom (help-window-select t))

(use-package bytecomp
  :ensure nil
  :custom (byte-compile-warnings nil))

(use-package files
  :ensure nil
  :custom
  (make-backup-files nil))

(use-package dired
  :ensure nil
  :custom (dired-listing-switches "-Ahgo --color=auto --group-directories-first"))

(use-package dictionary
  :ensure nil
  :custom
  (dictionary-server "dict.org")
  :bind
  ("C-c C-l" . dictionary-lookup-definition))

(use-package simple
  :ensure nil
  :config
  (global-visual-line-mode 1))

(use-package novice
  :ensure nil
  :config
  ;; Enables all commands that are disabled by default
  (setq disabled-command-function nil))

(use-package cus-edit
  :ensure nil
  :custom
  (custom-file null-device "Don't store customizations"))

(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

(use-package delsel
  :ensure nil
  :init
  (delete-selection-mode 1))

(use-package elec-pair
  :ensure nil
  :custom
  (electric-pair-pairs '((?\' . ?\') (?\" . ?\") (?\{ . ?\})))
  :hook (after-init . electric-pair-mode))

(use-package frame
  :ensure nil
  :config
  (blink-cursor-mode 1))

(use-package css-mode
  :ensure nil
  :custom
  ;; Can interfere with colorful-mode
  (css-fontify-colors nil))

(load "~/.emacs.d/init-git.el")

(load "~/.emacs.d/init-completions.el")

(load "~/.emacs.d/init-prog.el")

(use-package pdf-tools
  :ensure t
  :config
  (pdf-loader-install)
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-tools-enable-minor-modes))
  :hook
  (pdf-tools-enable-minor-modes . display-line-numbers-mode))

(use-package anzu
  :ensure t
  :config (global-anzu-mode))

;; Should be enabled after other global minor modes
(use-package envrc
  :ensure t
  :config (envrc-global-mode))

;; SCRATCH BUFFER
(add-hook 'emacs-startup-hook
	  (setq initial-scratch-message
		(concat ";; Emacs " emacs-version
			(emacs-init-time " initialized in %.2f seconds\n"))))
