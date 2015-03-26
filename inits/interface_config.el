;;;;;;;;;;;;;;;;;;;;;;;;;
;; theme and interface ;;
;;;;;;;;;;;;;;;;;;;;;;;;; 

;; startup
(scroll-bar-mode 1)
(tool-bar-mode 0)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "joaohenriques")



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "firebrick" :slant italic))))
 '(font-lock-comment-face ((t (:foreground "firebrick" :slant italic)))))

;; highlight line background
(global-hl-line-mode 1) 

;;show nothing in *scratch* when started
(setq initial-scratch-message nil)


;; paren mode
(show-paren-mode)

;; Line Numbers
(global-linum-mode)
(setq linum-disabled-modes-list '(eshell-mode 
                                  wl-summary-mode 
                                  compilation-mode 
                                  org-mode 
                                  text-mode 
                                  dired-mode 
                                  speedbar-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes-list))
    (linum-mode 1)))

;; prevent creation of backup files on same dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; whitespace
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
;(global-whitespace-mode t)


;; frame header 
(setq frame-title-format
      '(buffer-file-name
        "%f"
        (dired-directory dired-directory "%b")))

;; Mode line 
(setq-default
 mode-line-format
 '(; Position
   "%4l:%3c"
   ; emacsclient [default -- keep?]
   mode-line-client
   "  "
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only " RO ")
          ((buffer-modified-p)  " ** ")
          (t "      ")))
   "    "
   ; directory and buffer/file name
   (:eval (shorten-directory default-directory 30))
   "%b"
   ; narrow [default -- keep?]
   " %n "
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   (vc-mode vc-mode)
   "  %["
   mode-name
   "%] "
   minor-mode-alist
   mode-line-process
   (global-mode-string global-mode-string)
   "    "
   ;; relative position, size of file
   "[%p/%I] "
   ))

;; modeline Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))
