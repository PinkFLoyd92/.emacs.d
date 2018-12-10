(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)

(use-package yasnippet :ensure t
  :init
(require 'general)
  (general-define-key
   :states '(normal visual emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "yy"   '(yas-expand :which-key "Expand the current snippet")
   )

  )
(push "~/.emacs.d/snippets" yas-snippet-dirs)
(push "~/.emacs.d/es6-snippets" yas-snippet-dirs)
(add-to-list 'load-path "~/.emacs.d/es6-snippets")
(require 'es6-snippets)

(yas-reload-all)
