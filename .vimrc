"Default vim settings
set number
set relativenumber
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
if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Add plugins
call plug#begin('~/.vim/plugged')
   Plug 'scrooloose/nerdtree'
   Plug 'rust-lang/rust.vim'
   Plug 'tpope/vim-fugitive'
   Plug 'kien/ctrlp.vim'
call plug#end()

"Set up NerdTree hotkey
nmap <F1> :NERDTreeToggle<CR>

"Add rust auto format support
let g:rustfmt_autosave = 1 
