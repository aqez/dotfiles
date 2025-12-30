augroup typescriptreact
    autocmd!

    "autocmd BufWritePre *.cs :silent! lua require("csharp").fix_usings()
    autocmd BufWritePre *.tsx :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.tsx :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.tsx :silent! %s/^\_$\n\(\s*}\)/\1
    autocmd BufWritePre *.tsx :silent lua vim.lsp.buf.format({ async = false })
    autocmd BufEnter,CursorHold,InsertLeave *.tsx lua vim.lsp.codelens.refresh({ bufnr = 0 })
augroup END
