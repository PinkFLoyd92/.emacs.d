(require 'evil-mc)
(require 'multiple-cursors)
(global-evil-mc-mode  1) ;; enable

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(evil-define-key 'visual evil-mc-key-map
  "A" #'evil-mc-make-cursor-in-visual-selection-end
  "I" #'evil-mc-make-cursor-in-visual-selection-beg)

(global-unset-key (kbd "M-u"))
(global-unset-key (kbd "M-i"))

(global-set-key (kbd "M-i") 'mc/mark-next-like-this-word)
(global-set-key (kbd "M-u") 'mc/mark-previous-like-this-word)
