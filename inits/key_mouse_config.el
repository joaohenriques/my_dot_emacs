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
