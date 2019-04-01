(use-package general
  :ensure t
  :init
  (general-define-key
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   :states '(normal visual insert emacs)
    "vb" '(point-to-register :which-key "Save position in register.")
    "vv" '(jump-to-register :which-key "Jump to register.")
    ))
