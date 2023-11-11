;;; -*- lexical-binding: t; -*-



;; Sets default font on all graphical frames for emacsclient
(set-frame-font "Intel One Mono 12")
(add-to-list  'default-frame-alist '(font . "Intel One Mono 12"))

(set-face-attribute 'default nil
                    :font "Intel One Mono 12"
                    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
                    :font "Intel One Mono 12"
                    :weight 'medium)

;; Makes commented text and keywords italics.
(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)
;; Set custom line heights
(setq-default line-spacing 0.12)
  