(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))

(setq dashboard-set-init-info t)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
