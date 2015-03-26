(require 'plantuml-mode)
;; Associate .uml and .plantuml to plantuml-mode
(setq auto-mode-alist
      (append '(("\\.uml$" . plantuml-mode)
                ("\\.plantuml$" . plantuml-mode)) auto-mode-alist))

(defvar plantuml-run-command (concat "java -jar " (shell-quote-argument plantuml-jar-path)))
(defun plantuml-run()
  "Run plantuml on the current buffer"
  (interactive)
  (shell-command (concat plantuml-run-command " " buffer-file-name)))

(add-hook 'plantuml-mode-hook
          (lambda () (local-set-key (kbd "C-c") 'plantuml-run)))
