(defvar input-method-cursor-color "Orange"
  "Default cursor color if using an input method.")

;; (defvar default-cursor-color "#d54e53"
;;   "Default text cursor color.")
(defvar default-cursor-color nil
  "Default text cursor color.")

(defun change-cursor-color-on-input-method ()
  "Set cursor color depending on whether an input method is used or not."
  (interactive)
  (if  (not (and default-cursor-color current-input-method)) 
      (setq default-cursor-color (frame-parameter nil 'cursor-color)))
  (set-cursor-color (if current-input-method
                        input-method-cursor-color
                      default-cursor-color)))

(advice-add 'toggle-input-method :after 'change-cursor-color-on-input-method)
