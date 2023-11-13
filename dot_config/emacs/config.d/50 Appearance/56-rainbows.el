;;; -*- lexical-binding: t; -*-



(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode . rainbow-delimiters-mode)
         (clojure-mode . rainbow-delimiters-mode)
         (html-mode . rainbow-delimiters-mode)
         (fsharp-mode . rainbow-delimiters-mode)
         (csharp-mode . rainbow-delimiters-mode)
         (typescript-mode . rainbow-delimiters-mode)
         (tsx-mode . rainbow-delimiters-mode)
         (javascript-mode . rainbow-delimiters-mode)
))

(use-package rainbow-mode
  :diminish
  :hook 
  ((org-mode prog-mode) . rainbow-mode))