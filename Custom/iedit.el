
(defun my:iedit-launch ()
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "fe" '(iedit-mode :which-key "Edit multiple ocurrences")
   )
  )
(use-package iedit :ensure t
  :config
  (my:iedit-launch)
  )
