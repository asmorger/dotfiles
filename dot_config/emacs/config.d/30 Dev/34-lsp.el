;;; -*- lexical-binding: t; -*-

;;; Code:

(use-package eglot
  :straight (:type built-in) ;; requires emacs 29
  :init (setq completion-category-overrides '((eglot (styles orderless))))
  :commands eglot
  :config
  (add-to-list 'eglot-server-programs '(haskell-mode . ("haskell-language-server" "--lsp"))))

(add-hook 'prog-mode-hook 'eglot-ensure)

;;; (provide '34-lsp)
;;; 34-lsp.el ends here
