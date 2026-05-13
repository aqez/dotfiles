local M = {}

local function set_buffer_autocmd(group_name, event, callback)
    local group = vim.api.nvim_create_augroup(group_name, { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = 0 })
    vim.api.nvim_create_autocmd(event, {
        group = group,
        buffer = 0,
        callback = callback,
    })
end

function M.cleanup_blank_lines_and_braces()
    local view = vim.fn.winsaveview()

    vim.cmd([[silent! keeppatterns g/^\_$\n\_^$/d]])
    vim.cmd([[silent! keeppatterns %s/^\(\s*{\)\n\_$/\1/e]])
    vim.cmd([[silent! keeppatterns %s/^\_$\n\(\s*}\)/\1/e]])

    vim.fn.winrestview(view)
end

function M.format(opts)
    vim.lsp.buf.format(vim.tbl_extend("force", { async = false }, opts or {}))
end

function M.cleanup_and_format(opts)
    M.cleanup_blank_lines_and_braces()
    M.format(opts)
end

function M.format_on_save(group_name, opts)
    set_buffer_autocmd(group_name, "BufWritePre", function()
        M.format(opts)
    end)
end

function M.cleanup_and_format_on_save(group_name, opts)
    set_buffer_autocmd(group_name, "BufWritePre", function()
        M.cleanup_and_format(opts)
    end)
end

return M
