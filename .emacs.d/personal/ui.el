;;; ui.el --- user interface config
;;; Commentary:
;;; Code:

(setq visible-bell 1)
(set-mouse-color "dark orange")

;; theme
;; (load-theme 'wombat t)

;; hl-line
(set-face-attribute hl-line-face nil :underline nil)
(set-face-attribute hl-line-face nil :background "#393939")
(set-face-foreground 'highlight nil)

(defun personal-init-term())

(defun personal-init-gui()
  (set-scroll-bar-mode nil))

(if (is-in-terminal)
    (personal-init-term)
  (personal-init-gui))

(provide 'personal-ui)

;;; ui.el ends here
