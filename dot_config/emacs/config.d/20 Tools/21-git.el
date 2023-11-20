;;; -*- lexical-binding: t; -*-


;; [[https://github.com/emacsmirror/git-timemachine][git-timemachine]] is a program that allows you to move backwards and forwards through a file's commits.  'SPC g t' will open the time machine on a file if it is in a git repo.  Then, while in normal mode, you can use 'CTRL-j' and 'CTRL-k' to move backwards and forwards through the commits.
(use-package git-timemachine
  :after git-timemachine
  :hook (evil-normalize-keymaps . git-timemachine-hook)
  :config
    (evil-define-key 'normal git-timemachine-mode-map (kbd "C-j") 'git-timemachine-show-previous-revision)
    (evil-define-key 'normal git-timemachine-mode-map (kbd "C-k") 'git-timemachine-show-next-revision)
)

;; magit
(use-package magit)
