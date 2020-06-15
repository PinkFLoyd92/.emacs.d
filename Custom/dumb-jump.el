(use-package dumb-jump :ensure t
  :init
(require 'general)
  (general-define-key
   :states '(normal visual emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "go"   '(dumb-jump-go-other-window :which-key "Go to other window")
   "gj" '(dumb-jump-go :which-key "Go to")
   "gb" '(dumb-jump-back :which-key "Go back")
   "gi" '(dumb-jump-go-prompt :which-key "Go to prompt")
   "gx" '(dumb-jump-go-prefer-external :which-key "Go to external")
   "gz" '(dumb-jump-go-prefer-external-other-window :which-key "Go to external other window")
   )
  )
