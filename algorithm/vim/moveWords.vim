" file: moveWords.vim
" Created: set 19 2018 17:53
" Last Change: set 19 2018 19:26
" This is an attempt to make a function to move
" words and possible blocks of selection left and right
" NOTE: move blocks and accept count
"
" if you want to repeat more thant once
" you can call the funtion once and then try
" 5@: for example
"
" Move the word using replace mode

" This function moves      word
function! MoveWordRight()
    call feedkeys("viwygvr lR\<c-r>0\<esc>")
endfunction

" function with count
function! MoveWordRight(count)
    let var = a:count
    while var > 0
        call feedkeys("viwygvr lR\<c-r>0\<esc>")
        let var -= 1
    endwhile
endfunction

" This function moves words to the left
function! MoveWordLeft(count)
    let var = a:count
    while var > 0
        call feedkeys("viwygvr hR\<c-r>0\<esc>")
        let var -= 1
    endwhile
endfunction
