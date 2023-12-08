local terminals = require("open_terminals")

local opts = { remap = false, silent = true }

-- Windows
local wk = require("which-key")

local telescope = require("telescope");
local builtin = require("telescope.builtin")
local dap = require("dap")
local dapui = require("dapui")

wk.register({
    ["<leader>"] = {
        h = { "<C-w>h", "Move to left window" },
        j = { "<C-w>j", "Move to bottom window" },
        k = { "<C-w>k", "Move to top window" },
        l = { "<C-w>l", "Move to right window" },
        H = { ":Telescope help_tags<CR>", "Search help tags" },
        ["<space>"] = { function() telescope.extensions.smart_open.smart_open({ cwd_only = true }) end, "Smart open" },
        t = { ":NvimTreeFindFileToggle<CR>", "Toggle file tree" },
        b = {
            name = "Buffers",
            s = { builtin.buffers, "Search buffers" },
            f = { builtin.current_buffer_fuzzy_find, "Find in buffer" },
        },
        c = {
            name = "Code",
            a = { vim.lsp.buf.code_action, "Code actions" },
            i = { builtin.lsp_implementations, "Go to implementation" },
            f = { function() vim.lsp.buf.format { async = true } end, "Format buffer" },
            r = { vim.lsp.buf.rename, "Rename symbol" },
        },
        g = {
            name = "Git",
            g = { function() vim.fn.system("tmux new-window -S -n 'lazy-git' lg") end, "Open lazy-git" },
            s = { builtin.git_status, "Git status" },
            b = { builtin.git_branches, "Git branches" },
            c = { builtin.git_commits, "Git commits" },
            C = { builtin.git_bcommits, "Git buffer commits" },
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
            r = { dap.repl.open, "Open debugging REPL" },
            t = { dapui.toggle, "Toggle debugging UI" },
        },
        s = {
            name = "Snippets",
            r = { ":source ~/.config/nvim/lua/snippets.lua<CR>", "Reload snippets" },
        },
        e = {
            name = "Editor",
            r = { ":source $MYVIMRC<CR>:source ~/.config/nvim/lua/keybindings.lua<CR>:echo \"Config reloaded!\"<CR>",
                "Reload config" },
            e = { ":e ~/.config/nvim/init.lua<CR>", "Edit config" },
            c = { ":Telescope colorscheme<CR>", "Pick colorscheme" },
        },
        u = {
            name = "Undo Tree",
            t = { ":UndotreeToggle<CR>", "Toggle undo tree" },
        },
        ["rg"] = { ":Telescope live_grep<CR>", "Live grep" }
    },
    -- Quick fix
    ["<C-j>"] = { ":cn<CR>", "Next Quickfix" },
    ["<C-k>"] = { ":cp<CR>", "Previous Quickfix" },
    ["]e"] = { ":cnext<CR>", "Next Quickfix" },
    ["[e"] = { ":cprev<CR>", "Previous Quickfix" },

    g = {
        name = "Goto",
        d = { builtin.lsp_definitions, "Go to definition" },
        D = { builtin.lsp_references, "Go to references" },
    },
    K = { vim.lsp.buf.hover, "Show hover" },
    ["<C-b>"] = { ":make<CR>", "Build" },
    ["<F9>"] = { dap.toggle_breakpoint, "Toggle breakpoint" },
    ["<F5>"] = { dap.continue, "Continue debugging" },
    ["<F10>"] = { dap.step_over, "Step over" },
    ["<F11>"] = { dap.step_into, "Step into" },
    ["<F12>"] = { dap.step_out, "Step out" },
    ["<BS>"] = { "<C-^>", "Previous file" }
})

wk.register({
    ["<Leader>"] = {
        c = {
            name = "Code",
            a = { vim.lsp.buf.code_action, "Code actions" },
        }
    }
}, { mode = "v" })

local ls = require("luasnip")
wk.register({
    ["<C-k>"] = {
        function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end,
        "Expand snipet"
    },
    ["<C-j>"] = {
        function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end,
        "Jump to previous snippet"
    },
    ["<C-l>"] = {
        function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, "Toggle snippet choice"
    }
}, { mode = { "i", "s" } })

vim.cmd [[imap <silent><script><expr> <C-q> copilot#Accept('')]]
vim.g.copilot_no_tab_map = 1
