local opts = { remap = false, silent = true }

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
vim.keymap.set("n", "<Leader>p", ":Telescope find_files find_command=rg,--ignore,--files<CR>", opts)
vim.keymap.set("n", "<Leader>bf", ":Telescope current_buffer_fuzzy_find<CR>", opts)
vim.keymap.set("n", "<Leader>H", ":Telescope help_tags<CR>", opts)

-- nvim-tree
vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>", opts)

-- Telescope / LSP
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
vim.keymap.set("n", "<Leader>fi", ":Telescope lsp_implementations<CR>", opts)
vim.keymap.set("n", "<Leader>fu", ":Telescope lsp_references<CR>", opts)
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.formatting, opts)
vim.keymap.set("n", "<leader><space>", vim.lsp.buf.code_action, opts)
vim.keymap.set("v", "<leader><space>", vim.lsp.buf.range_code_action, opts)
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)

vim.keymap.set("n", "<leader>bs", ":Telescope buffers<CR>", opts)
vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", opts)
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", opts)
vim.keymap.set("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

vim.keymap.set("n", "<leader>gr", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>rt", ":TestNearest<CR>", opts)

vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)

vim.keymap.set("n", "<C-b>", ":make<CR>", opts)
