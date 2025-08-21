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
