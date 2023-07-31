augroup lua
    autocmd!

    autocmd BufWritePre *.lua :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.lua :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.lua :silent! %s/^\_$\n\(\s*}\)/\1
    autocmd BufWritePre *.lua :silent lua vim.lsp.buf.format({ async = false })
augroup END
