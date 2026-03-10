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
            legacy_commands = false,
            workspaces = {
                { name = "notes", path = "~/repos/notes" }
            },
            daily_notes = {
                folder = "dailies"
            },
            checkbox = {
                order = { " ", "/", "x" }
            },
            ui = { enable = false },
            note_id_func = ( function(title)
                return title:gsub(' ', '-'):gsub('\\[\\^A-Za-z0-9-\\]', ''):lower()
            end),
        },
        keys = {
            { "<leader>n",   group = "Notes" },
            { "<leader>ns",  "<cmd>Obsidian search<cr>",    desc = "Search Notes" },
            { "<leader>nn",  "<cmd>Obsidian new<cr>",       desc = "New Note" },

            { "<leader>nd",  group = "Dailies",            desc = "Dailies" },
            --{ "<leader>ndd", ":ObsidianDailies<cr>",   desc = "Today" },
            { "<leader>ndd", "<cmd>Obsidian dailies<cr>",   desc = "Dailies" },
            { "<leader>ndt", "<cmd>Obsidian today<cr>",     desc = "Today" },
            { "<leader>ndy", "<cmd>Obsidian yesterday<cr>", desc = "Yesterday" },
            { "<leader>ndT", "<cmd>Obsidian tomorrow<cr>",  desc = "Tomorrow" },
        }
    }
}
