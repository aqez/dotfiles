" General
filetype plugin on
filetype indent on
set autoread
let mapleader = " "
set clipboard=unnamedplus

" UI
syntax on
set ruler
set backspace=eol,start,indent
set ignorecase
set smartcase
set incsearch
set lazyredraw
set nohlsearch
set magic
set showmatch
set foldcolumn=1
set number
set relativenumber
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set previewheight=10
set laststatus=2
set scrolloff=10
set signcolumn=yes

"Files, backups and undo
set nobackup
set nowb
set noswapfile
set hidden
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Text/Indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set nowrap


" Quick fix
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" Vim Plug
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
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
    "Plug '~/repos/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'aqez/vim-test'
    Plug 'vlime/vlime', { 'rtp' : 'vim/' }
    Plug 'p00f/nvim-ts-rainbow'
call plug#end()

colorscheme onehalfdark
let g:airline_theme = 'onehalfdark'
set background=dark
hi! Normal guibg=NONE ctermbg=NONE
hi! LineNr guibg=NONE ctermbg=NONE


" Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <leader>vr :VimspectorReset<CR>

" Telescope
let $FZF_DEFAULT_COMMAND = 'rg --files'
nmap <Leader>p :Telescope find_files<CR>

" NerdTree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true
  }
}
EOF


" LSP
lua << EOF
 require('telescope').setup {
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
         }
     }
 }
 require('telescope').load_extension('fzy_native')
 local has_words_before = function()
   local cursor = vim.api.nvim_win_get_cursor(0)
   return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ''):sub(cursor[2], cursor[2]):match('%s') 
 end

 local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
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

  local lsp_installer = require("nvim-lsp-installer")

  lsp_installer.on_server_ready(function(server)
     local opts = {}

     server:setup(opts)
  end)
EOF

nnoremap gd :Telescope lsp_definitions<CR>
nnoremap <Leader>fi :Telescope lsp_implementations<CR>
nnoremap <Leader>fu :Telescope lsp_references<CR>
nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader><space> :Telescope lsp_code_actions<CR>
vnoremap <leader><space> :Telescope lsp_range_code_actions<CR>
nnoremap <F2> <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <leader>bs :Telescope buffers<CR>
nnoremap <leader>gs :Telescope git_status<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gc :Telescope git_commits<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

nnoremap <leader>gr :Telescope live_grep<CR>


nnoremap <leader>rt :TestNearest<CR>
