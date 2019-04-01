(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'c-mode-common-hook
          (lambda ()
(flycheck-pkg-config)
            (setq flycheck-clang-include-path
                           (list (expand-file-name "/lib/modules/4.11.3-1-ARCH/build/include")))))


(add-hook 'c-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "/lib/modules/4.11.3-1-ARCH/build/include")))))

(add-hook 'c++-mode--hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "/lib/modules/4.11.3-1-ARCH/build/include")))))
(use-package  etags :ensure t
  :config
(add-hook 'c-mode-common-hook
  (lambda ()
    (setq company-backends '(company-etags company-irony company-c-headers company-dabbrev-code company-gtags company-etags company-keywords company-oddmuse company-dabbrev))
    (hs-minor-mode t)
    ))
  )
