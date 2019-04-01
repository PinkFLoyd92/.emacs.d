(require 'flycheck)
(require 'general)
(add-hook 'after-init-hook #'global-flycheck-mode)

(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "C-SPC"
 "es"   '(flycheck-select-checker :which-key "Select Checker")
 "el"   '(flycheck-list-errors :which-key "List the errors")
 )
