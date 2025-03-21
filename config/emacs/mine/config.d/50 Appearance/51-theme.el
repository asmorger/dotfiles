;;; -*- lexical-binding: t; -*-

(add-to-list 'custom-theme-load-path "~/.dotfiles/my-emacs/themes/")
;; (load-theme 'doom-gruvbox-material t)


(use-package circadian
  :demand t
  :config
  (setq calendar-latitude 46.9336064)
  (setq calendar-longitude -95.0632448)
  (setq circadian-themes '((:sunrise . doom-gruvbox-material-light)
                           (:sunset  . doom-gruvbox-material)))
  (circadian-setup))

(provide '61--theme)
;;; 61--theme.el ends here
