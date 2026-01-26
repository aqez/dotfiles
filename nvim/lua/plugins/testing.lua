return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rouge8/neotest-rust",
            "Nsidorenco/neotest-vstest",
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

            -- NOTE: This should be set before calling require("neotest-vstest")
            --- @type neotest_vstest.Config
            vim.g.neotest_vstest = {
                -- Path to dotnet sdk path.
                -- Used in cases where the sdk path cannot be auto discovered.
                sdk_path = "/usr/share/dotnet/sdk",
                -- table is passed directly to DAP when debugging tests.
                dap_settings = {
                    type = "netcoredbg",
                },
                -- If multiple solutions exists the adapter will ask you to choose one.
                -- If you have a different heuristic for choosing a solution you can provide a function here.
                solution_selector = function(solutions)
                    return nil -- return the solution you want to use or nil to let the adapter choose.
                end,
                -- If multiple .runsettings/testconfig.json files are present in the test project directory
                -- you will be given the choice of file to use when setting up the adapter.
                -- Or you can provide a function here
                -- default nil to select from all files in project directory
                settings_selector = function(project_dir)
                    return nil -- return the .runsettings/testconfig.json file you want to use or let the adapter choose
                end,
                build_opts = {
                    -- Arguments that will be added to all `dotnet build` and `dotnet msbuild` commands
                    additional_args = {}
                },
                -- If project contains directories which are not supposed to be searched for solution files
                discovery_directory_filter = function(search_path)
                    -- ignore hidden directories
                    return search_path:match("/%.")
                end,
                timeout_ms = 30 * 5 * 1000 -- number of milliseconds to wait before timeout while communicating with adapter client
            }
            neotest.setup({
                adapters = {
                    require("neotest-vstest"),
                    require("neotest-rust"),
                    require("neotest-go"),
                },
                discovery = {
                    enabled = true,
                    concurrent = 1
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
