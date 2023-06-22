local terminals = require("open_terminals")

local opts = { remap = false, silent = true }

-- Open Terminals in project
vim.keymap.set('n', '<leader>ot', terminals.open_terminals_in_project, { noremap = true })

-- Windows
vim.keymap.set("n", "<Leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<Leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<Leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<Leader>l", "<C-w>l", opts)

-- Quick fix
vim.keymap.set("n", "<C-j>", ":cn<CR>", opts)
vim.keymap.set("n", "<C-k>", ":cp<CR>", opts)

-- Debugging
local dap = require('dap')
local set_conditional_breakpoint = function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", set_conditional_breakpoint)

-- Telescope
vim.keymap.set("n", "<Leader><space>", ":Telescope smart_open theme=ivy<CR>", opts)
--vim.keymap.set("n", "<Leader><space>", ":Telescope find_files theme=ivy find_command=rg,--ignore,--files<CR>", opts)
vim.keymap.set("n", "<Leader>bf", ":Telescope current_buffer_fuzzy_find<CR>", opts)
vim.keymap.set("n", "<Leader>H", ":Telescope help_tags<CR>", opts)

-- nvim-tree
vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>", opts)

-- Telescope / LSP
vim.keymap.set("n", "gd", ":Telescope lsp_definitions theme=ivy<CR>", opts)
vim.keymap.set("n", "<Leader>ci", ":Telescope lsp_implementations theme=ivy<CR>", opts)
vim.keymap.set("n", "gD", ":Telescope lsp_references theme=ivy<CR>", opts)
vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format { async = true } end, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)

vim.keymap.set("n", "<leader>bs", ":Telescope buffers theme=ivy<CR>", opts)
vim.keymap.set("n", "<leader>gs", ":Telescope git_status theme=ivy<CR>", opts)
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches theme=ivy<CR>", opts)
vim.keymap.set("n", "<leader>gc", ":Telescope git_commits theme=ivy<CR>", opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

vim.keymap.set("n", "<leader>rg", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>rt", ":TestNearest<CR>", opts)

vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)

vim.cmd[[imap <silent><script><expr> <C-q> copilot#Accept('')]]
vim.g.copilot_no_tab_map = 1

vim.keymap.set("n", "<C-b>", ":make<CR>", opts)

-- vim.fugitive
vim.keymap.set("n", "<leader>gg", ":G<CR>");

local fugitive_group = vim.api.nvim_create_augroup("fugitive-keybinds", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    command = [[nnoremap <buffer> <leader>gp :G push<CR>]],
    group = fugitive_group
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "fugitive",
    command = [[nnoremap <buffer> q :q<CR>]],
    group = fugitive_group
})

