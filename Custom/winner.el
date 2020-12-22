(use-package winner :ensure t
  :config 
  (winner-mode)
  (global-set-key (kbd "C-x C-h") 'winner-undo)
  (global-set-key (kbd "C-x C-l") 'winner-redo)
  (general-define-key
   :keymaps '(normal insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   "wq" '(winner-undo :which-key "winner - go back") 
   "we" '(winner-redo :which-key "winner - go forward"))
  )

