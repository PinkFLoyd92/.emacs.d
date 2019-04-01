;; added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'cask "/usr/share/cask/cask.el")
(require 'cl)
(cask-initialize)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq evil-want-keybinding nil)
'
(setq tramp-default-method "ssh")
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
(setq default-fill-column 60)		; toggle wrapping text at the 80th character
(mouse-avoidance-mode)
(mouse-avoidance-banish)
(auto-compression-mode 1)
(require 'bookmark)

(bookmark-bmenu-list)
;; (switch-to-buffer "*Bookmark List*")
(setq custom-safe-themes t)
(global-vim-empty-lines-mode)
(setq browse-url-browser-function 'eww-browse-url)
(set-face-attribute 'default nil :font "Monaco-10")
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default evil-want-integration nil)
(setq-default max-specpdl-size 32000)
(setq-default max-lisp-eval-depth 10000)

(require 'package)
(require 'use-package)

(load-file "~/.emacs.d/Custom/markdown.el")
(load-file "~/.emacs.d/Custom/resize.el")
(load-file "~/.emacs.d/Custom/whitespaces.el")
(load-file "~/.emacs.d/Custom/winner.el")
(load-file "~/.emacs.d/Custom/elisp.el")
(load-file "~/.emacs.d/Custom/automode.el")
(load-file "~/.emacs.d/Custom/parens.el")
(load-file "~/.emacs.d/Custom/remap.el")
(load-file "~/.emacs.d/Custom/space.el")
(load-file "~/.emacs.d/Custom/setup.el")
(load-file "~/.emacs.d/Custom/evil.el")
(load-file "~/.emacs.d/Custom/evil-collection.el")
(load-file "~/.emacs.d/Custom/projectile.el")
(load-file "~/.emacs.d/Custom/flycheck.el")
(load-file "~/.emacs.d/Custom/php.el")
(load-file "~/.emacs.d/Custom/webmode.el")
(load-file "~/.emacs.d/Custom/magit.el")
(load-file "~/.emacs.d/Custom/latex.el")
(load-file "~/.emacs.d/Custom/js.el")
(load-file "~/.emacs.d/Custom/python.el")
(load-file "~/.emacs.d/Custom/matchit.el")
(load-file "~/.emacs.d/Custom/folding.el")
(load-file "~/.emacs.d/Custom/bookmark.el")
(load-file "~/.emacs.d/Custom/navigation.el")
(load-file "~/.emacs.d/Custom/yas.el")
(load-file "~/.emacs.d/Custom/elfeed.el")
(load-file "~/.emacs.d/Custom/hydra.el")
(load-file "~/.emacs.d/Custom/yaml.el")
(load-file "~/.emacs.d/Custom/stylus.el")
(load-file "~/.emacs.d/Custom/editorconfig.el")
(load-file "~/.emacs.d/Custom/cmode.el")
(load-file "~/.emacs.d/Custom/iedit.el")
(load-file "~/.emacs.d/Custom/multiple-cursors.el")
(load-file "~/.emacs.d/Custom/cypher-mode.el")
(load-file "~/.emacs.d/Custom/surround.el")
(load-file "~/.emacs.d/Custom/meghanada.el")
(load-file "~/.emacs.d/Custom/generalEvil.el")
(load-file "~/.emacs.d/Custom/avy.el")
(load-file "~/.emacs.d/Custom/coffee.el")
(load-file "~/.emacs.d/Custom/ivy.el")
(load-file "~/.emacs.d/Custom/ruby.el")
(load-file "~/.emacs.d/Custom/dashboard.el")
(load-file "~/.emacs.d/Custom/zoom.el")
(load-file "~/.emacs.d/Custom/tabbar.el")
(load-file "~/.emacs.d/Custom/lsp.el")
(load-file "~/.emacs.d/Custom/esh-custom.el")
(load-file "~/.emacs.d/Custom/neotree.el")

(setenv "PATH" (concat (getenv "PATH") "/home/sebas/.config/yarn/global/node_modules/.bin/"))
(setq exec-path (append exec-path '("/home/sebas/.config/yarn/global/node_modules/.bin/")))

(require 'ansi-color)
(defun display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(evil-collection-setup-minibuffer t)
 '(fci-rule-color "#37474f")
 '(flycheck-checker-error-threshold 400)
 '(flycheck-javascript-eslint-executable "/home/sebas/.config/yarn/global/node_modules/.bin/eslint")
 '(hl-sexp-background-color "#1c1f26")
 '(lsp-project-whitelist nil)
 '(package-selected-packages
   (quote
    (ivy-mode c-mode company-irony irony yasnippet which-key web-mode use-package theme-looper switch-window smex smartparens ranger prodigy powerline popwin php-mode pallet nyan-mode neotree myterminal-controls multiple-cursors meta-presenter material-theme magit idle-highlight-mode htmlize helm-projectile general flycheck-cask expand-region exec-path-from-shell evil drag-stuff dired-launch counsel company buffer-move auto-complete ace-window ace-jump-mode)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-root . "/home/sebas/Projects/reserva.api")
     (projectile-project-name . "reserva.api")
     (projectile-enable-caching)
     (projectile-project-root . "/home/sebas/Projects/cancha-app")
     (projectile-project-name . "CanchaAPP")
     (projectile-project-name . Cancha-APP)
     (projectile-enable-caching . t))))
 '(tramp-syntax (quote default) nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(zoom-size (quote size-callback)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/.emacs.d/flow-for-emacs/flow.el")
