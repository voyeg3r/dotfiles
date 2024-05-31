" This functions are meant to reverse strings, words and lines

" Reverse lines - it accepts ranges Example →  :.,.+5Reverse
command! -bar -range=% Reverse <line1>,<line2>global/^/m<line1>-1
command! ReverseLine call setline('.', join(reverse(split(getline('.')))))
command! -bar -range Mirror <line1>,<line2>call setline('.', join(reverse(split(getline('.'), '\zs')), ''))
vnoremap <Leader>r c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>
fun! RevertSelectedString()
    try
        let l:old_plus = getreg('+')
        normal gv"+y
        let @+=join(reverse(split(string(@+), '.\zs')), '')
        let @+=substitute(@+, "'", "", "g")
        normal gv"+p
    finally
        call setreg('+', l:old_plus)
    endtry
endfun
vnoremap <Leader>r :<C-u>call RevertSelectedString()<CR>

function! ReverseSelectedWords()
    try
        let l:old_plus = getreg('+')
        normal gv"+y
        let @+ = join(reverse(split(getreg('+'))))
        normal gv"+p
    finally
        call setreg('+', l:old_plus)
    endtry
endfunction
vnoremap <Leader>w :<C-u>call ReverseSelectedWords()<CR>
