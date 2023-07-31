vim.cmd "syntax on"
vim.opt.ruler = true
vim.opt.backspace = "eol,start,indent"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
--vim.opt.lazyredraw = true
vim.opt.hlsearch = false
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.cursorline = false
vim.opt.foldcolumn = "1"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")
vim.opt.previewheight = 10
vim.opt.laststatus = 2
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
--vim.opt.background = "light"

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)

-- Text/Indent
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.fillchars = { eob = " " }
