(general-define-key :states '(normal insert emacs)
                    :keymaps 'neotree-mode-map
                    "l" 'neotree-enter
		    )


(general-define-key
 :keymaps '(normal insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "nn" 'neotree-toggle)
