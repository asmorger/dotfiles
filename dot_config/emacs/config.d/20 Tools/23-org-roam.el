;;; -*- lexical-binding: t; -*-

;;; Code:

(use-package org-roam
  :ensure t
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/roam")
  (org-roam-dailies-directory "journal/")
  (org-roam-completion-everywhere t)
  (org-roam-dailies-capture-templates
   '(
     ("d" "default" entry "* %<%I:%M %p>: %?"
      :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))
     ("g" "goals" entry "* Goals:\n\n- [ ] %?\n- [ ] \n- [ ] "
      :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))
   ))
  :bind (:map org-mode-map
              ("M-<tab>" . completion-at-point))
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))


;; https://systemcrafters.net/build-a-second-brain-in-emacs/5-org-roam-hacks/

;; (defun org-roam-node-insert-immediate (arg &rest args)
;;   (interactive "P")
;;   (let ((args (cons arg args))
;;         (org-roam-capture-templates (list (append (car org-roam-capture-templates)
;;                                                   '(:immediate-finish t)))))
;;     (apply #'org-roam-node-insert args)))


;; The buffer you put this code in must have lexical-binding set to t!
;; See the final configuration at the end for more details.

;; (defun my/org-roam-filter-by-tag (tag-name)
;;   (lambda (node)
;;     (member tag-name (org-roam-node-tags node))))

;; (defun my/org-roam-list-notes-by-tag (tag-name)
;;   (mapcar #'org-roam-node-file
;;           (seq-filter
;;            (my/org-roam-filter-by-tag tag-name)
;;            (org-roam-node-list))))

;; (defun my/org-roam-refresh-agenda-list ()
;;   (interactive)
;;   (setq org-agenda-files (my/org-roam-list-notes-by-tag "Project")))

;; Build the agenda list the first time for the session
;; (my/org-roam-refresh-agenda-list)

;; Selecting from a list of notes with a specific tag
;; [[https://systemcrafters.net/build-a-second-brain-in-emacs/5-org-roam-hacks/#selecting-from-a-list-of-notes-with-a-specific-tag]]

;; (defun my/org-roam-project-finalize-hook ()
;;   "Adds the captured project file to `org-agenda-files' if the
;; capture was not aborted."
;;   ;; Remove the hook since it was added temporarily
;;   (remove-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

;;   ;; Add project file to the agenda list if the capture was confirmed
;;   (unless org-note-abort
;;     (with-current-buffer (org-capture-get :buffer)
;;       (add-to-list 'org-agenda-files (buffer-file-name)))))

;; (defun my/org-roam-find-project ()
;;   (interactive)
;;   ;; Add the project file to the agenda after capture is finished
;;   (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

;;   ;; Select a project file to open, creating it if necessary
;;   (org-roam-node-find
;;    nil
;;    nil
;;    (my/org-roam-filter-by-tag "Project")
;;    :templates
;;    '(("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
;;       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
;;       :unnarrowed t))))

;; (global-set-key (kbd "C-c n p") #'my/org-roam-find-project)

;; [[https://systemcrafters.net/build-a-second-brain-in-emacs/5-org-roam-hacks/#streamlined-custom-capture-for-tasks-and-notes]]

;; (defun my/org-roam-capture-inbox ()
;;   (interactive)
;;   (org-roam-capture- :node (org-roam-node-create)
;;                      :templates '(("i" "inbox" plain "* %?"
;;                                   :if-new (file+head "Inbox.org" "#+title: Inbox\n")))))


;; (defun my/org-roam-capture-task ()
;;   (interactive)
;;   ;; Add the project file to the agenda after capture is finished
;;   (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

;;   ;; Capture the new task, creating the project file if necessary
;;   (org-roam-capture- :node (org-roam-node-read
;;                             nil
;;                             (my/org-roam-filter-by-tag "Project"))
;;                      :templates '(("p" "project" plain "** TODO %?"
;;                                    :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                           "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
;;                                                           ("Tasks"))))))

