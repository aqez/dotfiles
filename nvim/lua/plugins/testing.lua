return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rouge8/neotest-rust",
            "Issafalcon/neotest-dotnet",
            "nvim-neotest/neotest-go"
        },
        lazy = false,
        keys = {
            { "<leader>pt",  group = "Test" },
            { "<leader>pta", function() require('neotest').run.run({ suite = true }) end,        desc = "Test all" },
            { "<leader>ptd", function() require('neotest').run.run({ strategy = "dap" }) end,    desc = "Debug nearest test" },
            { "<leader>ptf", function() require('neotest').run.run(vim.fn.expand("%")) end,      desc = "Test file" },
            { "<leader>ptl", function() require('neotest').run.run_last() end,                   desc = "Run last test" },
            { "<leader>ptn", ":Neotest run<CR>",                                                 desc = "Test nearest" },
            { "<leader>pts", function() require('neotest').summary.toggle() end,                 desc = "Toggle summary" },
            { "<leader>ptt", ":Neotest run<CR>",                                                 desc = "Test nearest" },
            { "<leader>pto", function() require('neotest').output_panel.toggle() end,                  desc = "Show test output" },
            { "<leader>ptw", function() require('neotest').watch.toggle(vim.fn.expand("%")) end, desc = "Watch tests in file" },
            { "<leader>pt[", function() require('neotest').jump.prev({ status = "failed" }) end, desc = "Jump to previous failing test" },
            { "<leader>pt]", function() require('neotest').jump.prev({ status = "failed" }) end, desc = "Jump to next failing test" },
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-dotnet"),
                    require("neotest-rust"),
                    require("neotest-go"),
                }
            })
        end,
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("coverage").setup()
        end
    },
}
