set number
set relativenumber
set tabstop=3
set shiftwidth=3
set expandtab

"Disable arrow keys in Normal and insert modes
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
   Plug 'scrooloose/nerdtree'
call plug#end()

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

nmap <F1> :NERDTreeToggle<CR>
