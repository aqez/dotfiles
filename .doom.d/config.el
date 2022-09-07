;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Tony Dwire"
      user-mail-address "tony@undauntedonline.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'normal))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! lsp-rust (setq lsp-rust-server 'rust-analyzer))
(after! projectile (setq projectile-project-search-path '("~/repos")))
(after! neotree (setq neo-smart-open t))

(after! org
  (setq org-agenda-files '("~/org/Agenda.org"))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t))

(better-jumper-mode +1)

(setq dap-auto-configure-mode t)
(require 'dap-cpptools)
(require 'dap-netcore)

(defun current-line-empty-p ()
  "Determines if the current line at point is empty"
  (string-match-p "\\`\\s-*$" (thing-at-point 'line)))

(defun single-lines-only ()
  "replace multiple blank lines with a single one and then go back to the initial point"
  (interactive)
  (let ((initial-point (point)))
    (goto-char (point-min))
    (while (not (eobp))
      (if (current-line-empty-p)
          (progn
            (forward-char 1)
            (while (current-line-empty-p)
              (kill-whole-line)))
        (forward-char 1)))
    (goto-char initial-point)))

(defun file-cleanup()
  (single-lines-only)
  (lsp-format-buffer))

(add-hook 'csharp-mode-hook '(lambda () (add-hook 'before-save-hook 'file-cleanup)))
(add-hook '+web-react-mode-hook '(lambda () (add-hook 'before-save-hook 'file-cleanup)))

(add-hook 'html-mode-hook (lambda () (setq truncate-lines nil)))

(map! :leader
      (:desc "Go to left window" "h" #'evil-window-left
       :desc "Go to right window" "l" #'evil-window-right
       :desc "Go to upper window" "k" #'evil-window-up
       :desc "Go to below window" "j" #'evil-window-down
       :desc "Toggle neotree" "t" #'neotree-toggle))
