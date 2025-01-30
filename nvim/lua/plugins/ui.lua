return {
    "pbrisbin/vim-colors-off",
    "andrewradev/linediff.vim",
    {
        "stevearc/overseer.nvim",
        config = function()
            require("overseer").setup()

            local wk = require("which-key")

            wk.add({
                { "<leader>o",  group = "Overseer" },
                { "<leader>or", ":OverseerRun<cr>",    desc = "Overseer Run" },
                { "<leader>ot", ":OverseerToggle<cr>", desc = "Overseer Toggle" }
            })
        end
    },
    {
        "Mofiqul/vscode.nvim",
        config = function()
            require('vscode').setup()
            vim.cmd [[colorscheme vscode]]
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            --vim.cmd [[colorscheme catppuccin-frappe]]
        end
    },
    {
        "shaunsingh/nord.nvim",
        lazy = true,
        config = function()
            --vim.g.nord_disable_background = true
            --vim.g.nord_borders = true
            --require('nord').set();
        end
    },
    {
        'NTBBloodbath/doom-one.nvim',
        lazy = false,
        enable = false,
        config = function()
            -- Add color to cursor
            vim.g.doom_one_cursor_coloring = false
            -- Set :terminal colors
            vim.g.doom_one_terminal_colors = true
            -- Enable italic comments
            vim.g.doom_one_italic_comments = false
            -- Enable TS support
            vim.g.doom_one_enable_treesitter = true
            -- Color whole diagnostic text or only underline
            vim.g.doom_one_diagnostics_text_color = false
            -- Enable transparent background
            vim.g.doom_one_transparent_background = false

            -- Pumblend transparency
            vim.g.doom_one_pumblend_enable = false
            vim.g.doom_one_pumblend_transparency = 20

            -- Plugins integration
            vim.g.doom_one_plugin_neorg = true
            vim.g.doom_one_plugin_barbar = false
            vim.g.doom_one_plugin_telescope = true
            vim.g.doom_one_plugin_neogit = true
            vim.g.doom_one_plugin_nvim_tree = true
            vim.g.doom_one_plugin_dashboard = true
            vim.g.doom_one_plugin_startify = true
            vim.g.doom_one_plugin_whichkey = true
            vim.g.doom_one_plugin_indent_blankline = true
            vim.g.doom_one_plugin_vim_illuminate = true
            vim.g.doom_one_plugin_lspsaga = false
            vim.cmd [[colorscheme doom-one]]
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "Mofiqul/vscode.nvim" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "vscode"
                }
            })
        end
    },
    {
        "stevearc/oil.nvim",
        config = function()
            local oil = require('oil')
            oil.setup({
                columns = {
                    "icon",
                    "permissions",
                    "size",
                    "mtime"
                },
                keymaps = {
                    ["q"] = "actions.close"
                }
            })

            local wk = require("which-key")

            wk.add({
                { "<leader>t", ":Oil .<CR>", desc = "Open oil browser at project root" },
                { "<leader>-", oil.open,     desc = "Open oil browser at file root" },
            })
        end
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")

            vim.notify.setup({
                background_colour = "#000000",
                timeout = 500,
            })
        end
    },
    {
        'mrded/nvim-lsp-notify',
        requires = { 'rcarriga/nvim-notify' },
        config = function()
            require('lsp-notify').setup({
                notify = require('notify'),
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                ensure_installed = {
                    "c_sharp",
                    "javascript",
                    "typescript",
                    "json",
                    "yaml",
                    "go",
                    "lua",
                    "rust",
                    "tsx",
                    "html"
                },
                highlight = {
                    enable = true,
                    --additional_vim_regex_highlighting = true,
                },
                indent = { enable = true },
                rainbow = { enable = true }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-treesitter.configs').setup {
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.inner",
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.inner",
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.inner",
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.inner",
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                        goto_next = {
                            ["]a"] = "@parameter.inner",
                            ["]A"] = "@parameter.outer",
                            ["]d"] = "@conditional.outer",
                        },
                        goto_previous = {
                            ["[a"] = "@parameter.inner",
                            ["[A"] = "@parameter.outer",
                            ["[d"] = "@conditional.outer",
                        },
                    },
                },
            }
        end
    },
}
