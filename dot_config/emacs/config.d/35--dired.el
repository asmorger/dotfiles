;;; -*- lexical-binding: t; -*-

(use-package dired-open
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("png" . "sxiv")
                                ("mkv" . "mpv")
                                ("mp4" . "mpv"))))

(use-package peep-dired
  :after dired
  :hook (evil-normalize-keymaps . peep-dired-hook)
  :config
    (evil-define-key 'normal dired-mode-map (kbd "m") 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map (kbd "i") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
    (evil-define-key 'normal peep-dired-mode-map (kbd "n") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "e") 'peep-dired-prev-file)
)