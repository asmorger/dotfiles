;;; -*- lexical-binding: t; -*-



(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

(load-directory "~/.dotfiles/.config/emacs/mine/config.d")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(corfu orderless which-key vterm-toggle transpose-frame toc-org sudo-edit rainbow-mode rainbow-delimiters projectile perspective peep-dired org-superstar org-roam org-bullets org-auto-tangle ob-mermaid ob-fsharp neotree multiple-cursors meow magit lsp-ui lsp-ivy hl-todo git-timemachine general flycheck-aspell eshell-syntax-highlighting eglot-fsharp dtrt-indent doom-themes doom-modeline dired-open diminish dashboard counsel company-box circadian auto-package-update all-the-icons-ivy-rich all-the-icons-dired))
 '(safe-local-variable-values
   '((org-roam-db-location . "/home/hawkbane/dev/20-Personal/24-Projects/dev-signals/doc/org-roam.db")
     (org-roam-directory . "/home/hawkbane/dev/20-Personal/24-Projects/dev-signals/doc/org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
