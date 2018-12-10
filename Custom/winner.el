(use-package winner :ensure t
  :config 
  (winner-mode)
  (global-set-key (kbd "C-x C-h") 'winner-undo)
  (global-set-key (kbd "C-x C-l") 'winner-redo)
  )
