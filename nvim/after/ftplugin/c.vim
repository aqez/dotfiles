set makeprg=cmake\ --build\ build

augroup cgroup
    autocmd!

    autocmd BufWritePre *.h :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.h :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.h :silent! %s/^\_$\n\(\s*}\)/\1
    autocmd BufWritePre *.h :silent lua vim.lsp.buf.format()

    autocmd BufWritePre *.c :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.c :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.c :silent! %s/^\_$\n\(\s*}\)/\1
    autocmd BufWritePre *.c :silent lua vim.lsp.buf.format()
augroup END
