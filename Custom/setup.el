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
    "."   '(company-complete-common :which-key "Complete at point with Company")
    "|"   '(company-select-next :which-key "Complete at point with Company")
    )
 )

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


;; (use-package theme-looper
;;   :ensure t
;;   :config
;; ;Configure theme-looper
;; (theme-looper-set-customizations 'powerline-reset)
;; (load-theme 'material)
;; )
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-opera t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)


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
