"Default vim settings
set number
set tabstop=3
set shiftwidth=3
set expandtab
set clipboard^=unnamed,unnamedplus

"Disable arrow keys in Normal and insert modes
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

"Set up vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Add plugins
call plug#begin('~/.config/nvim/plugs')
   Plug 'scrooloose/nerdtree'
   Plug 'rust-lang/rust.vim'
   Plug 'tpope/vim-fugitive'
   Plug 'kien/ctrlp.vim'
   Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
   Plug 'Shougo/deoplete.nvim'
   Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
call plug#end()

"Set up deoplete to automatically start
let g:deoplete#enable_at_startup = 1

"Remove the preview scratch window
set completeopt-=preview

"F2 for go to definition
nnoremap <F2> <C-]>
nnoremap <BACKSPACE> <C-t>

" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"Set up NerdTree hotkey
nmap <F1> :NERDTreeToggle<CR>

"Add rust auto format support
let g:rustfmt_autosave = 1 
