" this function gets last 20 cmds to new buffer
fun! s:RedirHistoryCommands()
    redir @r
    history : -20,
    redir End
    new | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    0put! r
    "set nopaste
    "silent %s/^\s\+//g
    "silent g/^$/d
endfun

command! -nargs=0 GetHistory call s:RedirHistoryCommands()
command! -nargs=1 H execute histget("cmd", 0+<args>)
command! -nargs=1 Hg let @h = histget("cmd", 0+<args>)
