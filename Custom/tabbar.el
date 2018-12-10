(require 'tabbar)

(tabbar-mode)

(use-package general :ensure t
  :config
  (general-define-key
   :prefix "SPC"
    "tl"   '(tabbar-forward :which-key "Tabbar forward")
    "th"   '(tabbar-backward :which-key "Tabbar Backward")
	   ))
