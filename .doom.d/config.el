;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Tony Dwire"
      user-mail-address "tony@undauntedonline.com")

(setq doom-font (font-spec :family "Noto Sans Mono" :size 20 :weight 'normal))
(setq doom-theme 'doom-one)
(setq inhibit-startup-screen t)
(setq display-line-numbers-type 'relative)
(set-frame-parameter (selected-frame) 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam")

(after! org
  (setq org-agenda-files '("~/org/Agenda.org" "~/org/roam/"))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t))

(setq shell-file-name (executable-find "bash"))
(setq vterm-shell (executable-find "fish"))

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
(setq company-idle-delay 0.25
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

(after! projectile
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
          ".clangd")))

(defun open-vterms-in-project-from-terminals-file ()
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

(defun open-vterms-in-project ()
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
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (;("C-Q" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("C-Q" . 'copilot-accept-completion)))

(defun aqez/org-tree-slide-mode-hook (&rest args)
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

(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-ts-mode))
(add-hook 'csharp-ts-mode-hook 'lsp-mode)

(add-to-list 'auto-mode-alist '("\\.c\\'" . c-ts-mode))
(add-hook 'c-ts-mode-hook 'lsp-mode)
;; (use-package! tree-sitter
;;   :hook (prog-mode . turn-on-tree-sitter-mode)
;;   :hook (tree-sitter-after-on . tree-sitter-hl-mode)
;;   :config
;;   (require 'tree-sitter-langs))

(defvar aqez-openai-token-file
  "/home/aqez/.config/openai.token"
  "The file path to find open ai token.")

(use-package! gptel
  :config
  (when (file-exists-p aqez-openai-token-file)
    (with-temp-buffer
      (insert-file-contents "/home/aqez/.config/openai.token")
      (setq! gptel-api-key (buffer-string)))))

; (add-hook 'neo-enter-hook
;           (lambda (type)
;             (progn
;               (print type)
;               (if (equal type 'file)
;                   (neotree-hide)))))

(add-to-list 'auth-sources "~/.authinfo")
