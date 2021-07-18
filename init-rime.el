;;; init-rime.el --- Configuration for rime -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defconst rime-usr-data-exists-p
  (file-exists-p "~/emacs-data/rime")
  "For checking if there is a rime user data.")

(when rime-usr-data-exists-p
  (require-package 'rime)

  (when (eq system-type 'windows-nt)
    (setq rime-share-data-dir
          "~/scoop/apps/msys2/current/mingw64/share/rime-data"))
  (when (eq system-type 'darwin)
    (setq rime-librime-root  "~/emacs-data/librime/dist"))

  (setq
   rime-disable-predicates '(rime-predicate-prog-in-code-p
                             rime-predicate-current-uppercase-letter-p
                             rime-predicate-after-alphabet-char-p
                             rime-predicate-punctuation-after-space-cc-p
                             rime-predicate-punctuation-line-begin-p
                             rime-predicate-after-ascii-char-p
                             rime-predicate-space-after-cc-p)
   default-input-method "rime"
   rime-user-data-dir "~/emacs-data/rime"
   rime-cursor "|"
   rime-show-candidate 'minibuffer
   rime-show-preedit t )

  (autoload #'toggle-input-method "rime" nil t)
  (global-set-key (kbd "C-\\") 'toggle-input-method)

  (with-eval-after-load 'rime
    (global-set-key (kbd "s-m") 'rime-force-enable)
    (global-set-key (kbd "C-`") 'rime-send-keybinding)))

(provide 'init-rime)
;;; init-rime.el ends here
