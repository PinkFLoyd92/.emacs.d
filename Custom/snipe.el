(require 'evil-snipe)
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)

(add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
