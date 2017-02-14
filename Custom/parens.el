(use-package smartparens :ensure t
  :init
  (require 'smartparens-config)
  :config
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  (smartparens-global-mode 1)
  (smartparens-global-strict-mode)
  )
