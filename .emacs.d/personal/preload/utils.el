;;; utils.el --- utility functions
;;; commentary:
;;; code:

(defun personal-load(file)
  (load (concatenate 'string prelude-personal-dir
                     (concatenate 'string "/" file))))

(defun is-in-terminal()
  (not (display-graphic-p)))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun personal-install-packages()
  (package-install 'simplezen)
  (package-install 'yalinum)
  (package-install 'auto-complete)
  (package-install 'multiple-cursors)
  (package-install 'auctex))

(provide 'personal-utils)

;;; utils.el ends here
