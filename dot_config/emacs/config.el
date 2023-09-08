(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq use-package-always-ensure t)

(use-package color-theme-sanityinc-tomorrow)

(add-hook 'after-init-hook (lambda () (color-theme-sanityinc-tomorrow-day)))

;; explanation:
;;
;; general-def-leader binds into sk:leader-map
;;   → leader keybinds are the same for all major-modes
;;   → keybinds accessible by SPC key using meow keypad mode
;;
;; general-def-localleader binds into mode-specific maps under prefix "<menu>"
;;   → localleader keybinds vary depending on the major-mode
;;   → keybinds currently not accessible in meow keypad mode

(use-package general
  :demand t
  :config
  (setq asm:leader-map (make-sparse-keymap))
  (general-create-definer general-def-leader :keymaps 'asm:leader-map)
  (general-def package-menu-mode-map "U" 'package-menu-mark-upgrades))

(general-def-leader
  "." '(find-file :wk "Find File")
)

(use-package meow)

(setq meow-keypad-leader-dispatch asm:leader-map)

(defun reload-init-file()
   (interactive)
  (load-file "~/.config/emacs/init.el")
)

(defun load-config-file()
  (interactive)
  (find-file "~/.config/emacs/config.org")
)

;; register code blocks as meow things
(meow-thing-register 'org-region '(pair ("#+begin_src emacs-lisp") ("#+end_src")) '(pair ("#+begin_src emacs-lisp") ("#+end")))
(add-to-list 'meow-char-thing-table '(?o . org-region))

(defun meow-setup ()
 (setq meow-cheatsheet-layout meow-cheatsheet-layout-colemak-dh)
 (meow-motion-overwrite-define-key
  ;; Use e to move up, n to move down.
  ;; Since special modes usually use n to move down, we only overwrite e here.
  '("e" . meow-prev)
  '("<escape>" . ignore))

 (meow-leader-define-key
  '("?" . meow-cheatsheet)
  ;; To execute the originally e in MOTION state, use SPC e.
  '("C" . load-config-file)
  '("e" . "H-e")
  '("X" . eval-region)
  ;; '("." . find-file)
  '("R" . reload-init-file)
  '("1" . meow-digit-argument)
  '("2" . meow-digit-argument)
  '("3" . meow-digit-argument)
  '("4" . meow-digit-argument)
  '("5" . meow-digit-argument)
  '("6" . meow-digit-argument)
  '("7" . meow-digit-argument)
  '("8" . meow-digit-argument)
  '("9" . meow-digit-argument)
  '("0" . meow-digit-argument))

 (meow-normal-define-key
  '("0" . meow-expand-0)
  '("1" . meow-expand-1)
  '("2" . meow-expand-2)
  '("3" . meow-expand-3)
  '("4" . meow-expand-4)
  '("5" . meow-expand-5)
  '("6" . meow-expand-6)
  '("7" . meow-expand-7)
  '("8" . meow-expand-8)
  '("9" . meow-expand-9)
  '("-" . negative-argument)
  '(";" . meow-reverse)
  '("," . meow-inner-of-thing)
  '("." . meow-bounds-of-thing)

  '("[" . meow-beginning-of-thing)
  '("]" . meow-end-of-thing)
  '("/" . meow-visit)
  '("a" . meow-append)
  '("A" . meow-open-below)
  '("b" . meow-back-word)
  '("B" . meow-back-symbol)
  '("c" . meow-change)
  '("d" . meow-delete)
  '("e" . meow-prev)
  '("E" . meow-prev-expand)
  '("f" . meow-find)
  '("g" . meow-cancel-selection)
  '("G" . meow-grab)
  '("m" . meow-left)
  '("M" . meow-left-expand)
  '("i" . meow-right)
  '("I" . meow-right-expand)
  '("j" . meow-join)
  '("k" . meow-kill)
  '("l" . meow-line)
  '("L" . meow-goto-line)
  '("h" . meow-mark-word)
  '("H" . meow-mark-symbol)
  '("n" . meow-next)
  '("N" . meow-next-expand)
  '("o" . meow-block)
  '("O" . meow-to-block)
  '("p" . meow-yank)
  '("q" . meow-quit)
  '("r" . meow-replace)
  '("s" . meow-insert)
  '("S" . meow-open-above)
  '("t" . meow-till)
  '("u" . meow-undo)
  '("U" . meow-undo-in-selection)
  '("v" . meow-search)
  '("w" . meow-next-word)
  '("W" . meow-next-symbol)
  '("x" . meow-delete)
  '("X" . meow-backward-delete)
  '("y" . meow-save)
  '("z" . meow-pop-selection)
  '("'" . repeat)
  '("<escape>" . ignore)))


 (require 'meow)
 (meow-setup)
 (meow-global-mode 1)

;; Sets default font on all graphical frames for emacsclient
(add-to-list 'default-frame-alist '(font . "Intel One Mono-14"))

(set-face-attribute 'default nil
                    :font "Intel One Mono"
                    :height 114
                    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
                    :font "Intel One Mono"
                    :height 114
                    :weight 'medium)

;; Makes commented text and keywords italics.
(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)
;; Set custom line heights
(setq-default line-spacing 0.12)

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

(use-package display-line-numbers)

(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)
(global-visual-line-mode 1)

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(electric-indent-mode -1)

(require 'org-tempo)

(use-package sudo-edit)

(use-package which-key
  :init
    (which-key-mode 1)
  :config
    (setq which-key-side-window-location 'bottom
          which-key-sort-order #'which-key-key-order
	    which-key-allow-imprecise-window-fit nil
	    which-key-sort-uppercase-first nil
	    which-key-add-column-padding 1
	    which-key-max-display-columns nil
	    which-key-min-display-lines 6
	    which-key-side-window-slot -10
	    which-key-side-window-max-height 0.25
	    which-key-idle-delay 0.8
	    which-key-max-description-length 25
	    which-key-allow-imprecise-window-fit nil
	    which-key-separator " → " )
      )
