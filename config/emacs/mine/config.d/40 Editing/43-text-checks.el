;;; -*- lexical-binding: t; -*-


;; Install =luacheck= from your Linux distro's repositories for flycheck to work correctly with lua files. Install =python-pylint= for flycheck to work with python files. Haskell works with flycheck as long as =haskell-ghc= or =haskell-stack-ghc= is installed. For more information on language support for flycheck, [[https://www.flycheck.org/en/latest/languages.html][read this]].

(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :init (global-flycheck-mode))

;; spell check
(setq ispell-dictionary "en_US")
(setq ispell-program-name "aspell")
(setq ispell-silently-savep t)

(use-package flycheck-aspell
  :ensure t
  :defer t
  :diminish
  :init
  (add-to-list 'flycheck-checkers 'markdown-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'c-aspell-dynamic)

  (add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
  (add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
  (add-to-list 'ispell-skip-region-alist '("~" "~"))
  (add-to-list 'ispell-skip-region-alist '("=" "="))

  (add-to-list 'flycheck-checkers 'org-aspell-dynamic))