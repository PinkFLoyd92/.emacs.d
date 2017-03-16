(elpy-enable)
(setq python-shell-interpreter "ipython" python-shell-interpreter-args "--simple-prompt -i")

(add-hook 'python-mode-hook (lambda ()
			      (hs-minor-mode 1)
			      (setenv "PYTHONIOENCODING" "utf-8")
			      (setenv "LANG" "en_US.UTF-8")
			      (company-mode 0)
			      (auto-complete-mode 1)
			      (use-package general :ensure t
				:config
				(general-define-key
				 :states '(normal visual insert emacs)
				:keymaps 'local
				 :prefix "SPC"
				 :non-normal-prefix "C-SPC"
				 "nh" '(python-mark-defun :which-key "Mark the Python function")
				 "bf" '(python-shell-send-file :which-key "Send File to Python Interpreter")
				 "bh" '(python-shell-send-defun :which-key "Send function to Python Interpreter")
				 "br" '(python-shell-send-region :which-key "Send File to Python Interpreter")
				 "," '(python-indent-shift-left :which-key "Python Indent to the Left")
				 "." '(python-indent-shift-right :which-key "Python Indent to the Right")
				 )
				(local-set-key (kbd "M-n")  'elpy-nav-move-line-or-region-down)
				(local-set-key (kbd "M-m")  'elpy-nav-move-line-or-region-up)
				)))
