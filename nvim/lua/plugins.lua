local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "neovim/nvim-lspconfig",
    "Issafalcon/lsp-overloads.nvim",
    "f-person/git-blame.nvim",
    "rust-lang/rust.vim",
    "pbrisbin/vim-colors-off",
    "vim-test/vim-test",
    --"github/copilot.vim",
    { "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end
    },
    { "dmmulroy/tsc.nvim",
        config = function()
            require("tsc").setup()
        end
    },
    { "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {}
        end
    },
    { "numToStr/Comment.nvim", opts = { }, lazy = false },
    { 'wakatime/vim-wakatime', lazy = false },
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })
        end,
    },
    { 
        "pwntester/octo.nvim",
        dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("octo").setup({
                default_to_projects_v2 = true
            })
        end
    },
    "mbbill/undotree",
    {
        "stevearc/oil.nvim",
        config = function()
            require('oil').setup({
                keymaps = {
                    ["q"] = "actions.close"
                }
            })
        end
    },
    {
        "clojure-vim/vim-jack-in",
        lazy = true,
        ft = { "python" },
        dependencies = { "tpope/vim-dispatch", "radenling/vim-dispatch-neovim" },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "kkharji/sqlite.lua",
            "danielfalk/smart-open.nvim",
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
                    }
                ),
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
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                ensure_installed = "all",
                highlight = {
                    enable = true,
                    --additional_vim_regex_highlighting = true,
                },
                indent = { enable = true },
                rainbow = { enable = true }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-treesitter.configs').setup {
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.inner",
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.inner",
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.inner",
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.inner",
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                        goto_next = {
                            ["]a"] = "@parameter.inner",
                            ["]A"] = "@parameter.outer",
                            ["]d"] = "@conditional.outer",
                        },
                        goto_previous = {
                            ["[a"] = "@parameter.inner",
                            ["[A"] = "@parameter.outer",
                            ["[d"] = "@conditional.outer",
                        },
                    },
                },
            }
        end
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                automatic_installation = true
            })

            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    lspconfig[server_name].setup {
                        on_attach = function(client)
                            if client.server_capabilities.signatureHelpProvider then
                                require('lsp-overloads').setup(client, {})
                            end
                        end
                    }
                end,

                ["omnisharp"] = function()
                    lspconfig["omnisharp"].setup {
                        on_attach = function(client)
                            --client.server_capabilities.semanticTokensProvider = false
                            require('lsp-overloads').setup(client, {})
                        end
                    }
                end,

                ["lua_ls"] = function()
                    lspconfig["lua_ls"].setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        },
                        on_attach = function(client)
                            require('lsp-overloads').setup(client, {})
                        end
                    }
                end,

                ["clangd"] = function()
                    lspconfig.clangd.setup {
                        cmd = { "clangd", "--offset-encoding=utf-16" }
                    }
                end
            }
        end
    },
    {
        "iabdelkareem/csharp.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "Tastyep/structlog.nvim",
        },
        config = function()
            require("csharp").setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                preselect = cmp.PreselectMode.None,
                mapping = {
                    ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
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
                    end),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }
            })

            --local capabilities = vim.lsp.protocol.make_client_capabilities()
            --require('cmp_nvim_lsp').default_capabilities()
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.cmd [[colorscheme catppuccin-frappe]]
        end
    },
    {
        "shaunsingh/nord.nvim",
        lazy = true,
        config = function()
            vim.g.nord_disable_background = true
            vim.g.nord_borders = true
            require('nord').set();
        end
    },
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat"
        },
        config = function()
            require('leap').create_default_mappings()
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    },
    {
        'TimUntersberger/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('neogit').setup {}
        end
    },
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            local debuggers_folder = vim.fn.stdpath('data') .. "/mason"

            dap.adapters.coreclr = {
                type = "executable",
                command = debuggers_folder .. "/packages/netcoredbg/netcoredbg",
                args = { "--interpreter=vscode" }
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "attach - netcoredbg",
                    request = "attach",
                    processId = require('dap.utils').pick_process,
                }
            }
        end
    },
    { "leoluz/nvim-dap-go",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dap-go").setup()
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap",  "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
        end
    }
})
