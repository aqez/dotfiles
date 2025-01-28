return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "Issafalcon/neotest-dotnet",
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-dotnet")
                }
            })

            local wk = require("which-key")

            wk.add({

                { "<leader>pt",  group = "Test" },
                { "<leader>pta", function() neotest.run.run({ suite = true }) end,        desc = "Test all" },
                { "<leader>ptd", function() neotest.run.run({ strategy = "dap" }) end,    desc = "Debug nearest test" },
                { "<leader>ptf", function() neotest.run.run(vim.fn.expand("%")) end,      desc = "Test file" },
                { "<leader>ptl", neotest.run.run_last,                                    desc = "Run last test" },
                { "<leader>ptn", ":Neotest run<CR>",                                      desc = "Test nearest" },
                { "<leader>pts", ":Neotest summary<CR>",                                  desc = "Toggle summary" },
                { "<leader>ptt", ":Neotest run<CR>",                                      desc = "Test nearest" },
                { "<leader>ptw", function() neotest.watch.toggle(vim.fn.expand("%")) end, desc = "Watch tests in file" },
                { "<leader>pt[", function() neotest.jump.prev({ status = "failed" }) end, desc = "Jump to previous failing test" },
                { "<leader>pt]", function() neotest.jump.prev({ status = "failed" }) end, desc = "Jump to next failing test" },
            })
        end
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("coverage").setup()
        end
    },
}
