return {
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
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

            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup_handlers {
                ["lua_ls"] = function()
                    lspconfig["lua_ls"].setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        },
                    }
                end,

                ["clangd"] = function()
                    lspconfig.clangd.setup {
                        cmd = { "clangd", "--offset-encoding=utf-16" }
                    }
                end
            }

            local wk = require("which-key")

            wk.add({
                { "<leader>c",  group = "Code" },
                { "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format buffer" },
                { "K",          vim.lsp.buf.hover,                                   desc = "Show hover" },
                { "<Leader>ca", vim.lsp.buf.code_action,                             desc = "Code actions", mode = "v" },
                { "<leader>ca", vim.lsp.buf.code_action,                             desc = "Code actions" },
                { "<leader>cr", vim.lsp.buf.rename,                                  desc = "Rename symbol" },
            })
        end
    },
    {
        "seblj/roslyn.nvim",
        ft = "cs",
        opts = {
            config = {
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_analyzer_diagnostics_scope = "none",
                        dotnet_compiler_diagnostics_scope = "openFiles"
                    }
                }
            }
            -- your configuration comes here; leave empty for default settings
        }
    },
}
