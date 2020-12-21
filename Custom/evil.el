(require 'general)
;; bind a key globally in normal state; keymaps must be quoted
;;(setq general-default-keymaps 'evil-normal-state-map)
;; bind j and k in normal state globally

;; (general-define-key :keymaps 'company-mode-map
;;                     "M-j" 'company-select-next
;;                     "M-k" 'company-select-previous)

(use-package evil
  :ensure t
  :config
  (setq evil-want-fine-undo 'fine))


(use-package general :ensure t
  :config
  (require 'windmove)
(setq aw-keys '(?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9))
;; not used yet...
(defvar aw-dispatch-alist
'((?x aw-delete-window " Ace - Delete Window")
    (?s aw-swap-window " Ace - Swap Window")
    (?n aw-flip-window)
    (?v aw-split-window-vert " Ace - Split Vert Window")
    (?h aw-split-window-horz " Ace - Split Horz Window")
    (?i delete-other-windows " Ace - Maximize Window")
    (?o delete-other-windows))
"List of actions for `aw-dispatch-default'.")
  (general-define-key
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   :states '(normal visual insert emacs)
   "gp" '(move-line-up :which-key "Move line up")
   "gn" '(move-line-down :which-key "Move line down")
   "gt" '(avy-goto-char-timer :which-key "Avy go to a Word")
   "gc" '(avy-goto-char-timer :which-key "Avy go to a conditional")
    "s" '(ace-select-window :which-key "Ace Select Window")
    "wv" '(split-window-vertically :which-key "split window right")
    "wh" '(split-window-horizontally :which-key "split window left")
    "wx" '(delete-window :which-key "Delete current window")
    "wX" '(delete-other-windows :which-key "Delete other windows")
    "wwx" '(delete-frame :which-key "Delete current frame")
    "wwX" '(delete-other-frames :which-key "Delete other frames")
;;    "h" '(shrink-window-horizontally :which-key "Shrink window horizontally")
    ;; "j" '(shrink-window :which-key "Shrink window vertically")
    "k" '(enlarge-window :which-key "Enlarge window vertically")
    "l" '(enlarge-window-horizontally :which-key "Enlarge window vertically")
    ))


(defun evil-sp--add-bindings ()
  (when smartparens-strict-mode
    (evil-define-key 'normal evil-smartparens-mode-map
      (kbd "d") #'evil-sp-delete
      (kbd "c") #'evil-sp-change
      (kbd "y") #'evil-sp-yank
      (kbd "S") #'evil-sp-change-whole-line
;;      (kbd "X") #'evil-sp-backward-delete-char
      (kbd "X") #'sp-unwrap-sexp
      (kbd "x") #'evil-sp-delete-char)
    (evil-define-key 'visual evil-smartparens-mode-map
      (kbd "X") #'evil-sp-delete
      (kbd "x") #'evil-sp-delete))
  (evil-define-key 'normal evil-smartparens-mode-map
    (kbd "D") #'evil-sp-delete-line
    (kbd "Y") #'evil-sp-yank-line
    (kbd "C") #'evil-sp-change-line)
  (evil-define-key 'insert evil-smartparens-mode-map
    (kbd "DEL") 'sp-backward-delete-char)
  (evil-define-key 'visual evil-smartparens-mode-map
    (kbd "o") #'evil-sp-override)
  (evil-normalize-keymaps))

(use-package evil-smartparens :ensure t
  :config
  (require 'smartparens)
  (evil-sp--add-bindings))
