pcall(vim.cmd.compiler, "tsc")
vim.opt_local.makeprg = "npx tsc --noEmit --pretty"

require("formatting").cleanup_and_format_on_save("typescriptreact-format", { async = false })

local group = vim.api.nvim_create_augroup("typescriptreact-codelens", { clear = false })
vim.api.nvim_clear_autocmds({ group = group, buffer = 0 })
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    group = group,
    buffer = 0,
    callback = function()
        pcall(vim.lsp.codelens.refresh, { bufnr = 0 })
    end,
})
