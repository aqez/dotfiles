;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Tony Dwire"
      user-mail-address "tony@undauntedonline.com")

(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'normal))
(setq doom-theme 'doom-nord-aurora)
(setq display-line-numbers-type 'relative)
(set-frame-parameter (selected-frame) 'alpha 85)
(add-to-list 'default-frame-alist '(alpha . 85))

(setq org-directory "~/org/")
(setq org-roam-directory "~/org/roam")

(after! org
  (setq org-agenda-files '("~/org/Agenda.org" "~/org/roam/"))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t))

(setq vterm-shell "/usr/bin/fish")

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

(defun aqez/current-line-ends-with-curly ()
  "Determines if the current line ends with an opening curly brace"
  (string-match-p "{$" (aqez/get-line-string)))

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

(defun file-cleanup ()
  "Clean up the file by removing unnecessary spaces and formatting it"
  (aqez/remove-duplicate-blank-lines)
  (aqez/remove-blank-lines-near-curly-braces)
  (+format/buffer))

(add-hook 'prog-mode-hook #'(lambda () (add-hook 'before-save-hook 'file-cleanup)))

(after! lsp-rust (setq lsp-rust-server 'rust-analyzer))
(setq lsp-lens-enable nil)
(setq company-idle-delay nil)
(setq flycheck-check-syntax-automatically '(save mode-enabled))

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
  :bind (("C-Q" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("C-Q" . 'copilot-accept-completion)))

(use-package! tree-sitter
  :hook (prog-mode . turn-on-tree-sitter-mode)
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (require 'tree-sitter-langs))

(use-package! gptel
  :config
  (with-temp-buffer
    (insert-file-contents "/home/aqez/.config/openai.token")
    (setq! gptel-api-key (buffer-string))))
