(use-package hydra :ensure t
  :config
  (defhydra hydra-launcher (:color blue)
    "Launch"
    ("h" man "man")
    ("r" (browse-url "http://www.reddit.com/r/emacs/") "reddit")
    ("w" (browse-url "http://www.emacswiki.org/") "emacswiki")
    ("s" shell "shell")
    ("q" nil "cancel"))
  (global-set-key (kbd "C-c r") 'hydra-launcher/body)
  )
