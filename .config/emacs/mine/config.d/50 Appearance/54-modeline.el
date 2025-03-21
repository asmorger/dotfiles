;;; -*- lexical-binding: t; -*-

(use-package diminish)

(setq display-time-format "%l:%M %p %b %y"
      display-time-default-load-average nil)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 35      ;; sets modeline height
        doom-modeline-bar-width 5    ;; sets right bar width
        doom-modeline-persp-name t   ;; adds perspective name to modeline
        doom-modeline-persp-icon t)) ;; adds folder icon next to persp name
