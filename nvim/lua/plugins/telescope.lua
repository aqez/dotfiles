return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "kkharji/sqlite.lua",
            "danielfalk/smart-open.nvim",
        },
        config = function()
            local telescope = require('telescope')
            telescope.setup({
                defaults = vim.tbl_extend(
                    "force",
                    require('telescope.themes').get_ivy(),
                    {
                        file_sorter = require('telescope.sorters').get_fzy_sorter,
                        mappings = {
                            i = {
                                ["<C-k>"] = require('telescope.actions').move_selection_previous,
                                ["<C-j>"] = require('telescope.actions').move_selection_next,
                            },
                            n = {
                                ["<C-d>"] = require('telescope.actions').delete_buffer
                            }
                        }
                    }
                ),
                extensions = {
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true
                    },
                    ["ui-select"] = {}
                }
            })
            telescope.load_extension('fzy_native')
            telescope.load_extension('ui-select')
            telescope.load_extension('smart_open')

            local smart_open = function()
                telescope.extensions.smart_open.smart_open({ cwd_only = true })
            end

            local builtin = require("telescope.builtin")
            local wk = require("which-key")

            wk.add({
                { "<A-x>",           ":Telescope commands<CR>",         desc = "M-x" },
                { "<leader><space>", smart_open,                        desc = "Smart open" },
                { "<leader>H",       ":Telescope help_tags<CR>",        desc = "Search help tags" },
                { "<leader>bf",      builtin.current_buffer_fuzzy_find, desc = "Find in buffer" },
                { "<leader>bs",      builtin.buffers,                   desc = "Search buffers" },
                { "<leader>ci",      builtin.lsp_implementations,       desc = "Go to implementation" },

                { "<leader>e",       group = "Editor" },
                { "<leader>ec",      ":Telescope colorscheme<CR>",      desc = "Pick colorscheme" },

                { "<leader>gC",      builtin.git_bcommits,              desc = "Git buffer commits" },
                { "<leader>gb",      builtin.git_branches,              desc = "Git branches" },
                { "<leader>gc",      builtin.git_commits,               desc = "Git commits" },
                { "<leader>gs",      builtin.git_status,                desc = "Git status" },
                { "<leader>rg",      ":Telescope live_grep<CR>",        desc = "Live grep" },

                { "g",               group = "Goto" },
                { "gD",              builtin.lsp_references,            desc = "Go to references" },
                { "gd",              builtin.lsp_definitions,           desc = "Go to definition" },
                { "gt",              builtin.lsp_type_definitions,      desc = "Go to type definition" },
            })
        end
    },
}
