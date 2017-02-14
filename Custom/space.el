(use-package avy :ensure t)
(use-package evil :ensure t
  :config
  (evil-mode 1)
  )
(general-define-key
 ;; replace default keybindings
 "C-s" 'swiper             ; search for string in current buffer
 "M-x" 'counsel-M-x        ; replace default M-x with ivy backend
 )

(use-package general :ensure t
  :config
  (require 'helm)
(setq helm-descbinds-window-style 'same-window)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

    "/"   'counsel-ag
    "TAB" '(switch-to-prev-buffer :which-key "Previous Buffer")
    "<backtab>" '(switch-to-next-buffer :which-key "Next Buffer")
    "SPC" '(avy-goto-word-or-subword-1  :which-key "Find Character")
    "a" '(:ignore t :which-key "Applications")
    "ar" 'ranger
    "ad" 'dired
    "x" 'helm-M-x
    "ff" 'helm-find-files
    "hdf" 'describe-function
    "hdk" 'describe-key
    "hdm" 'describe-mode
    "hdv" 'describe-variable
    ))

(use-package ranger :ensure t
  :config
  (setq ranger-cleanup-on-disable t)
  (setq ranger-cleanup-eagerly t)
(setq ranger-show-dotfiles t)
(setq ranger-modify-header t)
(setq ranger-hide-cursor nil)
(setq ranger-footer-delay 0.2)
(setq ranger-preview-delay 0.040)
(setq ranger-parent-depth 2)
(setq ranger-width-parents 0.12)
(setq ranger-max-parent-width 0.12)
(setq ranger-preview-file t)
(setq ranger-show-literal t)
(setq ranger-width-preview 0.55)
(setq ranger-excluded-extensions '("mkv" "iso" "mp4"))
(setq ranger-max-preview-size 10)
(setq ranger-dont-show-binary t)
)
