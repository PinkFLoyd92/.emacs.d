(use-package company 
             :ensure t
             :config
             (global-company-mode)
 (setq company-idle-delay              0.3
	company-minimum-prefix-length   2
	company-show-numbers            t
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
	)
(require 'general)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
    "."   '(company-complete-common :which-key "Complete at point with Company"))
 )
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
(load-theme 'material)

)

(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(use-package general :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "hrt" '(theme-looper-enable-next-theme :which-key "Enable next theme")
   "qR" '(reload-init-file :which-key "Reload Emacs Configuration")
	   ))

(use-package general :ensure t
  :config
(general-define-key
 "C-x b" '(ibuffer :which-key "Ibuffer"))
  )
