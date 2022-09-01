vim.opt.autoread = true
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hidden = true


-- Typescript/react autocmds
vim.cmd [[
augroup ts
    autocmd!

    autocmd BufWritePre *.ts,*.tsx :silent lua vim.lsp.buf.formatting()
    autocmd BufWritePre *.ts,*.tsx :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.ts,*.tsx :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.ts,*.tsx :silent! %s/^\_$\n\(\s*}\)/\1
augroup END
]]
