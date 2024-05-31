" This function requires you select the numbers
" source: https://vi.stackexchange.com/a/4699/7339
fun! SumVis() abort
    try
        let l:a_save = @a
        norm! gv"ay
        let @a = substitute(@a,'[^0-9. ]','+','g')
        exec "norm! '>o"
        exec "norm! iTotal: \<c-r>=\<c-r>a\<cr>"
     finally
        let @a = l:a_save
     endtry
endfun
vnoremap <C-s> :<C-u>call SumVis()<CR>
