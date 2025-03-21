;;; -*- lexical-binding: t; -*-


;;; Code:


;; explanation:
;;
;; general-def-leader binds into sk:leader-map
;;   → leader keybinds are the same for all major-modes
;;   → keybinds accessible by SPC key using meow keypad mode
;;
;; general-def-localleader binds into mode-specific maps under prefix "<menu>"
;;   → localleader keybinds vary depending on the major-mode
;;   → keybinds currently not accessible in meow keypad mode



;; (use-package general
;;   :config
;;   (setq asm:leader-map (make-sparse-keymap))

(use-package general
  :config
  (general-evil-setup)

  (general-create-definer general-def-leader
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set leader
    :global-prefix "M-SPC")

  (general-def-leader
    "b" '(nil :wk "Buffers")
    "b b" '(switch-to-buffer :wk "Switch buffer")
    "b i" '(ibuffer :wk "Ibuffer")
    "b k" '((lambda () (interactive)(kill-buffer (current-buffer))) :wk "Kill this buffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer"))


  (general-def-leader
    "d" '(:ignore t :wk "Dired")
    "d d" '(dired :wk "Open dired")
    "d j" '(dired-jump :wk "Dired jump to current")
    "d n" '(neotree-dir :wk "Open directory in neotree")
    "d p" '(peep-dired :wk "Peep-dired"))

  (general-def-leader
    "e" '(:ignore t :wk "Evaluate")    
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "e d" '(eval-defun :wk "Evaluate defun containing or after point")
    "e e" '(eval-expression :wk "Evaluate and elisp expression")
    "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "e r" '(eval-region :wk "Evaluate elisp in region")) 

  (general-def-leader
    "." '(find-file :wk "Find File")
    "f" '(:ignore t :,wk "Files")
    "f c" '((lambda () (interactive) (find-file "~/.config/emacs/config.org")) :wk "Edit emacs config")
    "f d" '(find-grep-dired :wk "Search for string in files in DIR")
    "f g" '(counsel-grep-or-swiper :wk "Search for string current file")
    "f h" '((lambda () (interactive) (find-file "~/")) :wk "Edit emacs config")
    "f j" '(counsel-file-jump :wk "Jump to a file below current directory")
    "f l" '(counsel-locate :wk "Locate a file")
    "f r" '(counsel-recentf :wk "Find recent files")
    "f s" '(projectile-grep :wk "Search project")
    )

  (general-def-leader
    "g" '(:ignore t :which-key "Git")    
    "g /" '(magit-displatch :wk "Magit dispatch")
    "g ." '(magit-file-displatch :wk "Magit file dispatch")
    "g b" '(magit-branch-checkout :wk "Switch branch")
    "g c" '(:ignore t :wk "Create") 
    "g c b" '(magit-branch-and-checkout :wk "Create branch and checkout")
    "g c c" '(magit-commit-create :wk "Create commit")
    "g c f" '(magit-commit-fixup :wk "Create fixup commit")
    "g C" '(magit-clone :wk "Clone repo")
    "g f" '(:ignore t :wk "Find") 
    "g f c" '(magit-show-commit :wk "Show commit")
    "g f f" '(magit-find-file :wk "Magit find file")
    "g f g" '(magit-find-git-config-file :wk "Find gitconfig file")
    "g F" '(magit-fetch :wk "Git fetch")
    "g g" '(magit-status :wk "Magit status")
    "g i" '(magit-init :wk "Initialize git repo")
    "g l" '(magit-log-buffer-file :wk "Magit buffer log")
    "g r" '(vc-revert :wk "Git revert file")
    "g s" '(magit-stage-file :wk "Git stage file")
    "g t" '(git-timemachine :wk "Git time machine")
    "g u" '(magit-stage-file :wk "Git unstage file"))

  (general-def-leader
    "h" '(:ignore t :which-key "Help")
    "h f" '(describe-function :wk "Describe function")
    "h v" '(describe-variable :wk "Describe variable"))

  (general-def-leader
    "j" '(:ignore t :which-key "Jump")
    "j c" '(avy-goto-char :wk "Goto char")
    "j l" '(avy-goto-line :wk "Goto line")
    "j w" '(avy-goto-word-1 :wk "Goto word")
   )

  (general-def-leader
    "n" '(:ignore t :wk "Notes")
    "n l" '(org-roam-buffer-toggle :wk "Toggle notes buffer")
    "n f" '(org-roam-node-find :wk "Find note")
    "n I" '(org-roam-node-insert-immediate :wk "Insert Note Immediately")
    "n n" '(org-roam-dailies-capture-today :wk "Today's Journal")
    "n N" '(org-roam-dailies-goto-today :wk "Review Today's Journal")
    "n y" '(org-roam-dailies-capture-yesterday :wk "Yesterday's Journal")
    "n Y" '(org-roam-dailies-goto-yesterday :wk "Review Yesterday's Journal")
    "n t" '(org-roam-dailies-capture-tomorrow :wk "Tomorrow's Journal")
    "n T" '(org-roam-dailies-goto-tomorrow :wk "Review Tomorrow's Journal")
    "n d" '(org-roam-dailies-capture-date) :wk "Journal at date"
    "n D" '(org-roam-dailies-goto-date :wk "Go to journal for day")
    "n B" '(org-roam-dailies-goto-previous-note :wk "Goto previous note")
    "n F" '(org-roam-dailies-goto-next-note :wk "Goto next note")
    ;; "n p f" '(my/org-roam-find-project :wk "Go to Project")
    ;; "n p i" '(my/org-roam-capture-inbox :wk "Capture Inbox")
    ;; "n p t" '(my/org-roam-cature-task :wk "Capture Project task")
    )

  (general-def-leader
    "o" '(:ignore t :wk "Org")
    "o a" '(org-agenda :wk "Org agenda")
    "o c t" '(org-toggle-checkbox :wk "Toggle checkbox")
    "o d" '(:ignore t :wk "Date/deadline")
    "o d t" '(org-time-stamp :wk "Org time stamp")
    "o e" '(org-export-dispatch :wk "Org export dispatch")
    "o i" '(org-toggle-item :wk "Org toggle item")
    "o t" '(org-todo :wk "Org todo")
    "o B" '(org-babel-tangle :wk "Org babel tangle")
    "o T" '(org-todo-list :wk "Org todo list"))

  (general-def-leader
    "r" '(:ignore t :wk "Refactor")
    "r r" '(eglot-rename :wk "Rename Symbol")
  )

  (general-def-leader
    "s" '(:ignore t :wk "Selection")
    "s nn" '(mc/mark-next-like-this :wk "Select next")
  )

  (general-def-leader
    "p" '(projectile-command-map :wk "Projectile"))

  (general-def-leader
    "q" '(:ignore t :wk "Config")
    ;;"r r" '(reload-init-file :wk "Reload emacs config"))
    "q q" '((lambda () (interactive)
              (load-file "~/.config/emacs/init.el"))
            :wk "Reload emacs config"))

  (general-def-leader
    "t" '(:ignore t :wk "Terminal / Toggle")
    "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
    "t n" '(neotree-toggle :wk "Toggle neotree file viewer")
    "t t" '(vterm-toggle :wk "Toggle vterm")
    "t h" '(counsel-esh-history :wk "Terminal history"))

  (general-def-leader
    "w" '(:ignore t :wk "Windows")
    ;; Window splits
    "w k" '(delete-window :wk "Close window")
    "w s" '(split-window-below :wk "Horizontal split window")
    "w v" '(split-window-right :wk "Vertical split window")
    ;; Window motions
    "w m" '(windmove-left :wk "Window left")
    "w n" '(windmove-down :wk "Window down")
    "w e" '(windmove-up :wk "Window up")
    "w i" '(windmove-right :wk "Window right")
    "w w" '(other-window :wk "Goto next window")
    ;; Move Windows
    "w M" '(buf-move-left :wk "Buffer move left")
    "w N" '(buf-move-down :wk "Buffer move down")
    "w E" '(buf-move-up :wk "Buffer move up")
    "w I" '(buf-move-right :wk "Buffer move right"))

)

(setup-define :leader
  (lambda (&rest args)
    `(with-eval-after-load 'general
        (general-define-key ,@args
                            :states 'normal
                            :keymaps 'override
                            :prefix "SPC"
                            :global-prefix "C-SPC")))
  :documentation "Define a leader keybind"
  :debug '(form)
  :indent 0)
  

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

;;(general-def-leader
;;   "SPC" '(execute-extended-command :wk "Standard M-x"))
