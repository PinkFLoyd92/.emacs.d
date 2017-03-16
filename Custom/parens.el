(use-package smartparens :ensure t
  :init
  (require 'smartparens-config)
  (show-paren-mode 1)
  :config
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  (smartparens-global-mode 1)
  )

(use-package evil-paredit :ensure t
   :config
   (add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
   )

