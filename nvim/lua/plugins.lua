local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd "packadd packer.nvim"
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
            --local colors = {
            --    black = "#000000",
            --    white = "#FFFFFF",
            --    grey = "#444444",
            --}
            --require('lualine').setup({
            --    options = {
            --        theme = {
            --            normal = {
            --                a = { fg = colors.white, bg = colors.black },
            --                b = { fg = colors.white, bg = colors.black },
            --                c = { fg = colors.white, bg = colors.black },
            --            },
            --        }
            --    }
            --})
        end
    }

    use {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local nvim_tree = require("nvim-tree")
            nvim_tree.setup()
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "kkharji/sqlite.lua",
            "danielfalk/smart-open.nvim"
        },
        config = function()
            local telescope = require('telescope')
            telescope.setup({
                defaults = vim.tbl_extend(
                    "force",
                    require('telescope.themes').get_ivy(),
                    {
                        file_sorter = require('telescope.sorters').get_fzy_sorter,
                        mappings = {
                            i = {
                                ["<C-k>"] = require('telescope.actions').move_selection_previous,
                                ["<C-j>"] = require('telescope.actions').move_selection_next,
                            },
                            n = {
                                ["<C-d>"] = require('telescope.actions').delete_buffer
                            }
                        }
                    }),
                extensions = {
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true
                    },
                    ["ui-select"] = {}
                }
            })
            telescope.load_extension('fzy_native')
            telescope.load_extension('ui-select')
            telescope.load_extension('smart_open')
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            local treesitter = require('nvim-treesitter.configs')
            treesitter.setup({
                ensure_installed = "all",
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                rainbow = {
                    enable = true
                }
            })
        end
    }

    use "neovim/nvim-lspconfig"

    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate",
        requires = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                automatic_installation = true
            })


            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,

                ["omnisharp"] = function()
                    require("lspconfig")["omnisharp"].setup {
                        on_attach = function(client)
                            client.server_capabilities.semanticTokensProvider = nil
                        end
                    }
                end,

                ["lua_ls"] = function()
                    require("lspconfig")["lua_ls"].setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end
            }
        end
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                preselect = cmp.PreselectMode.None,
                mapping = {
                    ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end),
                    ['<S-Tab>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        end
                    end)
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                    { name = "buffer" }
                }
            })

            --local capabilities = vim.lsp.protocol.make_client_capabilities()
            require('cmp_nvim_lsp').default_capabilities()
        end
    }

    use "vim-test/vim-test"

    use "rust-lang/rust.vim"

    use {
        "shaunsingh/nord.nvim",
        config = function()
            vim.g.nord_disable_background = true
            vim.g.nord_borders = true
            require('nord').set();
        end
    }

    use "github/copilot.vim"

    use {
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                api_key_cmd = "cat /home/aqez/.config/openai.token",
                openai_params = {
                    model = "gpt-3.5-turbo-16k",
                    frequency_penalty = 0,
                    presence_penalty = 0,
                    max_tokens = 300,
                    temperature = 0,
                    top_p = 1,
                    n = 1,
                },
                openai_edit_params = {
                    model = "code-davinci-edit-001",
                    temperature = 0.3,
                    top_p = 1,
                    n = 1,
                },
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    }

    use {
        "ggandor/leap.nvim",
        requires = {
            "tpope/vim-repeat"
        },
        config = function()
            require("leap").add_default_mappings()
        end
    }

    use "elkowar/yuck.vim"

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    use {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('neogit').setup {}
        end
    }

    use "f-person/git-blame.nvim"

    use "vimwiki/vimwiki"

    use {
        "pbrisbin/vim-colors-off",
        config = function()
            -- vim.cmd [[ colorscheme off ]]
        end
    }

    use {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')

            dap.adapters.coreclr = {
                type = "executable",
                command = "/usr/bin/netcoredbg",
                args = { "--interpreter=vscode" }
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "Attach to dotnet process",
                    request = "attach",
                    processId = "${command:pickProcess}"
                },
                {
                    type = "coreclr",
                    name = "Launch program",
                    request = "launch",
                    program = "${command:pickFile}"
                }
            }
        end
    }

    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function()
            require("dapui").setup()
        end
    }

    use {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({
                library = {
                    plugins = {
                        "nvim-dap-ui"
                    },
                    types = true
                }
            })
        end
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)

local packer_auto_compile = vim.api.nvim_create_augroup("packer_auto_compile", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/nvim/lua/plugins.lua",
    command = [[source <afile> | PackerCompile]],
    group = packer_auto_compile
})
