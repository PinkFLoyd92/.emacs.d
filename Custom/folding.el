(use-package general :ensure t
				:config
				(general-define-key
				 :states '(normal visual insert emacs)
				 :prefix "SPC"
				 :non-normal-prefix "C-SPC"
				 "z" '(hs-toggle-hiding :which-key "Toggle Code Folding...")
				 "m" '(mark-sexp :which-key "Mark Singular Expression")
				))
