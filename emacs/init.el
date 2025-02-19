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

;; Packages

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(setq use-package-always-ensure t)
(setq custom-file "~/.config/emacs/custom.el") ;; Change to use this for custom variables
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)

(load-file (expand-file-name "cleanup.el" user-emacs-directory))

(use-package general)
(general-create-definer aqez/leader-key-def
  :keymaps '(normal visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; Required for some extra functionality
  (setq evil-want-keybinding nil) ;; If using evil-collection
  (setq evil-want-C-u-scroll t) ;; Enable vim-style C-u scrolling
  :config
  (general-define-key
   :states '(normal)
   [backspace] 'evil-switch-to-windows-last-buffer)
  (evil-mode 1))

(use-package evil-collection
  :after (evil magit)
  :config
  (evil-collection-init))

(use-package magit
  ;:commands (magit-status magit-get-current-branch)
  :config
  (aqez/leader-key-def
    "g" '(:ignore t :which-key "Magit")
    "gg" '(magit-status :which-key "Open Magit"))
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

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

(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ;; Start completing after 1 character
  (setq company-idle-delay 0.1)) ;; Show suggestions quickly

(with-eval-after-load 'dired
  (put 'dired-find-alternate-file 'disabled nil) ;; Enable alternate file feature
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ;; Reuse buffer on RET
  (define-key dired-mode-map (kbd "^")
	      (lambda () (interactive) (find-alternate-file "..")))) ;; Reuse buffer when going up

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

(use-package persp-projectile
  :after (perspective projectile)
  :config
  (define-key projectile-mode-map (kbd "C-c p p") 'projectile-persp-switch-project))

(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t) ;; Enable recent files and bookmarks
  (setq ivy-count-format "(%d/%d) ") ;; Show count in the minibuffer
  (setq enable-recursive-minibuffers t) ;; Allow minibuffer commands inside minibuffers
  :config
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper )))

(use-package lsp-mode
  :hook ((csharp-mode . lsp)
	 (bash-ts-mode . lsp))
  :commands lsp
  :config
  (general-define-key
   :states '(normal)
   :keymaps 'override
   "K" 'lsp-ui-doc-glance)
  (setq lsp-enable-symbol-highlighting t
	lsp-enable-indentation t
	lsp-prefer-flymake nil)
  (setq lsp-file-watch-ignored-directories
	(append lsp-file-watch-ignored-directories
		'(".*/.git$"         ; Git folder
		  ".*/node_modules$"   ; Node.js dependencies
		  ".*/dist$"           ; Common build folder
		  ".*/build$"          ; Common build folder
		  ".*/cache$"       ; Cache folders
		  ".*/target$"         ; Rust/Cargo build folder
		  ".*/bin$"            ; dotnet bin folder
		  ".*/obj$"))))        ; dotnet bin folder

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-show-with-cursor nil
	lsp-ui-doc-show-with-mouse t
	lsp-ui-sideline-show-code-actions nil
	lsp-ui-sideline-show-diagnostics t))

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

