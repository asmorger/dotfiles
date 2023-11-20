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
  (org-superstar-special-todo-items t)
  (org-superstar-item-bullet-alist '((?- . ?•) (?* . ?–) (?+ . ?◦)))
  (org-superstar-prettify-item-bullets t)
  (org-superstar-todo-bullet-alist '(("DONE" . ?✔)
                                     ("TODO" . ?⌖)
                                     ("ISSUE" . ?)))
  (org-superstar-headline-bullets-list '("✪" "○" "✸" "◉" )))

;; https://jft.home.blog/2019/07/17/use-unicode-symbol-to-display-org-mode-checkboxes/
(add-hook 'org-mode-hook (lambda ()
  "Beautify Org Checkbox Symbol"
  (push '("[ ]" .  "☐") prettify-symbols-alist)
  (push '("[X]" . "☑" ) prettify-symbols-alist)
  (push '("[-]" . "❍" ) prettify-symbols-alist)
  (prettify-symbols-mode)))

(defface org-checkbox-done-text
  '((t (:foreground "#71696A" :strike-through t)))
  "Face for the text part of a checked org-mode checkbox.")

(font-lock-add-keywords
 'org-mode
 `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
    1 'org-checkbox-done-text prepend))
 'append)
