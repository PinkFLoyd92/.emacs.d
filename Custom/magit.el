(use-package magit
  :ensure t
  :config
(add-hook 'magit-mode-hook (lambda()
			    (local-set-key (kbd "C-c r") 'revert-buffer)
			    ))
  )


;; (use-package evil-magit
;;   :ensure t
;;   :config
;;   (lambda ()
;;      (evil-define-key evil-magit-state magit-mode-map "?" 'evil-search-backward)
;;     )
;;   )
