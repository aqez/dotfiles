return {
    "pbrisbin/vim-colors-off",
    "andrewradev/linediff.vim",
    "Mofiqul/vscode.nvim",
    {
        "NStefan002/screenkey.nvim",
        lazy = false,
        opts = {
            group_mappings = true
        },
        version = "*", -- or branch = "main", to use the latest commit
    },
    {
        "stevearc/overseer.nvim",
        keys = {
            { "<leader>o",  group = "Overseer" },
            { "<leader>or", ":OverseerRun<cr>",    desc = "Overseer Run" },
            { "<leader>ot", ":OverseerToggle<cr>", desc = "Overseer Toggle" }
        },
        opts = {},
        lazy = false,
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
        lazy = false,
        opts = {}
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "Mofiqul/vscode.nvim" },
        opts = {}
    },
    {
        "stevearc/oil.nvim",
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime"
            },
            keymaps = {
                ["q"] = "actions.close"
            }
        },
        keys = {
            { "<leader>t", ":Oil .<CR>", desc = "Open oil browser at project root" },
            { "<leader>-", ":Oil<CR>",   desc = "Open oil browser at file root" },
        }
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
            timeout = 100,
            render = "wrapped-compact"
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                signature = {
                    auto_open = { enabled = false }
                },

                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            presets = {
                bottom_search = false,        -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            }
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
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
