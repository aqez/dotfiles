local terminals = require("open_terminals")

local wk = require("which-key")

wk.add({
    { "<BS>",       "<C-^>",                             desc = "Previous file" },
    { "<C-b>",      ":make<CR>",                         desc = "Build" },
    { "<C-j>",      ":cn<CR>",                           desc = "Next Quickfix" },
    { "<C-k>",      ":cp<CR>",                           desc = "Previous Quickfix" },
    { "<C-s>",      ":w<CR>",                            desc = "Save buffer" },
    { "<CR>",       ":noh<CR><CR>",                      desc = "Clear search highlights" },

    { "<leader>b",  group = "Buffers" },
    { "<leader>bo", ':%bdelete|edit #|normal`"<CR>',     desc = "Kill all but current buffer" },

    { "<leader>d",  group = "Debug/Diagnostics" },
    { "<leader>dd", vim.diagnostic.open_float,           desc = "Show line diagnostic in floating window" },
    { "<leader>dn", vim.diagnostic.goto_next,            desc = "Go to next diagnostic" },
    { "<leader>dp", vim.diagnostic.goto_prev,            desc = "Go to previous diagnostic" },

    { "<leader>h",  "<C-w>h",                            desc = "Move to left window" },
    { "<leader>j",  "<C-w>j",                            desc = "Move to bottom window" },
    { "<leader>k",  "<C-w>k",                            desc = "Move to top window" },
    { "<leader>l",  "<C-w>l",                            desc = "Move to right window" },

    { "<leader>p",  group = "Project" },
    { "<leader>pT", terminals.open_terminals_in_project, desc = "Open terminals in project" },

    { "[e",         ":cprev<CR>",                        desc = "Previous Quickfix" },
    { "]e",         ":cnext<CR>",                        desc = "Next Quickfix" },
})

vim.cmd [[imap <silent><script><expr> <C-q> copilot#Accept('')]]
vim.g.copilot_no_tab_map = 1
