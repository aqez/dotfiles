return {
    {
        "dmmulroy/tsc.nvim",
        lazy = false,
        opts = {
            bin_path = "/home/aqez/repos/safe-clean-water/SafeCleanWater.ProjectsModule.WebClient/node_modules/.bin/tsc"
        }
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        keys = {
            { "<leader>cI", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
        },
        opts = {},
    }
}
