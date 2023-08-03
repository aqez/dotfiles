augroup go
    autocmd!

    autocmd BufWritePre *.go :silent lua vim.lsp.buf.format({ async = false })
augroup END
