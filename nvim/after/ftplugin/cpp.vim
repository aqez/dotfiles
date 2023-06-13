set makeprg=cmake\ --build\ build

augroup cgroup
    autocmd!

    autocmd BufWritePre *.h :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.h :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.h :silent! %s/^\_$\n\(\s*}\)/\1
    autocmd BufWritePre *.h :silent lua vim.lsp.buf.format({ async = false })

    autocmd BufWritePre *.cpp :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.cpp :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.cpp :silent! %s/^\_$\n\(\s*}\)/\1
    autocmd BufWritePre *.cpp :silent lua vim.lsp.buf.format({ async = false })
augroup END
