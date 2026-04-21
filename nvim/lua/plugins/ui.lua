return {
    "pbrisbin/vim-colors-off",
    "andrewradev/linediff.vim",
    "sindrets/diffview.nvim",
    {
        "Mofiqul/vscode.nvim",
        config = function()
            vim.cmd [[colorscheme vscode]]
        end
    },
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
            { "<leader>ot", function() require('overseer').toggle() end, desc = "Overseer Toggle" }
        },
        opts = {},
        lazy = false,
    },
    {
        "folke/which-key.nvim",
        lazy = false,
        opts = {}
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "Mofiqul/vscode.nvim" },
        config = function()
            vim.o.laststatus = 3
            require('lualine').setup({ globalstatus = true })
            vim.o.laststatus = 3
        end
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
            { "<leader>t", function() require('oil').open('.') end, desc = "Open oil browser at project root" },
            { "<leader>-", function() require('oil').open() end, desc = "Open oil browser at file root" },
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
        keys = {
            { "<leader>Ls", function() require('noice').cmd('telescope') end, desc = "Search log" }
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        commit = "da8bf82a534506989c7bc9189552b5fba958f0c6",
        config = function()
            --local configs = require('nvim-treesitter.configs')
            --configs.setup({
            --    ensure_installed = {
            --        "c_sharp",
            --        "javascript",
            --        "typescript",
            --        "json",
            --        "yaml",
            --        "go",
            --        "lua",
            --        "rust",
            --        "tsx",
            --        "html"
            --    },
            --    highlight = {
            --        enable = true,
            --        --additional_vim_regex_highlighting = true,
            --    },
            --    indent = { enable = true },
            --    rainbow = { enable = true }
            --})
        end
    },
    --{
    --    "nvim-treesitter/nvim-treesitter-textobjects",
    --    --dependencies = "nvim-treesitter/nvim-treesitter",
    --    config = function()
    --        require('nvim-treesitter.configs').setup {
    --            textobjects = {
    --                select = {
    --                    enable = true,
    --                    lookahead = true,
    --                    keymaps = {
    --                        ["af"] = "@function.outer",
    --                        ["if"] = "@function.inner",
    --                        ["ac"] = "@class.outer",
    --                        ["ic"] = "@class.inner",
    --                    },
    --                },
    --                swap = {
    --                    enable = true,
    --                    swap_next = {
    --                        ["<leader>a"] = "@parameter.inner",
    --                    },
    --                    swap_previous = {
    --                        ["<leader>A"] = "@parameter.inner",
    --                    },
    --                },
    --                move = {
    --                    enable = true,
    --                    set_jumps = true,
    --                    goto_next_start = {
    --                        ["]f"] = "@function.inner",
    --                        ["]m"] = "@function.outer",
    --                        ["]]"] = "@class.outer",
    --                    },
    --                    goto_next_end = {
    --                        ["]F"] = "@function.inner",
    --                        ["]M"] = "@function.outer",
    --                        ["]["] = "@class.outer",
    --                    },
    --                    goto_previous_start = {
    --                        ["[f"] = "@function.inner",
    --                        ["[m"] = "@function.outer",
    --                        ["[["] = "@class.outer",
    --                    },
    --                    goto_previous_end = {
    --                        ["[F"] = "@function.inner",
    --                        ["[M"] = "@function.outer",
    --                        ["[]"] = "@class.outer",
    --                    },
    --                    goto_next = {
    --                        ["]a"] = "@parameter.inner",
    --                        ["]A"] = "@parameter.outer",
    --                        ["]d"] = "@conditional.outer",
    --                    },
    --                    goto_previous = {
    --                        ["[a"] = "@parameter.inner",
    --                        ["[A"] = "@parameter.outer",
    --                        ["[d"] = "@conditional.outer",
    --                    },
    --                },
    --            },
    --        }
    --    end
    --},
}
