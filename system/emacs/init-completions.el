(use-package icomplete
  :ensure nil
  :custom
  (tab-always-indent 'complete)
  (icomplete-delay-completions-threshold 0)
  (icomplete-max-delay-chars 0)
  (icomplete-compute-delay 0)
  (icomplete-show-matches-on-no-input t)
  ;; icomplete-in-buffer gives corfu-like functionality
  ;; However, corfu has the following features that I like:
  ;; -allows scrolling
  ;; -nerd icons
  ;; -really nice info popup box (eldoc?)
  ;; -opens automatically whenever completions are available
  
  ;; icomplete-in-buffer also has the following problems:
  ;; -marginalia makes it look bad, need to figure out how to disable it
  ;;   -maybe there's a hook I could use? or maybe advice-add?
  ;; -the completions always appear at far left of screen, instead of at point
  ;;   -simple patch to fix this on Rahul Juliato's blog, maybe it gets upstreamed?
  ;; (icomplete-in-buffer t)
  (icomplete-prospects-height 10)
  (icomplete-separator " . ")
  :config
  (advice-add 'completion-at-point
              :after #'minibuffer-hide-completions)
  (icomplete-vertical-mode 1))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :after marginalia
  :ensure t
  :config (nerd-icons-completion-mode))

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
