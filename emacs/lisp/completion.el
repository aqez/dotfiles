(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ;; Start completing after 1 character
  (setq company-idle-delay 0.1)) ;; Show suggestions quickly


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

