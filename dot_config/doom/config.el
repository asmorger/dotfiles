(global-set-key (kbd "M-RET")  'lsp--execute-code-action) ; Alt+Enter

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;; test

(setq! doom-font (font-spec :family "CommitMono" :size 16))
;; (setq! doom-font (font-spec :family "CommitMono" :size 16))
(setq! doom-unicode-font (font-spec :family "CaskaydiaCove Nerd Font Mono" :size 14))

;;
;; See 'C-h v doom-font' for manually load a theme with the
;; `load-theme' function. This is the default:
;;
;; `gruvbox-material' contrast and palette options
;;(setq doom-gruvbox-material-background  "medium"  ; or hard (defaults to soft)
;;     doom-gruvbox-material-palette     "material") ; or original (defaults to material)

;;(setq doom-theme 'doom-laserwave)
;;(setq doom-theme 'doom-miramare)
(setq doom-theme 'doom-tomorrow-day)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")
(setq org-roam-directory "~/roam")

;;(after! org
;;        (setq org-roam-directory "~/org/.roam")
;;        (setq org-roam-index-file "~/org/.roam/index.org"))

(add-hook 'org-mode-hook 'org-auto-tangle-mode)

(after! org
  (setq org-agenda-files '("~/org/agenda.org")))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")

(setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
      org-agenda-files (directory-files-recursively "~/org/" "\\.org$")
      )

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
;; (company-tng-configure-default)

(setq projectile-project-search-path '(("~/dev/work" . 1) ("~/dev/personal" . 1) ("~/dev/training" . 1)("~/roam") ))

(after! spell-fu
  (setq spell-fu-idle-delay 0.5))

(setq! vterm-shell "fish")
