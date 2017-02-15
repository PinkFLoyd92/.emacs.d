(use-package smartparens :ensure t
  :init
  (require 'smartparens-config)
  (show-paren-mode 1)
  :config

(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  (smartparens-global-mode 1)
  (smartparens-global-strict-mode)
  )
