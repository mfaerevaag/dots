(require 'circe)

(setq circe-network-options
      `(("Freenode"
         :nick "slevin"
         ;;:channels (:after-auth "#archlinux")
         :nickserv-password, (password-store-get "irc/freenode-slevin"))))

;; grey out bot text
(defvar my-circe-bot-list '("phrik" "q"))
(defun my-circe-message-option-bot (nick &rest ignored)
  (when (member nick my-circe-bot-list)
    '((text-properties . (face circe-fool-face
                               lui-do-not-track t)))))
(add-hook 'circe-message-option-functions 'my-circe-message-option-bot)

;; spellcheck
(setq lui-flyspell-p t
      lui-flyspell-alist '(("#hamburg" "german8")
                           (".*" "american")))

;; (circe "Freenode")
