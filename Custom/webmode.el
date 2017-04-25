(use-package web-mode :ensure t
  :config
  (company-mode 0)
  (require 'emmet-mode)
  (defun setup-emmet (map hook)
    "Setup emmet key bindings for MAP and HOOK."
    (add-hook hook 'emmet-mode)
    (define-key map (kbd "C-c .") 'emmet-next-edit-point)
    (define-key map (kbd "C-c ,") 'emmet-prev-edit-point)
    (define-key map (kbd "C-c j") 'emmet-expand-line))

  (setup-emmet web-mode-map 'web-mode-hook)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-style-padding 1)
  (setq web-mode-block-padding 1)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-ac-sources-alist
	'(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
	  ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
	  ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

  )

(defun activate_js()
  "."
  (interactive "r")
  (js2-mode)
  (message "Activated js2-mode.")
  )

(defun activate_web()
  "."
  (interactive "r")
    (web-mode)
    (message "Activated Web Mode.")
 )

(defun toggle-web-mode ()
  "Doc."
  (if (bound-and-true-p web-mode)
      (activate_js)
    (activate_web))
  )
(use-package general
  :ensure t
  :init
  (general-define-key
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   :states '(normal visual insert emacs)
   "tj" '((lambda () (interactive) (toggle-web-mode)) :which-key "Toggle between web-mode and js2-mode")
   ))
