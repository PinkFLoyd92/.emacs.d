
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) )
(setq vc-follow-symlinks t )
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome in Emacs") ; print a default message in the empty scratch buffer opened at startup
(setq custom-safe-themes t)
(global-vim-empty-lines-mode)

(require 'package)
(require 'use-package)

(load-file "~/.emacs.d/Custom/whitespaces.el")
(load-file "~/.emacs.d/Custom/elisp.el")
(load-file "~/.emacs.d/Custom/automode.el")
(load-file "~/.emacs.d/Custom/parens.el")
(load-file "~/.emacs.d/Custom/remap.el")
(load-file "~/.emacs.d/Custom/space.el")
(load-file "~/.emacs.d/Custom/setup.el")
(load-file "~/.emacs.d/Custom/evil.el")
(load-file "~/.emacs.d/Custom/projectile.el")
(load-file "~/.emacs.d/Custom/flycheck.el")
(load-file "~/.emacs.d/Custom/php.el")
(load-file "~/.emacs.d/Custom/webmode.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(package-selected-packages
   (quote
    (yasnippet which-key web-mode use-package theme-looper switch-window smex smartparens ranger prodigy powerline popwin php-mode pallet nyan-mode neotree myterminal-controls multiple-cursors meta-presenter material-theme magit idle-highlight-mode htmlize helm-projectile general flycheck-cask expand-region exec-path-from-shell evil drag-stuff dired-launch counsel company buffer-move auto-complete ace-window ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
