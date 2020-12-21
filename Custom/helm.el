(require 'helm)
(require 'helm-config)
(helm-mode 1)

(setq helm-split-window-in-side-p       t 
  helm-move-to-line-cycle-in-source     t 
  helm-ff-search-library-in-sexp        t 
  helm-scroll-amount                    8 
  helm-ff-file-name-history-use-recentf t
)
(helm-autoresize-mode t)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) 
(define-key helm-map (kbd "C-z")  'helm-select-action) 

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h") 'helm-command-prefix)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(use-package helm-swoop
  :bind
  ("C-s" . helm-swoop)
)
(setq helm-swoop-pre-input-function (lambda () ""))
(setq helm-move-to-line-cycle-in-source nil)
