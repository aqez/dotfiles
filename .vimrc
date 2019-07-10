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

let g:netrw_banner = 0 "Hide file browser header
let g:netrw_liststyle = 3 "File tree mode
let g:netrw_browse_split = 4 "Open in previous window
let g:netrw_winsize = 25
let g:netrw_altv = 1 

augroup ProjectDrawer
   autocmd!
   autocmd VimEnter * :Lexplore
augroup END
