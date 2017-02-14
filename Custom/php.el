(use-package 'php-mode :ensure t
  :config
(eval-after-load 'php-mode
  '(require 'php-ext)
(eval-after-load 'flycheck
  '(add-to-list 'flycheck-checkers 'php-phpmd))
  )
  )
