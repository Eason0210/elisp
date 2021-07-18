;;; init-org-roam.el --- Configuration for org-roam -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (and (executable-find "sqlite3")
           (executable-find "cc"))
  (when (maybe-require-package 'org-roam)
    (setq org-roam-directory (file-truename "~/.org/org-roam"))
    (setq org-roam-v2-ack t)
    (setq org-roam-db-gc-threshold most-positive-fixnum)
    
    (global-set-key (kbd "C-c n c") 'org-roam-capture)
    (global-set-key (kbd "C-c n f") 'org-roam-node-find)
    (global-set-key (kbd "C-c n i") 'org-roam-node-insert)
    (global-set-key (kbd "C-c n r") 'org-roam-ref-find)
    (global-set-key (kbd "C-c n l") 'org-roam-buffer-toggle)
    (global-set-key (kbd "C-c n g") 'org-roam-graph)
    (global-set-key (kbd "C-c n j") 'org-roam-dailies-capture-today))
  
  (with-eval-after-load 'org-roam
    (org-roam-setup)
    (with-eval-after-load 'org-protocol
      (require 'org-roam-protocol))))


(provide 'init-org-roam)

;;; init-org-roam.el ends here
