(require 'general)
(general-evil-setup)
;; (general-nmap "SPC" (general-simulate-key "C-c"))

;; bind a key globally in normal state; keymaps must be quoted
(setq general-default-keymaps 'evil-normal-state-map)
;; bind j and k in normal state globally
(general-define-key
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line)

(general-emacs-define-key 'insert
  :prefix "C-SPC"
  "/" 'swiper)

(general-define-key
 :keymaps '(normal insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
  "1" 'revert-buffer)

;; `evil-change' is not bound in `evil-visual-state-map' by default but
;; inherited from `evil-normal-state-map'
;; if you don't want "c" to be affected in visual state, you should add this
(general-vmap "c" 'evil-change)
