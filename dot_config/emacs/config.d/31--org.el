;;; -*- lexical-binding: t; -*-

;; table of contents
(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

;; diminsh org indent
(eval-after-load 'org-indent '(diminish 'org-indent-mode))

;; disable electric indent
(setq org-edit-src-content-indentation 0)

(add-hook 'org-mode-hook
	  (lambda () (electric-indent-local-mode -1)))

;; org tempo
;; Org-tempo is not a separate package but a module within org that can be enabled.  Org-tempo allows for '<s' followed by TAB to expand to a begin_src tag.  Other expansions available include:

(require 'org-tempo)

;; org superstar
(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
    (org-superstar-remove-leading-stars t)
    (org-superstar-headline-bullets-list '("✪" "○" "✸" "◉" )))

;; org bullets
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
)

