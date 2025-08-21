(use-package magit
  :after nerd-icons
  :ensure t
  :bind ("C-x g" . magit-status)
  :custom
  (magit-format-file-function #'magit-format-file-nerd-icons))

(use-package magit-todos
  :after magit
  :ensure t
  :config (magit-todos-mode 1))

(use-package diff-hl
  :after magit
  :ensure t
  :config
  (diff-hl-margin-mode)
  (diff-hl-dired-mode)
  (diff-hl-flydiff-mode)
  (global-diff-hl-mode)
  :hook (magit-post-refresh-hook . diff-hl-magit-post-refresh))
