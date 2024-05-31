" Vimscript remove control characters
" + https://stackoverflow.com/a/52522075/2571881
function Repaste(s, ...)
  for i in a:000
    let sub = substitute(getreg('"'), a:s, i, 'ge')
    let sane = substitute(sub, '[^[:print:]]', '\n', 'ge')
    "call append(line('.'), sane)
    put =sane
  endfor
endfunction

command -nargs=* RP call Repaste(<f-args>)
