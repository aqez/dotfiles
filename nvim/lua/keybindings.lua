local terminals = require("open_terminals")

local opts = { remap = false, silent = true }

-- Windows
local wk = require("which-key")

local telescope = require("telescope");
local builtin = require("telescope.builtin")
local dap = require("dap")
local dapui = require("dapui")
local dapui_widgets = require("dap.ui.widgets")
local neotest = require("neotest")

local oil = require("oil")

wk.register({
    ["<leader>"] = {
        h = { "<C-w>h", "Move to left window" },
        j = { "<C-w>j", "Move to bottom window" },
        k = { "<C-w>k", "Move to top window" },
        l = { "<C-w>l", "Move to right window" },
        H = { ":Telescope help_tags<CR>", "Search help tags" },
        ["<space>"] = { function() telescope.extensions.smart_open.smart_open({ cwd_only = true }) end, "Smart open" },
        --t = { ":NvimTreeFindFileToggle<CR>", "Toggle file tree" },
        t = { ":Oil .<CR>", "Open oil browser at project root" },
        ["-"] = { oil.open, "Open oil browser at file root" },
        b = {
            name = "Buffers",
            s = { builtin.buffers, "Search buffers" },
            f = { builtin.current_buffer_fuzzy_find, "Find in buffer" },
            o = { ":%bdelete|edit #|normal`\"<CR>", "Kill all but current buffer" },
        },
        c = {
            name = "Code",
            a = { vim.lsp.buf.code_action, "Code actions" },
            i = { builtin.lsp_implementations, "Go to implementation" },
            f = { function() vim.lsp.buf.format({ async = true }) end, "Format buffer" },
            r = { vim.lsp.buf.rename, "Rename symbol" },
        },
        g = {
            name = "Git",
            --g = { function() vim.fn.system("tmux new-window -S -n 'lazy-git' lg") end, "Open lazy-git" },
            g = { ":Neogit<CR>", "Open Neogit" },
            s = { builtin.git_status, "Git status" },
            b = { builtin.git_branches, "Git branches" },
            B = { ":GitBlameToggle<CR>", "Toggle git blame" },
            c = { builtin.git_commits, "Git commits" },
            C = { builtin.git_bcommits, "Git buffer commits" },
            i = { ":Octo issue list<CR>", "Open Octo issue list" },
            p = {
                name = "Pull Requests",
                l = { ":Octo pr list<CR>", "Open Octo PR list" },
                c = { ":Octo pr create<CR>", "Create Pull Request" },
                b = { ":Octo pr browser<CR>", "Open PR in browser" },
                u = { ":Octo pr url<CR>", "Copy PR URL" },
            },
            f = { ":!git pull<CR>", "Git pull" },
        },
        p = {
            name = "Project",
            T = { terminals.open_terminals_in_project, "Open terminals in project" },
            t = {
                name = "Test",
                d = { function() neotest.run.run({ strategy = "dap" }) end, "Debug nearest test" },
                a = { function() neotest.run.run({ suite = true }) end, "Test all" },
                n = { ":Neotest run<CR>", "Test nearest" },
                t = { ":Neotest run<CR>", "Test nearest" },
                f = { function() neotest.run.run(vim.fn.expand("%")) end, "Test file" },
                s = { ":Neotest summary<CR>", "Toggle summary" },
                l = { neotest.run.run_last, "Run last test" },
                w = { function() neotest.watch.toggle(vim.fn.expand("%")) end, "Watch tests in file" }
            }
        },
        d = {
            name = "Debug/Diagnostics",
            d = { vim.diagnostic.open_float, "Show line diagnostic in floating window" },
            n = { vim.diagnostic.goto_next, "Go to next diagnostic" },
            p = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
            r = { dap.repl.open, "Open debugging REPL" },
            t = { dapui.toggle, "Toggle debugging UI" },
            h = { dapui_widgets.preview, "Show hover" },
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
        T = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
        o = {
            name = "Overseer",
            t = { "<cmd>OverseerToggle v<cr>", "Overseer Toggle" },
            r = { "<cmd>OverseerRun<cr>", "Overseer Run" }
        },
        ["rg"] = { ":Telescope live_grep<CR>", "Live grep" }
    },
    -- Quick fix
    ["<C-j>"] = { ":cn<CR>", "Next Quickfix" },
    ["<C-k>"] = { ":cp<CR>", "Previous Quickfix" },
    ["<C-s>"] = { ":w<CR>", "Save buffer" },
    ["]e"] = { ":cnext<CR>", "Next Quickfix" },
    ["[e"] = { ":cprev<CR>", "Previous Quickfix" },
    ["]t"] = { function() neotest.jump.next({ status = "failed" }) end, "Jump to next failing test" },
    ["[t"] = { function() neotest.jump.prev({ status = "failed" }) end, "Jump to previous failing test" },

    g = {
        name = "Goto",
        d = { builtin.lsp_definitions, "Go to definition" },
        D = { builtin.lsp_references, "Go to references" },
        t = { builtin.lsp_type_definitions, "Go to type definition" },
    },
    K = { vim.lsp.buf.hover, "Show hover" },
    ["<C-b>"] = { ":make<CR>", "Build" },
    ["<F9>"] = { dap.toggle_breakpoint, "Toggle breakpoint" },
    ["<F5>"] = { dap.continue, "Continue debugging" },
    ["<F10>"] = { dap.step_over, "Step over" },
    ["<F11>"] = { dap.step_into, "Step into" },
    ["<F12>"] = { dap.step_out, "Step out" },
    ["<BS>"] = { "<C-^>", "Previous file" },
    ["<CR>"] = { ":noh<CR><CR>", "Clear search highlights" },
    ["<A-x>"] = { ":Telescope commands<CR>", "M-x" }
})

wk.register({
    ["<Leader>"] = {
        c = {
            name = "Code",
            a = { vim.lsp.buf.code_action, "Code actions" },
        }
    }
}, { mode = "v" })

wk.register({
    ["<Esc>"] = { "<C-\\><C-n>", "Exit terminal mode" }
}, { mode = "t" })

vim.cmd [[imap <silent><script><expr> <C-q> copilot#Accept('')]]
vim.g.copilot_no_tab_map = 1

--vim.cmd [[ autocmd FileType cs lua c_sharp_go_to_definition() ]]
--function c_sharp_go_to_definition()
--    local csharp = require("csharp")
--    wk.register({
--        g = {
--            d = { csharp.go_to_definition, "Go to definition" }
--        }
--    },  { buffer = vim.api.nvim_get_current_buf() })
--end
