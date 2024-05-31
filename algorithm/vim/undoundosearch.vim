" Last Change: ago 29 2018 08:58
" This functions clears the last search from history
fun! UndoUndoSearch()
    call histdel("search", -1)
    let @/ = histget("search", -1)
endfun

