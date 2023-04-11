set makeprg=dotnet\ build\ --nologo\ -v\ q\ /clp:NoSummary
set errorformat=\ %#%f(%l\\\,%c):\ %m

augroup csharp
    autocmd!

    autocmd BufWritePre *.cs :silent! g/^\_$\n\_^$/d
    autocmd BufWritePre *.cs :silent! %s/^\(\s*{\)\n\_$/\1
    autocmd BufWritePre *.cs :silent! %s/^\_$\n\(\s*}\)/\1
    autocmd BufWritePre *.cs :silent lua vim.lsp.buf.formatting()
augroup END
