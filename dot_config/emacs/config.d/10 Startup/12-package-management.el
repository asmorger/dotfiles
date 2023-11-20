;;; -*- lexical-binding: t; -*-

;; straight.el

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



(setq use-package-verbose t)
(setq use-package-always-defer t)
(setq use-package-always-ensure t)

;; auto update
;; (use-package auto-package-update
;;   :custom
;;   (auto-package-update-interval 7)
;;   (auto-package-update-prompt-before-update t)
;;   (auto-package-update-hide-results t)
;;   :config
;;   (auto-package-update-maybe)
;;   (auto-package-update-at-time "09:00"))


  (straight-use-package '(setup :type git :host nil :repo "https://git.sr.ht/~pkal/setup"))
  (require 'setup)

  (setup-define :disabled
    (lambda ()
      `,(setup-quit))
    :documentation "Always stop evaluating the body.")

  (setup-define :load-after
      (lambda (features &rest body)
        (let ((body `(progn
                       (require ',(setup-get 'feature))
                       ,@body)))
          (dolist (feature (if (listp features)
                               (nreverse features)
                             (list features)))
            (setq body `(with-eval-after-load ',feature ,body)))
          body))
    :documentation "Load the current feature after FEATURES."
    :indent 1)

  (setup-define :file-match
    (lambda (regexp)
      `(add-to-list 'auto-mode-alist (cons ,regexp ',(setup-get 'mode))))
    :documentation "Associate the current mode with files that match REGEXP."
    :debug '(form)
    :repeatable t)

  (setup-define :load-from
      (lambda (path)
        `(let ((path* (expand-file-name ,path)))
           (if (file-exists-p path*)
               (add-to-list 'load-path path*)
             ,(setup-quit))))
    :documentation "Add PATH to load path.
  This macro can be used as NAME, and it will replace itself with
  the nondirectory part of PATH.
  If PATH does not exist, abort the evaluation."
    :shorthand (lambda (args)
                 (intern
                  (file-name-nondirectory
                   (directory-file-name (cadr args))))))