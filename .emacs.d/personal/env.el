;;; env.el --- environment config
;;; Commentary:
;;; Code:

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq default-directory "~/dev/code/")

;; registers
(set-register ?e (cons 'file "~/.emacs.d/personal/init.el"))
(set-register ?t (cons 'file "~/todo.org"))

;; platform specific
(cond
 ((string-equal system-type "windows-nt") ; Windowns
  (progn
    (message "Aah shit, fire ze missiles!") ))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (personal-load "envs/mac.el")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (personal-load "envs/linux.el"))))

(provide 'personal-env)

;;; env.el ends here
