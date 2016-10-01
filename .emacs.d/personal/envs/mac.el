;;; mac.el --- mac config
;;; Commentary:
;;; Code:

;; fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
(global-set-key [f11] 'toggle-fullscreen)

;; meta-super
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; smooth scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; font
(add-to-list 'default-frame-alist '(font . "Monospace 12"))

;;; mac.el ends here
