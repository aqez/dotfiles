
(use-package projectile
  :after (ivy)
  :init
  (setq projectile-project-search-path '("~/repos/"))
  (setq projectile-completion-system 'ivy)
  :config
  (aqez/leader-key-def
    "SPC" '(projectile-find-file :which-key "find file")
    "p" '(:ignore t :which-key "Projectile")
    "pp" '(projectile-switch-project :which-key "Switch project")
    "pd" '(projectile-dired :which-key "Dired in project"))
  (projectile-mode +1))


(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :config
  (aqez/leader-key-def
    "TAB" '(:ignore t :which-key "Perspective")
    "TAB TAB" '(persp-next :which-key "Next perpsective")
    "TAB d" '(persp-kill :which-key "Kill perspective")
    "TAB 1" '((lambda () (interactive) (persp-switch-by-number 1)) :which-key "Perspective 1")
    "TAB 2" '((lambda () (interactive) (persp-switch-by-number 2)) :which-key "Perspective 2")
    "TAB 3" '((lambda () (interactive) (persp-switch-by-number 3)) :which-key "Perspective 3")
    "TAB 4" '((lambda () (interactive) (persp-switch-by-number 4)) :which-key "Perspective 4")
    "TAB 5" '((lambda () (interactive) (persp-switch-by-number 5)) :which-key "Perspective 5")
    "TAB 6" '((lambda () (interactive) (persp-switch-by-number 6)) :which-key "Perspective 6"))
  (persp-mode))

(use-package persp-projectile
  :after (perspective projectile)
  :config
  (define-key projectile-mode-map (kbd "C-c p p") 'projectile-persp-switch-project))
