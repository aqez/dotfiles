return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        --lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            workspaces = {
                { name = "notes", path = "~/vaults/notes" }
            },
            notes_subdir = "notes",
            daily_notes = {
                "notes/dailies"
            }
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2
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
        }
    }
}
