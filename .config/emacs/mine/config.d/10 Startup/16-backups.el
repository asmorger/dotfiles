;;; -*- lexical-binding: t; -*-

;; By default, Emacs creates automatic backups of files in their original directories, such "file.el" and the backup "file.el~".  This leads to a lot of clutter, so let's tell Emacs to put all backups that it creates in the =TRASH= directory.

(setq backup-directory-alist '((".*" . "~/.local/share/Trash/files")))

;; By default,Emacs creates lock/autosave files in their original directories, such as "#file.el#".  Disable this behavior.
(setq create-lockfiles nil)

;; The default is nil and that means that every time it makes one of those backups~, it actually moves your file there, copies the backup to the original name, and gives you the copy to work on. This isn’t just a philosophical dilemma (“Am I a butterfly that dreams I am a backup~?”) but actually breaks hardlinks. I can’t believe this is the default
(setq backup-by-copying t)

