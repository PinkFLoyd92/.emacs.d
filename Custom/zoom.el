(use-package zoom
  :config
  (zoom-mode t))

(custom-set-variables
 '(zoom-size '(0.618 . 0.618)))

(global-set-key (kbd "C-x +") 'zoom)
(defun size-callback ()
  (cond ((> (frame-pixel-width) 1280) '(90 . 0.75))
        (t                            '(0.5 . 0.5))))

(custom-set-variables
 '(zoom-size 'size-callback))
