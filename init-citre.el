;;; init-citre.el --- citre configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'citre)
  (global-set-key (kbd "C-x c j") 'citre-jump)
  (global-set-key (kbd "C-x c J") 'citre-jump-back)
  (global-set-key (kbd "C-x c p") 'citre-ace-peek)
  (add-hook 'prog-mode-hook #'citre-auto-enable-citre-mode)
  
  (with-eval-after-load 'projectile
    (setq citre-project-root-function #'projectile-project-root))
  (with-eval-after-load 'cc-mode
    (require 'citre-lang-c))
  (with-eval-after-load 'dired
    (require 'citre-lang-fileref)))

(provide 'init-citre)
;;; init-citre.el ends here
