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
  (setq-default indent-tabs-mode nil)
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

  (setq web-mode-enable-auto-closing t)
  (local-set-key (kbd "RET") 'newline-and-indent)
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

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsxhint-checker)
              (flycheck-mode))))

(general-define-key :states '(normal visual)
                    :keymaps 'web-mode-map
                    "za" 'web-mode-fold-or-unfold)


(general-define-key :states '(normal insert emacs)
                    :keymaps 'web-mode-map
                    :prefix "SPC"
                    :non-normal-prefix "C-SPC"
                    :keymaps 'web-mode-map
                    "ee" 'web-mode-element-close
                    "ea" 'web-mode-element-content-select
                    "ei" 'web-mode-element-insert
                    "ec" 'web-mode-element-clone
                    "ep" 'web-mode-element-previous
                    "ek" 'web-mode-element-kill
                    "er" 'web-mode-element-rename
                    "eu" 'web-mode-element-parent
                    "ew" 'web-mode-element-wrap
                    "en" 'web-mode-element-next
                    "es" 'web-mode-element-select
		    )
