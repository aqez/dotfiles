" General
filetype plugin on
filetype indent on
set autoread
let mapleader = " "
set clipboard=unnamedplus
set runtimepath^=~/notes

" UI
syntax on
set background=dark
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
set completeopt=longest,menuone,preview
set previewheight=10
set laststatus=2
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
            \ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

"Files, backups and undo
set nobackup
set nowb
set noswapfile
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
    Plug 'w0rp/ale'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'dracula/vim', { 'as' : 'dracula' }
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'puremourning/vimspector'
call plug#end()
colorscheme gruvbox

" Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" ALE
let g:ale_linters = { 'cs' : ['OmniSharp'] }
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" FZF
nmap <Leader><Tab> <Plug>(fzf-maps-n)
nmap <Leader>p :Files<CR>

" NerdTree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['bin', 'obj']
let g:NERDTreeQuitOnOpen = 1


" OmniSharp
let g:OmniSharp_timeout = 5
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp\\', 'obj\\', '\.nuget\\' ]
"let g:OmniSharp_selector_ui = ''
let g:OmniSharp_fzf_options = { 'down': '10' }

augroup csharp_commands
    autocmd!
    autocmd FileType cs nmap <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <buffer> <Leader><Space> <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <buffer> <Leader><Space> <Plug>(omnisharp_code_actions)
    autocmd FileType cs nmap <buffer> <F2> :call <Plug>(omnisharp_rename)
    autocmd FileType cs nmap <buffer> <Leader>cf <Plug>(omnisharp_code_format)
    autocmd FileType cs nmap <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <buffer> <Leader>dc <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <buffer> <Leader>cc <Plug>(omnisharp_global_code_check)
    autocmd FileType cs nmap <buffer> <Leader>rt <Plug>(omnisharp_run_test)
    autocmd FileType cs nmap <buffer> <Leader>rT <Plug>(omnisharp_run_tests_in_file)
    autocmd FileType cs nmap <buffer> <Leader>ss <Plug>(omnisharp_start_server)
    autocmd FileType cs nmap <buffer> <Leader>sp <Plug>(omnisharp_stop_server)
    autocmd FileType cs nmap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs imap <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd BufWritePre *.cs :OmniSharpCodeFormat

    " vim-better-whitespace
    autocmd FileType cs let g:strip_whitespace_on_save = 1
    autocmd FileType cs let g:strip_whitespace_confirm = 0
augroup END
