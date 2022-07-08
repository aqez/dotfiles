require("general")

vim.cmd [[
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ntpeters/vim-better-whitespace'
Plug 'puremourning/vimspector'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'sonph/onehalf', { 'rtp' : 'vim' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'aqez/vim-test'
Plug 'vlime/vlime', { 'rtp' : 'vim/' }
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-telescope/telescope-ui-select.nvim'
call plug#end()
]]

vim.cmd "colorscheme onehalfdark"
vim.g.airline_theme = "onehalfdark"
vim.opt.background = "dark"

vim.cmd "hi! Normal guibg=NONE ctermbg=NONE"
vim.cmd "hi! LineNr guibg=NONE ctermbg=NONE"

-- nvim-tree
local nvim_tree = require("nvim-tree")
nvim_tree.setup()

-- Vimspector
vim.g.vimspector_enable_mappings = "VISUAL_STUDIO"

-- Treesitter
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

-- Telescope
local telescope = require('telescope')
telescope.setup({
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        mappings = {
            i = {
                ["<C-k>"] = require('telescope.actions').move_selection_previous,
                ["<C-j>"] = require('telescope.actions').move_selection_next,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        },
        ["ui-select"] = { }
    }
})
telescope.load_extension('fzy_native')
telescope.load_extension('ui-select')

-- nvim-cmp
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
cmp.setup({
    confirmation = { completeopt = 'menuone,noinsert,noselect' },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end),
        ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end)
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" }
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- LSP
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
end)
