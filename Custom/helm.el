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

(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)

(general-define-key
 :keymaps '(normal insert emacs)
  "/" 'helm-swoop)

(setq helm-swoop-use-fuzzy-match t)
;; Use search query at the cursor  (default)
(setq helm-swoop-pre-input-function
      (lambda () (thing-at-point 'symbol)))

;; Disable pre-input
(setq helm-swoop-pre-input-function
      (lambda () ""))
;; Or, just use M-x helm-swoop-without-pre-input

;; Match only for symbol
(setq helm-swoop-pre-input-function
      (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol))))

;; Always use the previous search for helm. Remember C-<backspace> will delete entire line
(setq helm-swoop-pre-input-function
      (lambda () (if (boundp 'helm-swoop-pattern)
                     helm-swoop-pattern "")))

;; If there is no symbol at the cursor, use the last used words instead.
(setq helm-swoop-pre-input-function
      (lambda ()
        (let (($pre-input (thing-at-point 'symbol)))
          (if (eq (length $pre-input) 0)
              helm-swoop-pattern ;; this variable keeps the last used words
            $pre-input))))

;; If a symbol or phrase is selected, use it as the initial query.
(setq helm-swoop-pre-input-function
      (lambda ()
        (if mark-active
            (buffer-substring-no-properties (mark) (point))
          "")))(setq helm-move-to-line-cycle-in-source nil)


(defun my:helm-ack-hook()
(general-define-key
 :keymaps '(normal insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "ag" '(helm-ag :which-key "Helm AG / Search") 
 "psa" '(helm-projectile-ag :which-key "Helm AG / Search"))
  )

(use-package helm :ensure t
  :config
  (my:helm-ack-hook)
  )
