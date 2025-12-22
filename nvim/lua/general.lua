vim.opt.autoread = true
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.colorcolumn = "80,120"

vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
-- Typescript/react autocmds
vim.cmd [[
augroup ts
    autocmd!

    autocmd BufWritePre *.ts,*.tsx :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.ts,*.tsx :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.ts,*.tsx :silent! %s/^\_$\n\(\s*}\)/\1
    autocmd BufWritePre *.ts,*.tsx :silent lua vim.lsp.buf.format()
    autocmd BufEnter,CursorHold,InsertLeave *.ts,*.tsx lua vim.lsp.codelens.refresh({ bufnr = 0 }) 
    autocmd FileType typescript,typescriptreact compiler tsc | setlocal makeprg=npx\ tsc
    let &makeprg='tsc --noEmit --pretty'
augroup END
]]
