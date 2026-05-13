return {
    {
        "dmmulroy/tsc.nvim",
        ft = { "typescript", "typescriptreact" },
        opts = {}
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
