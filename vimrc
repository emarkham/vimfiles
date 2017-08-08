if has("mouse")
  set mouse=a
endif

colorscheme default
set background=dark
set ruler
set showmode
set showcmd
set wrap
set linebreak
set nolist  
set textwidth=0
set wrapmargin=0
"set scrolloff=50
" i hate sidescrolling with the mouse
"set sidescrolloff=200

set noerrorbells visualbell t_vb=
if has ('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif


" Put plugins and other crap in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" " Keep undo history across sessions by storing it in a file
 if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undo')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif
set undofile
set laststatus=2
set statusline=\ %t\ [%{&ff}%m%r%w]\ Pos=%v\ Line=%l/%L
set hlsearch
"highlight StatusLine  ctermfg=White   ctermbg=53      cterm=NONE

highlight ModeMsg       ctermfg=NONE    ctermbg=NONE    cterm=NONE
"highlight ModeMsg       ctermfg=White   ctermbg=Red     cterm=NONE
highlight LineNr        ctermfg=magenta ctermbg=NONE    cterm=NONE
highlight Pmenu         ctermfg=black   ctermbg=grey    cterm=NONE
highlight PmenuSel      ctermfg=White   ctermbg=blue    cterm=NONE
highlight FoldColumn    ctermfg=white   ctermbg=black   cterm=NONE
highlight Folded        ctermfg=cyan    ctermbg=NONE    cterm=NONE
highlight CursorLine    ctermfg=NONE    ctermbg=236     cterm=NONE
highlight CursorLineNr  ctermfg=Yellow  ctermbg=234     cterm=NONE
highlight Cursor        ctermfg=Black   ctermbg=red     cterm=NONE


highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Don't break words in middle
set linebreak
" Show incomplete paragraphs even when they don't fit on screen (avoid @'s)
set display+=lastline
set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=2         " more powerful backspacing
set foldcolumn=1
set cursorline
"set insertmode
" I *want* to use colorcolumn here but it keeps popping up in dumb
" places. And I don't want to fix a lot of ftplugin & syntax files
"set colorcolumn=85
set colorcolumn=

" Indentation. Do it my way.
set shiftwidth=2                " 2 spaces for shifting
set expandtab
set tabstop=2                   " Tabs are 2 spaces wide.
set smarttab
set autoindent
set showmatch
set ignorecase
set smartcase
set matchpairs+=<:>                 " match < > with the % command, too


" saves when focus is lost. I have no idea if this works
"au FocusLost * :wa

let mapleader = ","


" these two lines open or close a fold if the cursor is on a fold and you
" press space. otherwise, do the normal thing and move to the next character
" set foldenable
" set foldmethod=syntax
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

" supposedly, this should fix Vim's fucked-up searching thing:
nnoremap / /\v
vnoremap / /\v


" Executes the current buffer as a python script. Use carefully!
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<CR>


" toggles Gundo (http://sjl.bitbucket.org/gundo.vim/)
"
cnoremap <F5> :GundoToggle<CR>
inoremap <F5> :GundoToggle<CR>
nnoremap <F5> :GundoToggle<CR>

let g:gundo_right=1
let g:gundo_preview_bottom=1


" Emacs-style keys on the command-line
:cnoremap <C-A>		<Home>
:cnoremap <C-B>		<Left>
:cnoremap <C-D>		<Del>
:cnoremap <C-E>		<End>
:cnoremap <C-F>		<Right>
:cnoremap <C-N>		<Down>
:cnoremap <C-P>		<Up>
:cnoremap <Esc><C-B>	<S-Left>
:cnoremap <Esc><C-F>	<S-Right>
:cnoremap <C-F>         <Right>
:cnoremap <C-N>         <Down>
:cnoremap <C-P>         <Up>
:cnoremap <Esc><C-B>    <S-Left>
:cnoremap <Esc><C-F>    <S-Right>
:cnoremap <A-Right>     <Right>

" Emacs-style cursor movement
:map  <C-a>             <Home>
:map! <C-a>             <Home>
:map  <C-b>             <S-Left>
:map! <C-b>             <S-Left>
:map  <C-f>             <S-Right>
:map! <C-f>             <S-Right>
:map  <C-e>             <End>
:map! <C-e>             <End>


:map b              <C-b>
:map f              <C-f>

cmap b              <C-b>
cmap f              <C-f>

call pathogen#infect()
call pathogen#helptags()

let g:airline_powerline_fonts=0
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

"for some reason, csv-vim needs 'filetype plugin on' set to avoid a dumb error
:filetype plugin on
syntax on
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" don't want python3 right now
let g:ycm_python_binary_path = 'python'

let g:slime_target = "tmux"

" fixes commenting in nerdcommenter for python
let NERDSpaceDelims=1
"
" @ches vim: NERDDefaultAlign support fi

let NERDDefaultAlign="start"



"The question's been answered already, but here's what I'd more likely end up doing:
"
"Record a macro:
"qq to record a macro into register "q"
"$ to go to the end of the line
"daw to delete a word
"q to stop recording
"
"Then select the rest of the lines:
"j to go down a line
"vG to select to the end of the file
"
"And apply the macro:
":norm @q
"
"Some similar alternatives:
"
":%norm $daw
"
"qq$dawjq (note the added j) then 999@q to replay the macro many times. (Macro execution stops at the first "error" -- in this case, you'd probably hit the bottom of the file, j would not work, and the macro would stop.)
