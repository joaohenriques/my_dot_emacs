;; untabify-buffer
(defun untabify-buffer ()
  (interactive)
  (setq l (line-number-at-pos))
  (mark-whole-buffer)
  (untabify (point-min) (point-max))
  (goto-line l))

;; dos2unix
(defun dos2unix ()
  (interactive)
  (beginning-of-buffer)
  (while 
      (search-forward "\r") 
    (replace-match "")))
