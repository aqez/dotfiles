(use-package lsp-mode
  :hook ((csharp-mode . lsp)
	 (bash-ts-mode . lsp))
  :commands lsp
  :config
  (general-define-key
   :states '(normal)
   :keymaps 'override
   "K" 'lsp-ui-doc-glance)
  (aqez/leader-key-def
    "c" '(:ignore t :which-key "Code")
    "ca" '(lsp-execute-code-action :which-key "Code Action"))
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
