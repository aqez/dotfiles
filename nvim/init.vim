" General
filetype plugin on
filetype indent on
set autoread
let mapleader = " "
set clipboard=unnamedplus
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
"colorscheme gruvbox
"let g:airline_theme = 'gruvbox'
"set background=dark
hi! Normal guibg=NONE ctermbg=NONE

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
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'dracula/vim', { 'as' : 'dracula' }
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'puremourning/vimspector'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'w0rp/ale'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'sonph/onehalf', { 'rtp' : 'vim' }
    Plug 'ojroques/nvim-lspfuzzy'
call plug#end()

colorscheme onehalfdark
let g:airline_theme = 'onehalfdark'
set background=light


" Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <leader>vr :VimspectorReset<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files'
nmap <Leader><Tab> <Plug>(fzf-maps-n)
nmap <Leader>p :Files<CR>

" NerdTree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1


" LSP
lua << EOF
 local nvim_lsp = require('lspconfig')

 local on_attach = function(client, bufferNumber)
    require('completion').on_attach(client)
 end

 local pid = vim.fn.getpid()
 local omnisharp_bin = "/home/aqez/omnisharp/run"
 nvim_lsp.omnisharp.setup({ cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) }, on_attach = on_attach })
 nvim_lsp.rust_analyzer.setup({ on_attach = on_attach })
 nvim_lsp.clangd.setup({ on_attach = on_attach })
 nvim_lsp.tsserver.setup({ on_attach = on_attach })
 nvim_lsp.cssls.setup({ on_attach = on_attach })
 nvim_lsp.html.setup({ on_attach = on_attach })

 require('lspfuzzy').setup{}
EOF

nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <Leader>fi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>fu <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader><space> <cmd>lua vim.lsp.buf.code_action()<CR>
vnoremap <leader><space> :lua vim.lsp.buf.range_code_action()<CR>
nnoremap <F2> <cmd>lua vim.lsp.buf.rename()<CR>
