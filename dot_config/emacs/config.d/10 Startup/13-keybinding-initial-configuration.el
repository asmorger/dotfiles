;;; -*- lexical-binding: t; -*-



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
  :config
  (setq asm:leader-map (make-sparse-keymap))
  (general-create-definer general-def-leader
    :keymaps '(asm:leader-map normal insert visual emacs))
  (general-def package-menu-mode-map "U" 'package-menu-mark-upgrades))



(use-package which-key
  :demand t
  :init
    (which-key-mode 1)
  :diminish
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

(general-def-leader
   "SPC" '(execute-extended-command :wk "Counsel M-x"))
