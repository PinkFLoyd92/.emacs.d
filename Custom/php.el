(require 'php-mode)
(require 'flycheck)

(setq-default php-manual-path "")

(add-hook 'php-mode-hook (lambda ()
			   (eval-after-load 'php-mode
			     '(require 'php-ext))
			   (eval-after-load 'flycheck
			     '(add-to-list 'flycheck-enabled-checkers 'php-phpmd))
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
			   (company-mode 1)
			   (auto-complete-mode -1)
(require 'php-auto-yasnippets)
(require 'general)
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'local
 :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "TAB"   '(yas/create-php-snippet :which-key "Complete PHP using Yasnippet")))
)
