(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (python-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(setq exec-path (append exec-path '("~/.nvm/versions/node/v14.12.0/bin")))

;; Disable lsp-ui flymake default integration

;; https://github.com/emacs-lsp/lsp-ui/issues/226

(setq lsp-prefer-flymake nil)


;;(use-package typescript-mode :ensure t)
(use-package lsp-ui :ensure t)
(use-package js2-mode :ensure t)
(use-package rjsx-mode :ensure t)
;; LSP requirements on the server

;; sudo npm i -g typescript-language-server; sudo npm i -g typescript

;; sudo npm i -g javascript-typescript-langserver


(use-package lsp-mode

:ensure t

:config

(add-hook 'typescript-mode-hook 'lsp)

(add-hook 'js2-mode-hook 'lsp)

(add-hook 'rjsx-mode-hook 'lsp)

(add-hook 'php-mode 'lsp)

(add-hook 'css-mode 'lsp)

(add-hook 'web-mode 'lsp))


(use-package company-lsp :ensure t)

(use-package yasnippet :ensure t)


(setq lsp-language-id-configuration '((java-mode . "java")

(python-mode . "python")

(anaconda-mode . "python")

(gfm-view-mode . "markdown")

(rust-mode . "rust")

(css-mode . "css")

(xml-mode . "xml")

(c-mode . "c")

(c++-mode . "cpp")

(objc-mode . "objective-c")

(web-mode . "html")

(html-mode . "html")

(sgml-mode . "html")

(mhtml-mode . "html")

(go-mode . "go")

(haskell-mode . "haskell")

(php-mode . "php")

(json-mode . "json")

(js2-mode . "javascript")

(rjsx-mode . "javascript")

(typescript-mode . "typescript")

))

;; LSP debugging

;;(setq lsp-print-io t)

;;(setq lsp-trace t)

;;(setq lsp-print-performance t)


(use-package tide

:ensure t

:init

(setq tide-tsserver-executable "~/.nvm/versions/node/v14.12.0/bin/tsserver"))


(defun setup-tide-mode ()

(interactive)

(tide-setup)

(flycheck-mode +1)

(setq flycheck-check-syntax-automatically '(save mode-enabled))

(eldoc-mode +1)

(tide-hl-identifier-mode +1)

(company-mode +1))

; aligns annotation to the right hand side

(setq company-tooltip-align-annotations t)

;; formats the buffer before saving

(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after default javascript checker
(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
