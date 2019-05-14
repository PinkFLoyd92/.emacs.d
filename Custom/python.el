(elpy-enable)
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
(setq flycheck-python-pycompile-executable "python3")

(add-hook 'python-mode-hook (lambda ()
			      (hs-minor-mode 1)
			      (setenv "PYTHONIOENCODING" "utf-8")
			      (setenv "LANG" "en_US.UTF-8")
			      (company-mode -1)
			      (auto-complete-mode 0)
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

(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq-default python-indent-guess-indent-offset nil)
            (setq python-indent-offset 4)))

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended))

;; anaconda
(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  )

(use-package company-anaconda
  :config
  (add-to-list 'company-backends 'company-anaconda))

