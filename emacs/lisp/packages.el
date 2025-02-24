

(setq use-package-always-ensure t)
(setq custom-file "~/.config/emacs/custom.el") ;; Change to use this for custom variables
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
