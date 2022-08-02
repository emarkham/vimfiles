"gvim config
"set lines=50
"set columns=132
set textwidth=0
set nu "turn on numbering because I'm finding it useful
set nofullscreen
"set formatoptions=tcrqn
set selectmode=mouse,key
set mouse=a
let g:wheel#line#threshold = 25 
set nomousehide
" set mousefocus    " I want to love this, but i can't find a way to have
" mousefocus delay
"set guicursor-=n:blinkwait0
set guicursor+=n:blinkwait750-blinkon800-blinkoff500
hi clear
if exists("syntax_on")
  syntax reset
endif

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<CR>


"colorscheme default

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Comment				guifg=#a0b0d0               gui=NONE
highlight Cursor				guifg=black		guibg=Red			gui=NONE
highlight CursorLine    guifg=NONE    guibg=#292948 gui=NONE
highlight CursorLineNr  guifg=Yellow  guibg=#111122 gui=NONE
highlight FoldColumn    guibg=gray14  guifg=white
highlight Folded        guifg=#d0d8d0 guibg=#283038 gui=NONE
highlight LineNr        guifg=grey40  guibg=#292948 gui=NONE
highlight ModeMsg				guifg=white		guibg=red			gui=NONE
"highlight Normal				guifg=#f5deb3	guibg=Black
"highlight Normal				guifg=#f5deb3	guibg=#242424
"highlight Normal				guifg=#f5deb3	guibg=#1D1F21
highlight Normal				guifg=#d8deb3	guibg=#101018
highlight Search				guifg=blue		guibg=#80a0ff gui=NONE
highlight Special				guifg=Orange
highlight Statement			guifg=Yellow								gui=NONE
highlight StatusLine		guifg=white   guibg=#127212 gui=NONE
highlight StatusLineNC	guifg=grey60	guibg=#243224	gui=NONE
highlight Type				                              gui=NONE
highlight Visual				guifg=white		guibg=#2255bb
highlight VertSplit     guibg=bg      guifg=bg

"highlight Pmenu         guifg=Black   guibg=grey    gui=NONE
"highlight PmenuSel      guifg=wheat   guibg=#1111cc gui=NONE

au InsertEnter * hi CursorLine guifg=NONE    guibg=#0a0a0d
au InsertLeave * hi CursorLine guifg=NONE    guibg=#292948 gui=NONE

set guioptions=egmt
set guioptions-=L

set cursorline
set transparency=0
"set noanti guifont=Anonymous:h12
"set noanti guifont=Consolas:h12
"set anti guifont=Droid_Sans_Mono_for_Powerline:h11
set anti guifont=Source_Code_Pro:h16
"set noanti guifont=ProggyCleanTT:h17
set linespace=-2
"set anti guifont=PT_Mono:h12
"set guifont=Inconsolata:h14
"set noanti guifont=Fixed:h13
"set noanti guifont=MiscFixedSC613:h13
"set noanti guifont=Envy_Code_R:h13
"set noanti guifont=TerminalVector:h12
"set noanti guifont=Crisp:h16
"set noanti guifont=ProggySquare:h18

"set noanti guifont=Bitstream_Vera_Sans_Mono:h13

":map <D-F3> :source ~/.vim/writeroom.vim<cr>

"autocmd VimEnter * NERDTree
set termwinsize=5*0
autocmd VimEnter * below terminal ++kill=terminal
autocmd VimEnter * wincmd p

let g:airline_theme='cool'
