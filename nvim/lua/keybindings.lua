local opts = { noremap = true, silent = true }

-- Windows
vim.api.nvim_set_keymap("n", "<Leader>h", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<Leader>j", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<Leader>k", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<Leader>l", "<C-w>l", opts)

-- Quick fix
vim.api.nvim_set_keymap("n", "<C-j>", ":cn<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", ":cp<CR>", opts)

-- Vimspector
vim.api.nvim_set_keymap("n", "<Leader>vr", ":VimspectorReset<CR>", opts)

-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>p", ":Telescope find_files find_command=rg,--ignore,--files<CR>", opts)

-- nvim-tree
vim.api.nvim_set_keymap("n", "<Leader>t", ":NvimTreeToggle<CR>", opts)

-- Telescope / LSP
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fi", ":Telescope lsp_implementations<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fu", ":Telescope lsp_references<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader><space>", ":Telescope lsp_code_actions<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader><space>", ":Telescope lsp_range_code_actions<CR>", opts)
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>bs", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>gr", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rt", ":TestNearest<CR>", opts)


