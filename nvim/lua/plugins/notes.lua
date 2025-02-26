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
                { name = "notes", path = "~/vaults/notes" }
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
            { "<leader>n",  group = "Notes" },
            { "<leader>ns", ":ObsidianSearch", desc = "Search Notes" },
            { "<leader>nn", ":ObsidianNew",    desc = "New Note" }
        }
    }
}
