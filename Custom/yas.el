(require 'yasnippet)

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

(yas-reload-all)
