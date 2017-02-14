(use-package projectile 
             :ensure t
	     :init
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(require 'general)
(require 'helm-projectile)
(helm-projectile-on)
             :config
             (projectile-global-mode)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
    "pI"   '(helm-projectile-invalidate-cache :which-key "Invalidate Cache")
    "pp"   '(helm-projectile-switch-project :which-key "Switch Project")
    "pf"   '(helm-projectile-find-file :which-key "Find file in Project")
 ))
