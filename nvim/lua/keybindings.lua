local terminals = require("open_terminals")

local opts = { remap = false, silent = true }

-- Windows
local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        h = { "<C-w>h", "Move to left window" },
        j = { "<C-w>j", "Move to bottom window" },
        k = { "<C-w>k", "Move to top window" },
        l = { "<C-w>l", "Move to right window" },
        H = { ":Telescope help_tags<CR>", "Search help tags" },
        ["<space>"] = { ":Telescope smart_open theme=ivy<CR>", "Open Telescope" },
        t = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
        b = {
            name = "Buffers",
            s = { ":Telescope buffers theme=ivy<CR>", "Search buffers" },
            f = { ":Telescope current_buffer_fuzzy_find<CR>", "Find in buffer" },
        },
        c = {
            name = "Code",
            a = { vim.lsp.buf.code_action, "Code actions" },
            i = { ":Telescope lsp_implementations theme=ivy<CR>", "Go to implementation" },
            f = { function() vim.lsp.buf.format { async = true } end, "Format buffer" },
            r = { vim.lsp.buf.rename, "Rename symbol" },
        },
        g = {
            name = "Git",
            s = { ":Telescope git_status theme=ivy<CR>", "Search git status" },
            b = { ":Telescope git_branches theme=ivy<CR>", "Search git branches" },
            c = { ":Telescope git_commits theme=ivy<CR>", "Search git commits" },
        },
        p = {
            name = "Project",
            T = { terminals.open_terminals_in_project, "Open terminals in project" },
            t = {
                name = "Test",
                n = { ":TestNearest<CR>", "Test nearest" },
                f = { ":TestFile<CR>", "Test file" },
                s = { ":TestSuite<CR>", "Test suite" },
                l = { ":TestLast<CR>", "Test last" },
            }
        },
        d = {
            name = "Diagnostics",
            d = { vim.diagnostic.open_float, "Show line diagnostic in floating window" },
            n = { vim.diagnostic.goto_next, "Go to next diagnostic" },
            p = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
        },
    },
    -- Quick fix
    ["<C-j>"] = { ":cn<CR>", "Next Quickfix" },
    ["<C-k>"] = { ":cp<CR>", "Previous Quickfix" },

    g = {
        name = "Goto+",
        d = { ":Telescope lsp_definitions theme=ivy<CR>", "Go to definition" },
        D = { ":Telescope lsp_references theme=ivy<CR>", "Go to references" },
    },
    K = { vim.lsp.buf.hover, "Show hover" },
    ["<C-b>"] = { ":make<CR>", "Build" },
    ["rg"] = { ":Telescope live_grep<CR>", "Live grep" }
})

wk.register({
    ["<Leader>"] = {
        c = {
            name = "Code",
            a = { vim.lsp.buf.code_action, "Code actions" },
        }
    }
}, { mode = "v" })


vim.cmd [[imap <silent><script><expr> <C-q> copilot#Accept('')]]
vim.g.copilot_no_tab_map = 1
