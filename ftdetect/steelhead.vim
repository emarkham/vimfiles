au BufRead,BufNewFile active-running*.txt set filetype=steelhead
" autocmd FileType steelhead let &l:commentstring='##\ %s'
let g:NERDCustomDelimiters = { 'steelhead': { 'left': '##'} }
