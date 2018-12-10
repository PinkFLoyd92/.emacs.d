(require 'bookmark)

(with-eval-after-load "bookmark"
  (local-set-key (kbd "1") (lambda () (interactive)
			     ('jump-to-1th-bookmark)))
  (local-set-key (kbd "2") (lambda () (interactive)
			     ('jump-to-2th-bookmark)))
  (local-set-key (kbd "3") (lambda () (interactive)
			     ('jump-to-3th-bookmark)))
  (local-set-key (kbd "4") (lambda () (interactive)
			     ('jump-to-4th-bookmark)))

  (local-set-key (kbd "5") (lambda () (interactive)
			     ('jump-to-5th-bookmark)))

  (local-set-key (kbd "6") (lambda () (interactive)
			     ('jump-to-6th-bookmark)))

  (local-set-key (kbd "7") (lambda () (interactive)
			     ('jump-to-7th-bookmark)))

  (local-set-key (kbd "8") (lambda () (interactive)
			     ('jump-to-8th-bookmark)))
  )
