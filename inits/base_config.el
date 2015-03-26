;;;;;;;;;;;;;;
;; encoding ;;
;;;;;;;;;;;;;;

;; utf-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; optimizations
(setq redisplay-dont-pause t)

;; set backup by copying
(setq backup-by-copying t)
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))



;;;;;;;;;;
;; elpa ;;
;;;;;;;;;;

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;; line length
(setq-default fill-column 80)

 ;; indent
(setq standard-indent 2)

;;popwin
(require 'popwin)
(popwin-mode 1)

;; direx
(require 'direx)
;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(push '(direx:direx-mode :position left :width 30 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; ido
(ido-mode t)

;; icomplete-mode
(icomplete-mode)
