" Delete line above without moving the cursor
" https://vi.stackexchange.com/a/8368/7339
function! DeleteLineAbove()
    if line('.') == 1
        echom "You are at the first line!"
        return
    endif
    let l:colsave = col(".")
    exec  "normal! kdd"
    call cursor(line("."), l:colsave)
endfunction
nnoremap <Leader>k :call DeleteLineAbove()<CR>
