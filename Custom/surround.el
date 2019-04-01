(require 'evil-surround)
(global-evil-surround-mode 1)

(add-hook 'c++-mode-hook (lambda ()
                           (push '(?< . ("< " . " >")) evil-surround-pairs-alist)))

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (push '(?` . ("`" . "'")) evil-surround-pairs-alist)))
