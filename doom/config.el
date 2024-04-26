;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Tony Dwire"
      user-mail-address "tony@undauntedonline.com")

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 20 :weight 'normal)
      doom-theme 'doom-one
      inhibit-startup-screen t
      display-line-numbers-type 'relative)
(set-frame-parameter (selected-frame) 'alpha-background 100)
(add-to-list 'default-frame-alist '(alpha-background . 100))

(setq org-directory "~/org/"
      org-roam-directory "~/org/roam"
      org-hide-emphasis-markers t)

(after! org
  (setq org-agenda-files '("~/org/Agenda.org" "~/org/roam/")
        org-agenda-start-with-log-mode t
        org-log-done 'time
        org-log-into-drawer t))

(setq shell-file-name (executable-find "bash")
      vterm-shell (executable-find "fish"))

(after! projectile (setq projectile-project-search-path '("~/repos")))
(after! neotree (setq neo-smart-open t))
(setq scroll-margin 10)
(better-jumper-mode +1)

(defun aqez/get-line-string ()
  "Gets the current line in the buffer as a string"
  (buffer-substring-no-properties
   (line-beginning-position)
   (line-end-position)))

(defun aqez/current-line-empty-p ()
  "Determines if the current line at point is empty"
  (string-match-p "\\`\\s-*$" (aqez/get-line-string)))

(defun aqez/remove-duplicate-blank-lines ()
  "Replace multiple blank lines with a single one and then go back to the
   initial point"
  (let ((initial-point (point)))
    (goto-char (point-min))
    (while (not (eobp))
      (if (aqez/current-line-empty-p)
          (progn
            (forward-char 1)
            (while (and (not (eobp)) (aqez/current-line-empty-p))
              (kill-whole-line)))
        (forward-char 1)))
    (goto-char initial-point)))

(defun aqez/remove-blank-lines-near-curly-braces ()
  "Remove blank lines that immediately folow a line ending with an opening curly
   brace or blank lines that are immediately followed by a closing curly brace."
  (let ((initial-point (point)))
    (print "moving to beginning")
    (goto-char (point-min))
    (while (not (eobp))
      (cond ((string-match-p "{$" (aqez/get-line-string))
             (forward-line 1)
             (while (and (not (eobp)) (aqez/current-line-empty-p))
               (kill-whole-line)))
            ((string-match-p "\\`\\s-*}$" (aqez/get-line-string))
             (forward-line -1)
             (if (aqez/current-line-empty-p)
                 (progn
                   (kill-whole-line)
                   (forward-line -1))
               (forward-line 1))))
      (forward-line 1))
    (goto-char initial-point)))

(defun aqez/file-cleanup ()
  (interactive)
  (when (derived-mode-p 'prog-mode)
    "Clean up the file by removing unnecessary spaces and formatting it"
    (aqez/remove-duplicate-blank-lines)
    (aqez/remove-blank-lines-near-curly-braces)
    (+format/buffer)))

(add-hook 'prog-mode-hook #'(lambda () (add-hook 'before-save-hook 'aqez/file-cleanup)))

(after! lsp-rust (setq lsp-rust-server 'rust-analyzer))

(add-hook 'csharp-ts-mode-hook #'lsp)

(setq company-idle-delay 0.05
      lsp-lens-enable t
      flycheck-check-syntax-automatically '(save mode-enabled)
      lsp-modeline-code-actions-enable nil)

(setq dap-auto-configure-mode t)
(require 'dap-cpptools)
(require 'dap-netcore)

(map! (:desc "Toggle breakpoint" "<f9>" #'dap-breakpoint-toggle
       :desc "Debug" "<f5>" #'dap-debug
       :desc "Step Over" "<f10>" #'dap-next
       :desc "Step Into" "<f11>" #'dap-step-in
       :desc "Step Out" "<f12>" #'dap-step-out))

(after! evil-snipe
  (setq evil-snipe-scope 'visible))

(map! :leader
      (:desc "Go to left window" "h" #'evil-window-left
       :desc "Go to right window" "l" #'evil-window-right
       :desc "Go to upper window" "k" #'evil-window-up
       :desc "Go to below window" "j" #'evil-window-down
       :desc "Open dired in project" "t" #'projectile-dired))

(map! :desc "Swap to last buffer" :n "<backspace>" #'evil-switch-to-windows-last-buffer)
       ;:desc "Toggle neotree" "t" #'neotree-toggle))

(setq projectile-project-search-path '("~/repos"))
(map! :leader :desc "Projectile ripgrep" :n "r g" #'projectile-ripgrep)

(after! projectile
  (progn
    (defadvice projectile-on (around exlude-tramp activate)
      "This should disable projectile when visiting a remote file"
      (unless  (--any? (and it (file-remote-p it))
                       (list
                        (buffer-file-name)
                        list-buffers-directory
                        default-directory
                        dired-directory))
        ad-do-it))
    (setq projectile-track-known-projects-automatically nil)
    (setq projectile-globally-ignored-directories
          '(".idea"
            ".vscode"
            ".ensime_cache"
            ".eunit"
            ".git"
            ".hg"
            ".fslckout"
            "_FOSSIL_"
            ".bzr"
            "_darcs"
            ".tox"
            ".svn"
            ".stack-work"
            ".ccls-cache"
            ".cache"
            ".clangd"))))

(defun aqez/open-vterms-in-project-from-terminals-file ()
  "Opens vterms for specified projects from a .terminals file in the current directory."
  (interactive)
  (let* ((project-root (projectile-project-root))
         (opened-buffer nil)
         (current-buffer (current-buffer))
         (display-buffer-alist '(("\\*vterm.*" display-buffer-same-window)))
         (terminals-file (concat project-root ".terminals"))
         (project-names (when (file-exists-p terminals-file)
                          (with-temp-buffer
                            (insert-file-contents terminals-file)
                            (split-string (buffer-string) "\n" t))))
         )
    (when (and project-root project-names)
      (dolist (dir project-names)
        (let ((default-directory (concat project-root dir))
              (has-program-cs (file-exists-p (concat project-root dir "/Program.cs")))
              (has-package-json (file-exists-p (concat project-root dir "/package.json"))))
          (when (and (file-directory-p default-directory)
                     (or has-program-cs has-package-json))
            (let* ((buffer-name (concat "*vterm: " dir " *"))
                   (vterm-buffer (vterm buffer-name)))
              (setf opened-buffer t)
              (message (concat "Opening buffer " buffer-name))
              (persp-add-buffer vterm-buffer)
              (with-current-buffer vterm-buffer
                (if has-program-cs
                    (vterm-send-string "dotnet watch run")
                  (vterm-send-string "npm start"))
                (vterm-send-return)))))))
    (when opened-buffer
      (message "Opened some buffers, so restoring the original buffer")
      (switch-to-buffer current-buffer))))

(defun aqez/open-vterms-in-project ()
  "Opens vterms in all of the 'runnable' project directories (those with Program.cs or package.json)
   and runs all of the commands that are needed to start those projects."
  (interactive)
  (let ((project-root (projectile-project-root))
        (opened-buffer nil)
        (current-buffer (current-buffer))
        (display-buffer-alist '(("\\*vterm.*" display-buffer-same-window))))
    (when project-root
      (dolist (dir (directory-files project-root nil directory-files-no-dot-files-regexp))
        (let ((default-directory (concat project-root dir))
              (has-program-cs (file-exists-p (concat project-root dir "/Program.cs")))
              (has-package-json (file-exists-p (concat project-root dir "/package.json"))))
          (when (and (file-directory-p default-directory)
                     (or has-program-cs has-package-json))
            (let* ((buffer-name (concat "*vterm: " dir " *"))
                   (vterm-buffer (vterm buffer-name)))
              (setf opened-buffer t)
              (message (concat "Opening buffer " buffer-name))
              (persp-add-buffer vterm-buffer)
              (with-current-buffer vterm-buffer
                (if has-program-cs
                    (vterm-send-string "dotnet watch run")
                  (vterm-send-string "npm start"))
                (vterm-send-return)))))))
    (when opened-buffer
      (message "Opened some buffers, so restoring the original buffer")
      (switch-to-buffer current-buffer))))

;; accept completion from copilot and fallback to company
;;(use-package! copilot
;;  :hook (prog-mode . copilot-mode)
;;  :bind (:map copilot-completion-map ("C-Q" . 'copilot-accept-completion)))

(defun aqez/org-tree-slide-mode-hook ()
  (if org-tree-slide-mode
      (progn
        (display-line-numbers-mode -1)
        (set-frame-parameter (selected-frame) 'alpha-background 100)
        (add-to-list 'default-frame-alist '(alpha-background . 100)))
    (progn
      (display-line-numbers-mode 1)
      (set-frame-parameter (selected-frame) 'alpha-background 95)
      (add-to-list 'default-frame-alist '(alpha-background . 95)))))

(advice-add 'org-tree-slide-mode :after #'aqez/org-tree-slide-mode-hook)

(add-to-list 'major-mode-remap-alist '(csharp-mode . csharp-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(json-mode . json-ts-mode))
(add-to-list 'auto-mode-alist '("\\.yml" . yaml-ts-mode))

(defvar aqez-openai-token-file
  "/home/aqez/.config/openai.token"
  "The file path to find open ai token.")

(use-package! gptel
  :config
  (when (file-exists-p aqez-openai-token-file)
    (with-temp-buffer
      (insert-file-contents "/home/aqez/.config/openai.token")
      (setq! gptel-api-key (buffer-string)))))

(add-to-list 'auth-sources "~/.authinfo")

(map! :after dired
      :map dired-mode-map
      :n "c" 'dired-create-empty-file
      :leader (:desc "Dired" "d" #'dired))

(map! :map clojure-mode-map
      (:desc "Forward Slurp" "M-L" #'sp-forward-slurp-sexp
       :desc "Forward Barf" "M-K" #'sp-forward-barf-sexp
       :desc "Backwards Slurp" "M-H" #'sp-backward-slurp-sexp
       :desc "Backwards Slurp" "M-J" #'sp-backward-barf-sexp
       :desc "Raise sexp" "M-I" #'cljr-raise-sexp))
(map! :map clojure-mode-map
      (:desc "Evaluate last sexp" "M-RET" #'cider-eval-last-sexp))
