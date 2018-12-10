(defun avy-goto-conditional ()
  (interactive)
  (avy--generic-jump "\\s(\\(if\\|cond\\|else\\|when\\|unless\\)\\b" nil 'pre))

;; (use-package general :ensure t
;; 				:config
;; 				(general-define-key
;; 				 :states '(normal visual insert emacs)
;; 				:keymaps 'local
;; 				 :prefix "SPC"
;; 				 :non-normal-prefix "C-SPC"
;; 				 "gm" '(avy-move-line :which-key "Avy move line")
;; 				 "gt" '(avy-goto-char-timer :which-key "Avy go to a Word")
;; 				 "gc" '(avy-goto-char-timer :which-key "Avy go to a conditional")
;; 				 )
