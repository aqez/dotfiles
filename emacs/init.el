(add-to-list 'load-path "~/.config/emacs/lisp")


(load "packages")

(package-initialize)

;; Need this to be available for other packages
(use-package general :ensure t)
(general-create-definer aqez/leader-key-def
  :keymaps '(normal visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

(let ((config-dir "~/.config/emacs/lisp/"))
  (dolist (file (directory-files config-dir t "\\.el$"))
    (load file)))
