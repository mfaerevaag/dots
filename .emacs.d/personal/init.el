;;; init.el --- personal emacs config
;;; Commentary:
;;; Code:

(defvar personal-evil t
  "Whether to use evil-mode.")

;; utils
(require 'personal-utils)

;; environment
(require 'personal-env)

;; plugins
(require 'personal-plugins)

;; ui
(require 'personal-ui)

;; bindings
(require 'personal-bindings)

;;; init.el ends here
