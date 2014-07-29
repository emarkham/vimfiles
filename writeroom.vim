"set lines=30
set columns=90
set transparency=0
set guicursor+=n:blinkwait0
"set anti guifont=Glass_TTY_VT220:h20
set anti guifont=Ubuntu_Mono:h18
set guioptions-=r
highlight Normal  guifg=#00de00   guibg=Black
set fuoptions=background:#00000000
set fu

" hide ~'s
hi NonText guifg=bg

" wrap words
set wrap
set tw=76
set formatoptions=1
set lbr

" make k and j navigate display lines
map k gk
map j gj
:map <D-F3> :source ~/.gvimrc<cr>
