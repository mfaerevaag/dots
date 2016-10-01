;;; linux.el --- linux config
;;; Commentary:
;;; Code:

;; (flyspell-mode -1)

;; (set-default-font "DejaVu Sans Mono 6")
;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))
;; (set-face-attribute 'default nil :height 110)

(set-frame-font "DejaVu Sans Mono-10")
;;(if (not (is-in-terminal))
;;(set-frame-font "DejaVu Sans Mono-10")
;;(set-frame-font "SourceCodePro, FontAwesome-10")
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono-6" :height 100))
;;)
(set-fontset-font t 'unicode "Symbola" nil 'prepend)

;;; linux.el ends here
