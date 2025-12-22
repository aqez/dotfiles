return {
    {
        "obsidian-nvim/obsidian.nvim",
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
            checkbox = {
                order = { " ", "~", "x" }
            },
            ui = {
                checkboxes = {
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["~"] = { char = "󰡖", hl_group = "ObsidianTilde" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                }
            }
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
