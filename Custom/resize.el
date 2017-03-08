(use-package resize-window :ensure t
  :init
(require 'general)
  (general-define-key
   :states '(normal visual emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
    "r"   '(resize-window :which-key "Resize the current window"))

  )
