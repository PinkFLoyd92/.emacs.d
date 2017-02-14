(use-package company 
             :ensure t
             :config
             (global-company-mode))
(use-package undo-tree 
             :ensure t
  :config 
(global-undo-tree-mode))



(use-package ace-jump-mode
  :ensure t
  :config

;Set up ace-jump-mode
(autoload 'ace-jump-mode 
  "ace-jump-mode" 
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark 
  "ace-jump-mode" 
  "Ace jump back:-"
  t)
  )


(use-package powerline
  :ensure t
  :config
;Enable powerline
(powerline-center-theme)
(setq powerline-default-separator
      'slant)
)


(use-package theme-looper
  :ensure t
  :config
;Configure theme-looper
(theme-looper-set-theme-set '(deeper-blue
                              wheatgrass
                              wombat
                              material))
(theme-looper-set-customizations 'powerline-reset)
)


(use-package general :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
    "hrt" 'theme-looper-enable-next-theme
    ))
