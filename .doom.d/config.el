;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Tony Dwire"
      user-mail-address "tony@undauntedonline.com")

(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'normal))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-theme 'doom-nord)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam")

(after! org
  (setq org-agenda-files '("~/org/Agenda.org"))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t))

(setq vterm-shell "/usr/bin/fish")

(after! projectile (setq projectile-project-search-path '("~/repos")))
(after! neotree (setq neo-smart-open t))
(setq scroll-margin 10)
(better-jumper-mode +1)

(defun tangle-and-reload ()
    (interactive)
    (org-babel-tangle)
    (doom/reload))

(defun current-line-empty-p ()
  "Determines if the current line at point is empty"
  (string-match-p "\\`\\s-*$" (thing-at-point 'line)))

(defun file-cleanup()
  (print "YO YO YO")
  (delete-blank-lines)
  (lsp-format-buffer))

(add-hook 'prog-mode-hook '(lambda () (print "YO YO YO1") (add-hook 'before-save-hook 'file-cleanup)))
;; 
;;(add-hook 'csharp-mode-hook '(lambda () (add-hook 'before-save-hook 'file-cleanup)))
;;(add-hook '+web-react-mode-hook '(lambda () (add-hook 'before-save-hook 'file-cleanup)))
;;(add-hook 'typescript-tsx-mode '(lambda () (add-hook 'before-save-hook 'file-cleanup)))
;;(add-hook 'html-mode-hook (lambda () (setq truncate-lines nil)))

(after! lsp-rust (setq lsp-rust-server 'rust-analyzer))
(setq lsp-lens-enable nil)

(setq dap-auto-configure-mode t)
(require 'dap-cpptools)
(require 'dap-netcore)

(map! (:desc "Toggle breakpoint" "<f9>" #'dap-breakpoint-toggle
       :desc "Debug" "<f5>" #'dap-debug
       :desc "Step Over" "<f10>" #'dap-next
       :desc "Step Into" "<f11>" #'dap-step-in
       :desc "Step Out" "<f12>" #'dap-step-out))

(map! :leader
      (:desc "Go to left window" "h" #'evil-window-left
       :desc "Go to right window" "l" #'evil-window-right
       :desc "Go to upper window" "k" #'evil-window-up
       :desc "Go to below window" "j" #'evil-window-down
       :desc "Toggle neotree" "t" #'neotree-toggle))

(defun aqez/open-pull-request-for-current-branch ()
  "Opens a PR for the current branch/remote on GitHub"
  (interactive)
  (let* ((branch-name (magit-get-current-branch))
         (remote-name (magit-get-current-remote))
         (remote-url (magit-get "remote" remote-name "url"))
         (remote-path (second (split-string remote-url ":")))
         (remote-path-name (first (split-string remote-path "\\.")))
         (full-url (concat "https://github.com/" remote-path-name "/compare/" branch-name "?expand=1")))
    (browse-url full-url)))

(map! :mode 'magit
    (:desc "Create pull request" ";" #'aqez/open-pull-request-for-current-branch))

(setq projectile-project-search-path '("~/repos"))
(map! :leader :desc "Projectile ripgrep" :n "r g" #'projectile-ripgrep)

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)))

(use-package! tree-sitter
  :hook (prog-mode . turn-on-tree-sitter-mode)
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (require 'tree-sitter-langs))

(use-package! gptel
  :config
  (setq! gptel-api-key "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"))
