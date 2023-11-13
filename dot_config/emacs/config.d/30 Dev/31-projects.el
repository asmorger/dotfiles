;;; -*- lexical-binding: t; -*-

(use-package projectile
  :diminish
  :config
  (projectile-mode 1))

(projectile-global-mode)

(setq projectile-project-search-path '(
  ("~/dev/20-Personal/24-Projects" . 1) 
  ("~/dev/20-Personal/27-Scratch" . 1) 
  ("~/dev/20-Personal/21-Archive" . 1) 
  ("~/dev/30-Work/32-Active-Projects" . 1)
  ("~/.config/emacs/config.d")))
