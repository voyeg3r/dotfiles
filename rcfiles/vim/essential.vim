" New voyeg3r's ~/.vimrc file
" vim:foldmethod=marker:foldlevel=0
" Created: 2016-12-29 15:25:15
" Last Change: qui 29 dez 2016 15:57:43 BRT

" if you want to load vim without plugins but
" with nocompatible mode try this
"
" vim -u NONE -N
"
" sources:
" https://dougblack.io/words/a-good-vimrc.html
" https://pragprog.com/book/dnvim2/practical-vim-second-edition

set nocompatible
set rnu nu          " show number and relative number at once
set showcmd         " show command in bottom bar
set hidden

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
filetype indent on  " load filetype-specific indent files
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set smartcase       " if search has uppercase enable case search
set hlsearch        " highlight matches
let mapleader=","   " leader is comma
set modelines=1
set fileformats=unix,dos,mac
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ "}}}

" highlight last inserted text
nnoremap gV `[v`]

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" zsh like completion
set wildmenu        " visual autocomplete for command menu
set wildmode=full


filetype plugin indent on

" bettern than syntax on, use syntax enable
" http://stackoverflow.com/questions/33380451/
if !exists("g:syntax_on")
    syntax enable
endif

if has("autocmd")
    autocmd FileType python,html,xml,txt ts=2 sts=2 sw=2 expandtab
endif


