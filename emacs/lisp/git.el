(use-package magit
  ;:commands (magit-status magit-get-current-branch)
  :config
  (aqez/leader-key-def
    "g" '(:ignore t :which-key "Magit")
    "gg" '(magit-status :which-key "Open Magit"))
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))
