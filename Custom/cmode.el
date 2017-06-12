;; ;; == irony-mode ==
;; (use-package irony
;;   :ensure t
;;   :defer t
;;   :init
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
;;   :config
;;   ;; replace the `completion-at-point' and `complete-symbol' bindings in
;;   ;; irony-mode's buffers by irony-mode's function
;;   (defun my-irony-mode-hook ()
;;     (define-key irony-mode-map [remap completion-at-point]
;;       'irony-completion-at-point-async)
;;     (define-key irony-mode-map [remap complete-symbol]
;;       'irony-completion-at-point-async))
;;   (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;  )

;; ;; == company-mode ==
;; (use-package company
;;   :ensure t
;;   :defer t
;;   :init (add-hook 'after-init-hook 'global-company-mode)
;;   :config
;;   (use-package company-irony :ensure t :defer t)
;;   (setq company-idle-delay              nil
;; 	company-minimum-prefix-length   2
;; 	company-show-numbers            t
;; 	company-tooltip-limit           20
;; 	company-dabbrev-downcase        nil
;; 	company-backends                '((company-irony company-gtags))
;; 	)
;;   :bind ("C-;" . company-complete-common)

;; )

;; (require 'company-c-headers)
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/lib/modules/4.11.3-1-ARCH/build/include/linux")

;; (add-hook 'c-mode-hook
;;           (lambda () (setq flycheck-clang-include-path
;;                            (list (expand-file-name "/lib/modules/4.11.3-1-ARCH/build/include")))))


;; (add-hook 'c++-mode-hook
;;           (lambda () (setq flycheck-clang-include-path
;;                            (list (expand-file-name "/lib/modules/4.11.3-1-ARCH/build/include")))))

(defun my:c-style ()
   (setq c-default-style "linux"))
(use-package xcscope 
  :ensure t
  :defer t
  :config
  (add-hook 'c-mode-hook 'my:c-style) 
  (add-hook 'c++-mode-hook 'my:c-style) 
  )
