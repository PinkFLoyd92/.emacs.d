
(use-package  etags :ensure t
  :config
(add-hook 'c-mode-common-hook
  (lambda ()
    (setq company-backends '(company-etags company-irony))))
  )
