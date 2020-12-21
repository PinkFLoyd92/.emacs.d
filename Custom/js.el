(require 'auto-complete)
(require 'company)
(require 'nodejs-repl)
(require 'jquery-doc)
(require 'flycheck)
;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

;; Custom eslint function
(defun loadEslint ()
  "eslint function"
  (interactive)
  (message (concat flycheck-javascript-eslint-executable  " --fix " (buffer-file-name)))
  (shell-command(concat flycheck-javascript-eslint-executable " --fix " (buffer-file-name))) )

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("pages\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("hooks\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))
(add-to-list 'magic-mode-alist '("import React" . rjsx-mode) )


;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)


(use-package prettier-js
  :ensure t
  :after (rjsx-mode)
  :hook (rjsx-mode . prettier-js-mode))

(add-hook 'js2-mode-hook
  (lambda ()
    (nvm-use-for)
    (company-mode 0)
    ;; (add-to-list 'company-backends )
    (hs-minor-mode 1)
    (auto-complete-mode)
    (setq js2-strict-missing-semi-warning nil)
    (setq js2-basic-offset 2)
    (setq js2-missing-semi-one-line-override nil)
    (js2-minor-mode)
    (js2-refactor-mode 1)
    (js2r-add-keybindings-with-prefix "C-c C-m")
    (setq js2-highlight-level 3) ;;highlighting of many Ecma built-in functions.
    (setq-default js2-show-parse-errors nil)
    (use-package general :ensure t
      :config
      (general-define-key
        :states '(normal visual insert emacs)
        :keymaps 'local
        :prefix "SPC"
        :non-normal-prefix "C-SPC"
        "br" '(loadEslint :which-key "Eval-eslint")
        )))


  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1)
    (editorconfig-apply)
    )
  )

;; (add-hook 'tern-mode-hook
;;   (lambda ()
;;     (use-package general :ensure t
;;       :config
;;       (general-define-key
;;         :states '(normal visual insert emacs)
;;         :keymaps 'local
;;         :prefix "SPC"
;;         :non-normal-prefix "C-SPC"
;;         "dd" '(tern-get-docs :which-key "Tern Get Docs")
;;         "dc" '(tern-get-type :which-key "Tern Get Type")
;;         )))


;;   (use-package editorconfig
;;     :ensure t
;;     :config
;;     (editorconfig-mode 1)
;;     (editorconfig-apply)
;;     )
;;   )

;; customizable...

;; (if (eq system-type 'windows-nt)
;;   (setq tern-command '("node" "<TERN LOCATION>\\bin\\tern")))
;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")
;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 "node_modules"))
          (eslint (and root
                    (expand-file-name "node_modules/eslint/bin/eslint.js"
                      root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))


(use-package general
  :ensure t
  :init
  (general-define-key
    :prefix "SPC"
    :non-normal-prefix "C-SPC"
    :states '(normal visual insert emacs)
    "tt" '((lambda () (interactive) (js2-mode)) :which-key "Activate js2 mode")
    ))


;; (add-hook 'js2-mode-hook
;;   (lambda()
;;     (use-package ivy :ensure t
;;       :config
;;       (general-define-key
;;         :states '(normal visual insert emacs)
;;         :keymaps 'local
;;         :prefix "C-c"
;;         "v" '(ivy-push-view :which-key "activate js2 mode")
;;         "V" '(ivy-pop-view :which-key "Activate js2 mode")
;;         ))
;;     ))
