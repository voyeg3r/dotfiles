fun! AddLineNumber()
    %s/^/\=printf('%02d ', line('.'))
endfun
