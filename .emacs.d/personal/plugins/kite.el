;;; kite.el --- kite config
;;; Commentary:
;;; Code:

(require 'kite-mode)

(add-to-list 'auto-mode-alist '("\\.kite\\'" . kite-mode))
(add-hook 'kite-mode-hook 'auto-complete-mode)
(add-hook 'kite-mode-hook 'smartparens-mode)

;;; kite.el ends here
