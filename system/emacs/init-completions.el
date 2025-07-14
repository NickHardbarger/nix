(use-package icomplete
  :ensure nil
  :custom
  (icomplete-delay-completions-threshold 0)
  (icomplete-max-delay-chars 0)
  (icomplete-compute-delay 0)
  (icomplete-show-matches-on-no-input t)
  :config
  (icomplete-vertical-mode 1))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :after marginalia
  :ensure t
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides nil))

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-quit-at-boundary 'separator)
  (corfu-echo-documentation 0.25)
  (corfu-preview-current 'insert)
  (corfu-preselect-first nil)
  :init
  (global-corfu-mode)
  :config
  (setq corfu-popupinfo-delay '(0.25 . 0.25))
  (corfu-popupinfo-mode 1))

(use-package nerd-icons-corfu
  :after corfu
  :ensure t
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
