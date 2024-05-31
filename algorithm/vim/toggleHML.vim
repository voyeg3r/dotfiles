" Emacs like Ctrl-l - jumpt to Middle, Bottom and Top of the window
" Reference: http://vim.1045645.n5.nabble.com/Vim-General-f1139531.html
function! ToggleHML()
    set scrolloff=0
    let l:last_win_line = ( line('$') <= winheight('%') ? line('$')  : winheight('%')  )
        normal M
    if winline() < l:last_win_line / 2
    elseif winline() < l:last_win_line
        normal L
    else
        normal H
    endif
endfunction
nnoremap <C-l> :call ToggleHML()<CR>
