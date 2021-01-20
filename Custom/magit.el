(use-package magit
  :ensure t
  :config
(add-hook 'magit-mode-hook (lambda()
			    (local-set-key (kbd "C-c r") 'revert-buffer)
			    ))
  )

(use-package evil-magit)
