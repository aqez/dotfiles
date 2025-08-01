return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = false,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            workspaces = {
                { name = "notes", path = "~/repos/notes" }
            },
            --notes_subdir = "notes",
            daily_notes = {
                folder = "dailies"
            },
            mappings = {
                --    ["gf"] = {
                --        action = function()
                --            return require("obsidian").util.gf_passthrough()
                --        end
                --    },
                ["<cr>"] = {
                    action = function()
                        return require("obsidian").util.smart_action()
                    end,
                    opts = { buffer = true, expr = true }
                }
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2
            },
        },
        keys = {
            { "<leader>n",   group = "Notes" },
            { "<leader>ns",  "<cmd>ObsidianSearch<cr>",    desc = "Search Notes" },
            { "<leader>nn",  "<cmd>ObsidianNew<cr>",       desc = "New Note" },

            { "<leader>nd",  group = "Dailies",            desc = "Dailies" },
            --{ "<leader>ndd", ":ObsidianDailies<cr>",   desc = "Today" },
            { "<leader>ndd", "<cmd>ObsidianDailies<cr>",   desc = "Today" },
            { "<leader>ndt", "<cmd>ObsidianToday<cr>",     desc = "Today" },
            { "<leader>ndy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday" },
            { "<leader>ndT", "<cmd>ObsidianTomorrow<cr>",  desc = "Tomorrow" },
        }
    }
}
