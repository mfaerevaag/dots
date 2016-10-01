;;; bindings.el --- bindings config
;;; Commentary:
;;; Code:

(key-chord-define-global "kj" nil)

(global-unset-key (kbd "C-c o"))

(defvar my-keys-minor-mode-map (make-keymap) "Custom my-keys-minor-mode keymap.")

;; (when (not (boundp 'evil-mode))
  ;; (define-key my-keys-minor-mode-map (kbd "C-c f") 'windmove-right)
  ;; (define-key my-keys-minor-mode-map (kbd "C-c b") 'windmove-left)
  ;; (define-key my-keys-minor-mode-map (kbd "C-c p") 'windmove-up)
  ;; (define-key my-keys-minor-mode-map (kbd "C-c n") 'windmove-down)
  ;; (define-key my-keys-minor-mode-map (kbd "C-w l") 'windmove-right)
  ;; (define-key my-keys-minor-mode-map (kbd "C-w h") 'windmove-left)
  ;; (define-key my-keys-minor-mode-map (kbd "C-w k") 'windmove-up)
  ;; (define-key my-keys-minor-mode-map (kbd "C-w j") 'windmove-down))

;; (define-key my-keys-minor-mode-map (kbd "C-S-n") 'move-line-down)
;; (define-key my-keys-minor-mode-map (kbd "C-S-p") 'move-line-up)

(define-key my-keys-minor-mode-map (kbd "M-s-n") '(lambda () (interactive) (shrink-window -1)))
(define-key my-keys-minor-mode-map (kbd "M-s-p") '(lambda () (interactive) (shrink-window 1)))
(define-key my-keys-minor-mode-map (kbd "M-s-f") '(lambda () (interactive) (shrink-window-horizontally -1)))
(define-key my-keys-minor-mode-map (kbd "M-s-b") '(lambda () (interactive) (shrink-window-horizontally 1)))

(define-key my-keys-minor-mode-map (kbd "C-S-n") 'scroll-up-line)
(define-key my-keys-minor-mode-map (kbd "C-S-p") 'scroll-down-line)

(define-key my-keys-minor-mode-map (kbd "C-x C-n") 'prelude-create-scratch-buffer)

;; (define-key my-keys-minor-mode-map (kbd "M-p") 'ace-window)

(define-key my-keys-minor-mode-map (kbd "C-v") 'View-scroll-half-page-forward)
(define-key my-keys-minor-mode-map (kbd "M-v") 'View-scroll-half-page-backward)

(define-key my-keys-minor-mode-map (kbd "C-c h g") 'helm-do-ag)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)


(defun my-minibuffer-setup-hook ()
  "Custom my-keys-minor-mode hook."
  (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(provide 'personal-bindings)

;;; bindings.el ends here
