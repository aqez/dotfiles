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
  (global-set-key (kbd "<escape>") 'keyboard-quit)
  (evil-mode 1))

(use-package evil-collection
  :after (evil magit)
  :config
  (evil-collection-init))

(with-eval-after-load 'dired
  (put 'dired-find-alternate-file 'disabled nil) ;; Enable alternate file feature
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ;; Reuse buffer on RET
  (define-key dired-mode-map (kbd "^")
	      (lambda () (interactive) (find-alternate-file "..")))) ;; Reuse buffer when going up


(use-package swiper
  :after ivy
  :bind (("C-s" . swiper )))
