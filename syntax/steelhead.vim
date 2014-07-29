" Vim syntax file
" Language: Steelhead configuration file
" Author: Eric Markham
"

set nowrap


function! ConfigFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^##') >= 0
    return ">1"
  endif
  return "1"
endfunction
setlocal foldmethod=expr
setlocal foldexpr=ConfigFolds()

"if exists("b:current_syntax")
"  finish
"endif

" Keywords


"'lan|wan|inpath|aux|primary|prihw|rios_wan|rios_lan\priwan|prilan|lo'
")\(\d\{1}_\d\{1}\)\?[^-_]'

syn match   Internal  'internal set'
syn keyword IsFalse false
syn keyword IsTrue  true
syn keyword Interface contained inpath lan wan
syn match   License   'LK\d-.*[0-Z]'
syn region  Value    start='"' end='"'
syn match   Negated  '^no '
syn match   Commented  '^##.*$' fold 


let b:current_syntax = "steelhead"


hi def link License        Constant
hi def link Interface      Underlined
hi def link Value          Constant
hi def link Commented      Statement
hi def link Negated        Constant

%foldopen!
