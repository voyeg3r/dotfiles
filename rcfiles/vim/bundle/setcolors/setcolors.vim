" colorswitch.vim - Switch between installed Vim color schemes
" Author:       Rahul Janak
" Version:      0.1 (updated 21/01/2012)
" Usage:
"       F8 Switches to next Color Scheme
"       Shift-F8 Switches to previous one
"       Alt-F8 Switches to a random one
"

if v:version < 700 || exists('loaded_schemes')
    finish
endif

if !exists('g:colors_name')
    colorscheme default
endif

let loaded_schemes = 1
let s:paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let g:mycolors = map(s:paths, 'fnamemodify(v:val, ":t:r")')

function! SwitchColorRandom()
    execute "let random_number = system('rand -M " . len(g:mycolors) . "')"
    execute 'colorscheme ' g:mycolors[random_number]
    redraw
    execute 'colorscheme'
endfunction

function! SwitchColorForward()
    let s:idx = index(g:mycolors, g:colors_name)
    if s:idx < len(g:mycolors)
        execute 'colorscheme ' g:mycolors[s:idx + 1]
        redraw
        execute 'colorscheme'
    endif
endfunction

function! SwitchColorBackward()
    let s:idx = index(g:mycolors, g:colors_name)
    if s:idx >= 1
        execute 'colorscheme ' g:mycolors[s:idx -1]
        redraw
        execute 'colorscheme'
    endif
endfunction

nnoremap <F8> :call SwitchColorForward()<CR>
nnoremap <S-F8> :call SwitchColorBackward()<CR>
nnoremap <A-F8> :call SwitchColorRandom()<CR>
