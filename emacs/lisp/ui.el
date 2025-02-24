(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;; Built in UI tweaks
(setq scroll-margin 5)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position t)
(setq scroll-step 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(setq visible-bell t)

(set-face-attribute 'default nil :font "Hack Nerd Font" :height 180)

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;;(use-package vscode-dark-plus-theme
;;  :config
;;  (load-theme 'vscode-dark-plus t))

