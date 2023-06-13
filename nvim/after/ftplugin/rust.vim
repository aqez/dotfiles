set makeprg=cargo\ build

augroup rust
    autocmd!

    autocmd BufWritePre * :silent lua vim.lsp.buf.format({async = false})
augroup END
