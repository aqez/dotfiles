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

local smart_open = function()
    telescope.extensions.smart_open.smart_open({ cwd_only = true })
end

local reload_config = function()
    vim.cmd('source $MYVIMRC')
    vim.cmd('source ~/.config/nvim/lua/keybindings.lua')
    vim.cmd('echo "Config reloaded!"')
end

wk.add({
    { "<A-x>",           ":Telescope commands<CR>",                               desc = "M-x" },
    { "<BS>",            "<C-^>",                                                 desc = "Previous file" },
    { "<C-b>",           ":make<CR>",                                             desc = "Build" },
    { "<C-j>",           ":cn<CR>",                                               desc = "Next Quickfix" },
    { "<C-k>",           ":cp<CR>",                                               desc = "Previous Quickfix" },
    { "<C-s>",           ":w<CR>",                                                desc = "Save buffer" },
    { "<CR>",            ":noh<CR><CR>",                                          desc = "Clear search highlights" },
    { "<F10>",           dap.step_over,                                           desc = "Step over" },
    { "<F11>",           dap.step_into,                                           desc = "Step into" },
    { "<F12>",           dap.step_out,                                            desc = "Step out" },
    { "<F5>",            dap.continue,                                            desc = "Continue debugging" },
    { "<F9>",            dap.toggle_breakpoint,                                   desc = "Toggle breakpoint" },
    { "<leader>-",       oil.open,                                                desc = "Open oil browser at file root" },
    { "<leader><space>", smart_open,                                              desc = "Smart open" },
    { "<leader>H",       ":Telescope help_tags<CR>",                              desc = "Search help tags" },
    { "<leader>T",       "<cmd>ToggleTerm<cr>",                                   desc = "Toggle terminal" },

    { "<leader>b",       group = "Buffers" },
    { "<leader>bf",      builtin.current_buffer_fuzzy_find,                       desc = "Find in buffer" },
    { "<leader>bo",      ':%bdelete|edit #|normal`"<CR>',                         desc = "Kill all but current buffer" },
    { "<leader>bs",      builtin.buffers,                                         desc = "Search buffers" },

    { "<leader>c",       group = "Code" },
    { "<leader>ca",      vim.lsp.buf.code_action,                                 desc = "Code actions" },
    { "<leader>cf",      function() vim.lsp.buf.format({ async = true }) end,     desc = "Format buffer" },
    { "<leader>ci",      builtin.lsp_implementations,                             desc = "Go to implementation" },
    { "<leader>cr",      vim.lsp.buf.rename,                                      desc = "Rename symbol" },

    { "<leader>d",       group = "Debug/Diagnostics" },
    { "<leader>dd",      vim.diagnostic.open_float,                               desc = "Show line diagnostic in floating window" },
    { "<leader>dh",      dapui_widgets.preview,                                   desc = "Show hover" },
    { "<leader>dn",      vim.diagnostic.goto_next,                                desc = "Go to next diagnostic" },
    { "<leader>dp",      vim.diagnostic.goto_prev,                                desc = "Go to previous diagnostic" },
    { "<leader>dr",      dap.repl.open,                                           desc = "Open debugging REPL" },
    { "<leader>dt",      dapui.toggle,                                            desc = "Toggle debugging UI" },

    { "<leader>e",       group = "Editor" },
    { "<leader>ec",      ":Telescope colorscheme<CR>",                            desc = "Pick colorscheme" },
    { "<leader>ee",      ":e ~/.config/nvim/init.lua<CR>",                        desc = "Edit config" },
    { "<leader>er",      reload_config,                                           desc = "Reload config" },

    { "<leader>g",       group = "Git" },
    { "<leader>gB",      ":GitBlameToggle<CR>",                                   desc = "Toggle git blame" },
    { "<leader>gC",      builtin.git_bcommits,                                    desc = "Git buffer commits" },
    { "<leader>gb",      builtin.git_branches,                                    desc = "Git branches" },
    { "<leader>gc",      builtin.git_commits,                                     desc = "Git commits" },
    { "<leader>gf",      ":!git pull<CR>",                                        desc = "Git pull" },
    { "<leader>gg",      ":Neogit<CR>",                                           desc = "Open Neogit" },
    { "<leader>gs",      builtin.git_status,                                      desc = "Git status" },

    { "<leader>gi",      group = "Issues" },
    { "<leader>gic",     ":Octo issue create<CR>",                                desc = "Create issue" },
    { "<leader>gil",     ":Octo issue list<CR>",                                  desc = "Open Octo issue list" },

    { "<leader>gp",      group = "Pull Requests" },
    { "<leader>gpb",     ":Octo pr browser<CR>",                                  desc = "Open PR in browser" },
    { "<leader>gpc",     ":Octo pr create<CR>",                                   desc = "Create Pull Request" },
    { "<leader>gpl",     ":Octo pr list<CR>",                                     desc = "Open Octo PR list" },
    { "<leader>gpu",     ":Octo pr url<CR>",                                      desc = "Copy PR URL" },

    { "<leader>h",       "<C-w>h",                                                desc = "Move to left window" },
    { "<leader>j",       "<C-w>j",                                                desc = "Move to bottom window" },
    { "<leader>k",       "<C-w>k",                                                desc = "Move to top window" },
    { "<leader>l",       "<C-w>l",                                                desc = "Move to right window" },

    { "<leader>o",       group = "Overseer" },
    { "<leader>or",      "<cmd>OverseerRun<cr>",                                  desc = "Overseer Run" },
    { "<leader>ot",      "<cmd>OverseerToggle v<cr>",                             desc = "Overseer Toggle" },

    { "<leader>p",       group = "Project" },
    { "<leader>pT",      terminals.open_terminals_in_project,                     desc = "Open terminals in project" },

    { "<leader>pt",      group = "Test" },
    { "<leader>pta",     function() neotest.run.run({ suite = true }) end,        desc = "Test all" },
    { "<leader>ptd",     function() neotest.run.run({ strategy = "dap" }) end,    desc = "Debug nearest test" },
    { "<leader>ptf",     function() neotest.run.run(vim.fn.expand("%")) end,      desc = "Test file" },
    { "<leader>ptl",     neotest.run.run_last,                                    desc = "Run last test" },
    { "<leader>ptn",     ":Neotest run<CR>",                                      desc = "Test nearest" },
    { "<leader>pts",     ":Neotest summary<CR>",                                  desc = "Toggle summary" },
    { "<leader>ptt",     ":Neotest run<CR>",                                      desc = "Test nearest" },
    { "<leader>ptw",     function() neotest.watch.toggle(vim.fn.expand("%")) end, desc = "Watch tests in file" },
    { "<leader>pt[",     function() neotest.jump.prev({ status = "failed" }) end, desc = "Jump to previous failing test" },
    { "<leader>pt]",     function() neotest.jump.prev({ status = "failed" }) end, desc = "Jump to next failing test" },

    { "<leader>rg",      ":Telescope live_grep<CR>",                              desc = "Live grep" },
    { "<leader>t",       ":Oil .<CR>",                                            desc = "Open oil browser at project root" },

    { "<leader>u",       group = "Undo Tree" },
    { "<leader>ut",      ":UndotreeToggle<CR>",                                   desc = "Toggle undo tree" },

    { "K",               vim.lsp.buf.hover,                                       desc = "Show hover" },
    { "[e",              ":cprev<CR>",                                            desc = "Previous Quickfix" },
    { "]e",              ":cnext<CR>",                                            desc = "Next Quickfix" },

    { "g",               group = "Goto" },
    { "gD",              builtin.lsp_references,                                  desc = "Go to references" },
    { "gd",              builtin.lsp_definitions,                                 desc = "Go to definition" },
    { "gt",              builtin.lsp_type_definitions,                            desc = "Go to type definition" },

    { "<Leader>c",       group = "Code",                                          mode = "v" },
    { "<Leader>ca",      vim.lsp.buf.code_action,                                 desc = "Code actions",                           mode = "v" },
    { "<Esc>",           "<C-\\><C-n>",                                           desc = "Exit terminal mode",                     mode = "t" },
})

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
