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
    use "neovim/nvim-lspconfig"
    use "Issafalcon/lsp-overloads.nvim"
    use "f-person/git-blame.nvim"
    use "pbrisbin/vim-colors-off"
    use "vim-test/vim-test"
    use "rust-lang/rust.vim"
    use "github/copilot.vim"
    use "elkowar/yuck.vim"
    use "mbbill/undotree"
    use "kdheepak/lazygit.nvim"

    use {
        'Olical/conjure',
        config = function()
            local wk = require("which-key")

            vim.cmd [[map <a-cr> ^[^M]]
            wk.register({
                ["<a-cr>"] = ":ConjureEvalRootForm"
            })

        end
    }

    use {
        "dundalek/parpar.nvim",
        requires = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
        config = function()
            local paredit = require("nvim-paredit")
            require("parpar").setup {
                paredit = {
                    -- pass any nvim-paredit options here
                    keys = {
                        -- custom bindings are automatically wrapped
                        ["<A-H>"] = { paredit.api.slurp_backwards, "Slurp backwards" },
                        ["<A-J>"] = { paredit.api.barf_backwards, "Barf backwards" },
                        ["<A-K>"] = { paredit.api.barf_forwards, "Barf forwards" },
                        ["<A-L>"] = { paredit.api.slurp_forwards, "Slurp forwards" },
                        ["<A-h>"] = { paredit.api.drag_element_backwards, "Drag element backwards" },
                        ["<A-l>"] = { paredit.api.drag_element_forwards, "Drag element forwards" },
                        ["<A-k>"] = { paredit.api.raise_form, "Raise form" },
                        ["<A-j>"] = { paredit.api.raise_element, "Raise element" }
                    }
                }
            }
        end
    }

    use {
        "clojure-vim/vim-jack-in",
        requires = { "tpope/vim-dispatch", "radenling/vim-dispatch-neovim" },
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end
    }

    use {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local nvim_tree = require("nvim-tree")
            --nvim_tree.setup()
            local HEIGHT_RATIO = 0.8 -- You can change this
            local WIDTH_RATIO = 0.5  -- You can change this too

            nvim_tree.setup({
                disable_netrw = true,
                hijack_netrw = true,
                respect_buf_cwd = true,
                sync_root_with_cwd = true,
                view = {
                    relativenumber = true,
                    float = {
                        enable = true,
                        open_win_config = function()
                            local screen_w = vim.opt.columns:get()
                            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                            local window_w = screen_w * WIDTH_RATIO
                            local window_h = screen_h * HEIGHT_RATIO
                            local window_w_int = math.floor(window_w)
                            local window_h_int = math.floor(window_h)
                            local center_x = (screen_w - window_w) / 2
                            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                            - vim.opt.cmdheight:get()
                            return {
                                border = "rounded",
                                relative = "editor",
                                row = center_y,
                                col = center_x,
                                width = window_w_int,
                                height = window_h_int,
                            }
                        end,
                    },
                    width = function()
                        return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                    end,
                },
                -- filters = {
                --   custom = { "^.git$" },
                -- },
                -- renderer = {
                --   indent_width = 1,
                -- },
            })
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
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
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
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
    }

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
                    require("lspconfig")[server_name].setup {
                        on_attach = function(client)
                            if client.server_capabilities.signatureHelpProvider then
                                require('lsp-overloads').setup(client, {})
                            end
                        end
                    }
                end,

                ["omnisharp"] = function()
                    require("lspconfig")["omnisharp"].setup {
                        on_attach = function(client)
                            --client.server_capabilities.semanticTokensProvider = false
                            require('lsp-overloads').setup(client, {})
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
                        },
                        on_attach = function(client)
                            require('lsp-overloads').setup(client, {})
                        end
                    }
                end
            }
        end
    }

    use {
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local luasnip = require("luasnip")
            luasnip.config.set_config({
                history = true,
                updateevents = "TextChanged,TextChangedI"
            })
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
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
                    { name = "luasnip" },
                    { name = "buffer" }
                }
            })

            --local capabilities = vim.lsp.protocol.make_client_capabilities()
            --require('cmp_nvim_lsp').default_capabilities()
        end
    }

    use { 
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.cmd [[colorscheme catppuccin-frappe]]
        end
    }
    use {
        "sonph/onehalf",
        rtp = "vim",
        config = function()
            -- vim.cmd [[colorscheme onehalflight]]
        end
    }

    use {
        "shaunsingh/nord.nvim",
        config = function()
            -- vim.g.nord_disable_background = true
            -- vim.g.nord_borders = true
            -- require('nord').set();
        end
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

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    use {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'ibhagwan/fzf-lua',
        },
        config = function()
            require('neogit').setup {}
        end
    }

    use {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')

            dap.adapters.coreclr = {
                type = "executable",
                command = "netcoredbg",
                args = { "--interpreter=vscode" }
            }
        end
    }

    use {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
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

    use {
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup({
            })
        end,
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
