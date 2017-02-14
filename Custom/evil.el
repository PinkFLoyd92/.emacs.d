(require 'general)
;; bind a key globally in normal state; keymaps must be quoted
;;(setq general-default-keymaps 'evil-normal-state-map)
;; bind j and k in normal state globally

(general-define-key :keymaps 'company-mode-map
                    "M-j" 'company-select-next
                    "M-k" 'company-select-previous)
