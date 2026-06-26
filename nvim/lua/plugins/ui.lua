return {
    "pbrisbin/vim-colors-off",
    "andrewradev/linediff.vim",
    {
        "esmuellert/codediff.nvim",
        cmd = "CodeDiff",
        opts = {
            diff = {
                ignore_trim_whitespace = true
            }
        }
    },
    {
        "Mofiqul/vscode.nvim",
        config = function()
            vim.cmd [[colorscheme vscode]]
            end
    },
    {
        "romus204/tree-sitter-manager.nvim",
        dependencies = {}, 
        config = function()
            require("tree-sitter-manager").setup()
        end,
    },
    {
        "NStefan002/screenkey.nvim",
        cmd = "Screenkey",
        opts = {
            group_mappings = true
        },
        version = "*", -- or branch = "main", to use the latest commit
    },
    {
        "stevearc/overseer.nvim",
        keys = {
            { "<leader>o",  group = "Overseer" },
            { "<leader>or", ":OverseerRun<cr>",                          desc = "Overseer Run" },
            { "<leader>ot", function() require('overseer').toggle() end, desc = "Overseer Toggle" }
        },
        opts = {},
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
            { "<leader>-", function() require('oil').open() end,    desc = "Open oil browser at file root" },
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
                hover = {
                    enabled = true,
                    silent = false
                }
            },
            presets = {
                bottom_search = false,        -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
            }
            -- add any options here
        },
        keys = {
            { "<leader>Ls", function() require('noice').cmd('telescope') end, desc = "Search log" },
            { "<leader>Ll", function() require('noice').cmd('last') end,      desc = "Last log entry popup" }
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
}
