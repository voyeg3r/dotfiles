" ============================================================================
" File:        nextCS.vim
" Description: vim color theme selector
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" ============================================================================

" Init {{{1
if exists("loaded_nextCS") || exists('loaded_setcolors')
    finish
endif
let loaded_nextCS = 1

let s:save_cpo = &cpo
set cpo&vim

" Default configuration {{{1
if !exists('g:nextcs_dir') | let g:nextcs_dir= 'colors/' | endif
if !exists('g:nextcs_map') | let g:nextcs_map= '<F12>' | endif
if !exists('g:previouscs_map') | let g:previouscs_map= '<F11>' | endif

" Commands & Mappings {{{1
command! NextCS     call nextCS#Next()
command! PreviousCS call nextCS#Previous()

if !hasmapto('<Plug>NextCS')
    exe "map <unique> " . g:nextcs_map . " <Plug>NextCS"
endif

if !hasmapto('<Plug>PreviousCS')
    exe "map <unique> " . g:previouscs_map . " <Plug>PreviousCS"
endif

nnoremap <unique> <script> <Plug>NextCS     :NextCS<CR>
nnoremap <unique> <script> <Plug>PreviousCS :PreviousCS<CR>

let &cpo = s:save_cpo
