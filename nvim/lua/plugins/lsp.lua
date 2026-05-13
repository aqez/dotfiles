return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry"
                }
            })
            require("mason-lspconfig").setup({
                --automatic_installation = true
            })

            local wk = require("which-key")

            wk.add({
                { "<leader>c",  group = "Code" },
                { "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format buffer" },
                { "K",          function() vim.lsp.buf.hover() end,                  desc = "Show hover" },
                { "<leader>ca", function() vim.lsp.buf.code_action() end,            desc = "Code actions", mode = "v" },
                { "<leader>ca", function() vim.lsp.buf.code_action() end,            desc = "Code actions" },
                { "<leader>cr", function() vim.lsp.buf.rename() end,                 desc = "Rename symbol" },
            })
        end
    },
    {
        "seblj/roslyn.nvim",
        ft = "cs",
        opts = {
            filewatching = "off",
            config = {
                settings = {
                    ["csharp|background_analysis"] = {
                        --dotnet_analyzer_diagnostics_scope = "none",
                        dotnet_compiler_diagnostics_scope = "openFiles"
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = false,
                    },
                }
            }
            -- your configuration comes here; leave empty for default settings
        }
    },
}
