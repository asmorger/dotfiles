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

;; org-modern

(use-package org-modern
:hook ((org-mode . org-modern-mode)
        (org-agenda-finalize . org-modern-agenda)))


