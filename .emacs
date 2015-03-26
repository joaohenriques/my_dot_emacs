
;;;;;;;;;;;;;;
;; encoding ;;
;;;;;;;;;;;;;;

;; utf-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key Bindings and  Mouse Behavior ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cua-mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy nil) ;; Standard Windows behaviour
(setq cua-enable-cua-keys nil) ;; Disable overriding of key bindings

;; Smooth scroll
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed 0.2) ;; accelerate slowly
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Change window
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Speedbar
(global-set-key [f12] 'speedbar)

;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)
;; complete symbol
(global-set-key (kbd "M-SPC") 'dabbrev-expand)

;; Disable ESC ESC ESC
(global-set-key (kbd "ESC ESC ESC") 'nil)

;; UNDO in C-z
(global-set-key (kbd "C-z") 'undo)

;;;;;;;;;;;
;; Modes ;;
;;;;;;;;;;;

;; ido
(ido-mode t)

;; icomplete-mode
(icomplete-mode)

;; tramp
(require 'tramp)

;;;;;;;;;;;;;;
;; org-mode ;;
;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-src-fontify-natively t)

;; log when DONE
(setq org-log-done t)

;; remember
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)

;;;;;;;;;;
;; elpa ;;
;;;;;;;;;;

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;;;;;;;;;;;
;; Macros ;;
;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other Configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; optimizations
(setq redisplay-dont-pause t)

;; set backup by copying
(setq backup-by-copying t)
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

;; line length
(setq-default fill-column 80)

;; other
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(send-mail-function (quote smtpmail-send-it))
 '(speedbar-show-unknown-files t))

 ;; indent
(setq standard-indent 2)

;; plantuml-mode
(require 'plantuml-mode)

;;popwin
(require 'popwin)
(popwin-mode 1)

;; direx
(require 'direx)
;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(push '(direx:direx-mode :position left :width 30 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
(add-hook 'jedi-mode-hook 'jedi-direx:setup)
