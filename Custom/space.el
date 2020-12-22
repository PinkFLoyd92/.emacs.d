(use-package avy :ensure t)
(use-package which-key :ensure t
  :config
  (which-key-mode 1))
(use-package evil :ensure t
  :config
  (evil-mode 1)
  )
(global-set-key (kbd "C-k") (lambda () (interactive) (search-forward (car swiper-history))))
(global-set-key (kbd "C-j") (lambda () (interactive) (search-backward (car swiper-history))))
(general-define-key
 ;; replace default keybindings
 "/" '(swiper :which-key "Search for string in buffer")
 "M-x" '(helm-M-x :which-key "Helm-M-x")       ; replace default M-x with ivy backend
 )

(use-package general :ensure t
  :config
  (require 'helm)
(setq helm-descbinds-window-style 'same-window)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

    "TAB" '(switch-to-prev-buffer :which-key "Previous Buffer")
    "<backtab>" '(switch-to-next-buffer :which-key "Next Buffer")
    "SPC" '(avy-goto-word-or-subword-1  :which-key "Find Character")
    "a" '(:ignore t :which-key "Applications")
    "ar" '(ranger :which-key "Ranger")
    "ad" '(dired :which-key "Dired")
    "x" '(helm-M-x :which-key "Helm M-x")
    "ff" '(helm-find-files :which-key "Find files")
    "hdf" '(describe-function :which-key "Describe Function")
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
