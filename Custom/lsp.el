(require 'lsp-mode)
(require 'lsp-imenu)
(require 'lsp-ui)

(defun my-company-transformer (candidates)
  (let ((completion-ignore-case t))
    (all-completions (company-grab-symbol) candidates)))

(defun my-js-hook nil
  (make-local-variable 'company-transformers)
  (push 'my-company-transformer company-transformers))

;;(add-hook 'js-mode-hook 'my-js-hook)

;;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

(defun my-set-projectile-root ()
  (when lsp--cur-workspace
    (setq projectile-project-root (lsp--workspace-root lsp--cur-workspace))))
(add-hook 'lsp-before-open-hook #'my-set-projectile-root)

;; (use-package lsp-javascript-typescript
;;     :commands (lsp-javascript-typescript-enable)
;;     :init
;;     (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
;;     (add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
;;     (add-hook 'js2-mode-hook #'lsp-javascript-typescript-enable) ;; for js2-mode support
;;     (add-hook 'rjsx-mode #'lsp-javascript-typescript-enable) ;; for rjsx-mode support
;;     )
