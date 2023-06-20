require("general")

vim.cmd [[
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'sonph/onehalf', { 'rtp' : 'vim' }
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'vim-test/vim-test'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rust-lang/rust.vim'
Plug 'shaunsingh/nord.nvim'
Plug 'github/copilot.vim'
Plug 'MunifTanjim/nui.nvim'
Plug 'jackMort/ChatGPT.nvim'
Plug 'tpope/vim-repeat'
Plug 'ggandor/leap.nvim'
Plug 'elkowar/yuck.vim'
call plug#end()
]]

vim.g.nord_disable_background = true
vim.g.nord_borders = true
require('nord').set();

-- nvim-tree
local nvim_tree = require("nvim-tree")
nvim_tree.setup()

-- Treesitter
local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
    ensure_installed = { "c_sharp", "lua", "rust", "c", "javascript" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    rainbow = {
        enable = true
    }
})

-- Telescope
local telescope = require('telescope')
telescope.setup({
    defaults = {
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
    },
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

-- nvim-cmp
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

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true
})


require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,

    ["omnisharp"] = function ()
        require("lspconfig")["omnisharp"].setup {
            on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end
        }
    end,

    ["lua_ls"] = function ()
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

-- Lua Line
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'nord',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})

-- ChatGPT.nvim
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


-- leap.nvim
require("leap").add_default_mappings()
