return {
    {
        "nickjvandyke/opencode.nvim",
        version = "*", -- Latest stable release
        lazy = false,
        dependencies = {
            {
                -- `snacks.nvim` integration is recommended, but optional
                ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
                "folke/snacks.nvim",
                optional = true,
                opts = {
                    input = {}, -- Enhances `ask()`
                    picker = { -- Enhances `select()`
                        actions = {
                            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
                        },
                        win = {
                            input = {
                                keys = {
                                    ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                                },
                            },
                        },
                    },
                },
            },
        },
        config = function()
            ---@type opencode.Opts
            vim.g.opencode_opts = {
                -- Your configuration, if any; goto definition on the type or field for details
            }

            vim.o.autoread = true -- Required for `opts.events.reload`

            local oc = require('opencode')
            local wk = require('which-key')

            wk.add({
                { "<leader>a", group = "Artificial Intelligence" },
                { "<leader>aa", function() oc.ask("@this: ", { submit = true }) end, desc = "Ask opencode...", mode = { "n", "x" } },
                { "<leader>ax", oc.select, desc = "Execute opencode action", mode = { "n", "x" } },
                { "<leader>at", oc.toggle, desc = "Toggle opencode", mode = { "n", "t" } },
                { "<leader>ao", function() return oc.operator("@this ") end, desc = "Add range to opencode", mode = { "n", "x" } },

                { "<leader>au", function() oc.command("session.half.page.up") end, desc = "Scrole opencode up" },
                { "<leader>ad", function() oc.command("session.half.page.down") end, desc = "Scrole opencode down" },
            })
        end,
    }
}
