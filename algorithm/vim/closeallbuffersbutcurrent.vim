function! CloseAllBuffersButCurrent()
    let curr = bufnr("%")
    let last = bufnr("$")
    if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
    if curr < last | silent! execute (curr+1).",".last."bd" | endif
    echom "All other buffers unloaded!"
endfunction
"nnoremap <silent> <Leader>c :call CloseAllBuffersButCurrent()<CR>
nnoremap <Leader>c :call CloseAllBuffersButCurrent()<CR>
command! -nargs=0 CloseBuffers :call CloseAllBuffersButCurrent()
command! -nargs=0 BO :call CloseAllBuffersButCurrent()
