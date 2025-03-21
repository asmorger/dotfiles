;;; -*- lexical-binding: t; -*-


;; This are taken from [[https://idiomdrottning.org/bad-emacs-defaults][Bad Emacs Defaults]].

;; I need to get better at one space between sentences.  Disable that.
(setq sentence-end-double-space nil)

;; Emacs famously has its idiosyncratic brace style and indentation style using a mix of tabs and spaces that no-one else uses.
;; Which would be fine in a vacuum but you end up fighting it when making changes in other people’s projects.
(use-package dtrt-indent
  :config
  (setq dtrt-indent-global-mode t)
  (setcar (alist-get 'dtrt-indent-mode minor-mode-alist) ""))

;; Things can get weird in Linux if the files don't end in a newline
(setq require-final-newline t)

;; Just show trailing whitespace
(setq show-trailing-whitespace t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Better default modes
(electric-pair-mode t)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(global-auto-revert-mode t)

;; show line numbers and truncated lines
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-visual-line-mode 1)