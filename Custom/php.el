(require 'php-mode)
(require 'flycheck)
(add-hook 'php-mode-hook (lambda ()
			   (add-to-list 'flycheck-enabled-checkers 'php)
			   (add-to-list 'flycheck-disabled-checkers 'php-phpcs)
			   (add-to-list 'flycheck-disabled-checkers 'php-phpmd)
			   (php-enable-symfony2-coding-style)
			   (require 'ac-php)
			   (ac-php-mode 1)
			   (setq ac-sources  '(ac-source-php ) )
			   (yas-global-mode 1)
			   (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
			   (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
(require 'company-php)
             (company-mode t)
             (add-to-list 'company-backends 'company-ac-php-backend ))
			   )
(use-package php-mode :ensure t
  :config
  (eval-after-load 'php-mode
  '(require 'php-ext))
  (eval-after-load 'flycheck
    '(add-to-list 'flycheck-enabled-checkers 'php-phpmd))
  )
