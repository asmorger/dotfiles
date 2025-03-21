;;; -*- lexical-binding: t; -*-


(use-package tree-sitter
  :hook
  ((css-mode
    csharp-mode
    js-mode
    json-mode
    php-mode
    ruby-mode
    rust-mode
    sh-mode
    terraform-mode
    typescript-mode
    yaml-mode) . siren-tree-sitter-mode-enable)

  :preface
  (defun siren-tree-sitter-mode-enable ()
    (tree-sitter-mode t))

  :defer t)

(use-package tree-sitter-langs
  :hook
  (tree-sitter-after-on . tree-sitter-hl-mode))


 ;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

