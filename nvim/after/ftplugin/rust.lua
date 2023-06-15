local rust_group = vim.api.nvim_create_augroup("rust-keybinds", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*.rs",
    command = [[nnoremap <buffer> <C-b> :make build<CR>]],
    group = rust_group
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    group = rust_group,
    callback = function()
        vim.lsp.buf.format({ async = false })
    end
})
