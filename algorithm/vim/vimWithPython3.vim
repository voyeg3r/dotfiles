" USING PYTHON TO WRIT VIM FUNCTIONS
"       Created: set 20 2018 07:12
"   Last Change: set 20 2018 12:02
"
"   References:
"   + http://vimdoc.sourceforge.net/htmldoc/if_pyth.html
"
"   vim.current.line). You can also get down to the current cursor position
"   with vim.current.window.cursor.
"
"   print the content of the current line
"   py3 print(vim.current.line)

function! Test()
    py3 import vim
    py3 print('Hello world')
endfunction

python3 <<EOL
print("This is just a test")
EOL

" print uppercase string
py3 print('uma linha em maiúsculo'.upper())
py3 print(vim.current.line.upper())
py3 print(vim.current.buffer[0])
