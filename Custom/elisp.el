(require 'flyspell)
(defun load-ielm ()
  (interactive)
  (let ((window(ielm)))
    (require 'ace-window)
    (switch-to-buffer-other-window window)
    (ace-swap-window)
    )
  )

(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode) 
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (local-set-key (kbd "C-x c") 'load-ielm)
				  ))


(add-hook 'emacs-lisp-mode-hook (lambda ()
			      (hs-minor-mode 1)
			      (use-package general :ensure t
				:config
				(general-define-key
				 :states '(normal visual insert emacs)
				:keymaps 'local
				 :prefix "SPC"
				 :non-normal-prefix "C-SPC"
				 "nh" '(mark-defun :which-key "Mark the Python function")
				 "bf" '(eval-buffer :which-key "Send File to Python Interpreter")
				 "bh" '(lisp-eval-defun :which-key "Send function to Python Interpreter")
				 "br" '(eval-region :which-key "Send File to Python Interpreter")
				 )
				(local-set-key (kbd "M-n")  'elpy-nav-move-line-or-region-down)
				(local-set-key (kbd "M-m")  'elpy-nav-move-line-or-region-up)
				)))
