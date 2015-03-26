
(defun load-init-config ()
  "load config"
  (load (concat config_path "inits/base_config.el"))
  (load (concat config_path "inits/interface_config.el"))
  (load (concat config_path "inits/key_mouse_config.el"))
  (load (concat config_path "inits/org_mode_config.el"))
  (load (concat config_path "inits/other_config.el"))
  (load (concat config_path "inits/plantuml_config.el"))
  (load (concat config_path "inits/python_config.el"))

  (delete-other-windows)
)

(add-hook 'after-init-hook (lambda () (load-init-config)))

