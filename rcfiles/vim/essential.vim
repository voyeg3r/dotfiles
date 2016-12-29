" New voyeg3r's ~/.vimrc file
" Created: 2016-12-29 15:25:15
" Last Change: qui 29 dez 2016 15:32:19 BRT

" if you want to load vim without plugins but
" with nocompatible mode try this
"
" vim -u NONE -N
"
" sources:
" https://dougblack.io/words/a-good-vimrc.html
" https://pragprog.com/book/dnvim2/practical-vim-second-edition

set nocompatible
set rnu nu
set hidden

filetype plugin indent on

" bettern than syntax on, use syntax enable
" http://stackoverflow.com/questions/33380451/
if !exists("g:syntax_on")
    syntax enable
endif

if has("autocmd")
    autocmd FileType python,html,xml,txt ts=2 sts=2 sw=2 expandtab
endif


