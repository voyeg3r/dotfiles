
" -*- vim -*-
" vim:sts=2:sw=2:ff=unix:
" FILE: "/home/benji/.vim/plugin/foo.vim"
" URL:  http://www.vim.org/script.php?script_id=72
" LAST MODIFICATION: "November 30, 2005"
" (C) 2000-2005 by Benji Fisher, <benji@member.AMS.org>

" This file contains relatively short functions and a few commands and
" mappings for vim.  Many of these were written in response to questions
" posted on the vim mailing list.  As a result (if I do say so myself)
" there are a lot of clever ideas in this file.
"
" The examples are organized chronologically, which means that the ones near
" the beginning are not necessarily the best ones to start with.  I hope the
" following table of contents will help.  If you see something that looks
" interesting, position the cursor on the function name and use the * command.
" (Most of my examples involve functions; some also involve maps, commands,
    " autocommands, etc.)

    " Some of this file was written for vim 5.x, so several things could be
    " simplified with new features of vim 6.0, such as :map <local> and
    " :map <silent>.

    " *** Table of Contents ***

    " Configuration:  normally closer to the top of the file, but right after the
    " ToC in this file.

    " fun! DoSp(str)
    "   Purpose:  interpret special characters, such as <C-U>, in a string.
    "   Techniques:  argument syntax, substitute() function
    " fun! EvalInput(string)
    "   Purpose:  Same as DoSp()
    "   Techniques:  scratch buffer, :normal with control characters, @"
    " fun! HTMLmatch()
    "   Purpose:  Find matching HTML tags (baby version of matchit.vim)
    "   Techniques:  :if ... :endif, character under the cursor
    " fun! ClassHeader(leader)
    "   Purpose:  Insert a fancy comment line whenever a C++ class is started.
    "   Techniques:  :autocmd, :imap, :normal with control characters
    " command! -nargs=* Line
    " command! -nargs=* Range
    "   Purpose:  Use one or two variables to give a line or range to a command.
    "   Techniques:  :command, <q-args>, substitute(), :execute
    " fun! Mark(...)
    " fun! Line(mark)
    " fun! Virtcol(mark)
    "   Purpose:  Use (local) variables to store marks, restore cursor and screen.
    "   Techniques:  variable number of arguments, parsing with =~, substitute()
    " fun! Pippo(...) range
    "   Purpose:  Append words matching a given pattern to a file.
    "   Techniques:  :function with a range, variable number of arguments, :copy
    " fun! LastNonBlank()
    "   Purpose:  Move the cursor to the last non-blank on the line; ^ in reverse.
    "   Techniques:  matchend(), positioning the cursor with :normal
    " fun! StripTag(pattern)
    "   Purpose:  Tag search on "foo" if the current word is "xxxfoo".
    "   Techniques:  expand(), <cword>, =~, :normal with control characters
    " fun! JS_template()
    "   Purpose:  Insert a JavaScript template at the magic string "<scr"
    "   Techniques:  :autocmd, mode switching, :append
    " fun! LineUpLT()
    "   Purpose:  Automatically align C++ << operators.
    "   Techniques:  :autocmd, mode switching, manually adjusting indent
    " fun! Count(pat)
    "   Purpose:  Count the number of lines matching the input pattern.
    "   Techniques:  :g, returning a value, :execute
    " fun! ShowHi()
    "   Purpose:  Show the colors of all highlight groups.
    "	Oops, we reinvented the wheel!  See $VIMRUNTIME/syntax/hitest.vim .
    "   Techniques:  saving and restoring an option, scratch buffer, :redir, etc.
    " fun! EditFun(name)
    "   Purpose:  Edit a vim function in a scratch buffer.
    "   Techniques:  pretty much the same as ShowHi()
    " fun! GetModelines(pat, ...)
    "   Purpose:  Get information stored in comments (modelines) in the buffer.
    "   Techniques:  variable number of arguments, :silent (vim 6.0), complex :g
    " fun! VarTab(c, ...)
    "   Purpose:  Define tab stops at arbitrarily spaced columns.
    "   Techniques:  getting the value of a function without leaving Insert mode,
    "     looping over variable number of arguments
    " fun! SmartBS(pat)
    "   Purpose:  Delete HTML constructs like "&foo;" as a single character.
    "   Techniques:  Insert-mode mapping that works at start, middle, end of line
    " fun! Transform(old, new, ...)
    "   Purpose:  Perform multiple simple substitutions.
    "   Techniques:  :while loop, getline() and setline()
    " fun! Search(pat)
    "   Purpose:  Search for a pattern and select it in Select mode.
    "   Techniques:  :command, :execute, mode switching
    " fun! Capitalize()
    "   Purpose:  Make "_" act like a Caps Lock key in Insert mode.
    "   Techniques:  store a flag as a buffer variable, mode switching
    " inoremap <LeftMouse>
    "   Purpose:  Keep mode (Insert or Normal) attached to a window.
    "   Techniques:  window variables, Command mode inside a mapping
    " command! Echo
    "   Purpose:  Echo a command, then execute it.  Useful for making a log of
    "   your Command-mode session.
    " command! Iabbr
    "   Purpose:  Define an Insert-mode abbreviation that "eats" the space that
    "   triggers it.
    " fun! Getchar()
    "   Purpose:  like getchar() but always return a String.  Used by
    "   Eatchar() and GetMotion().
    "   Techniques:  getchar(), nr2char()
    " fun! Eatchar(pat)
    "   Purpose:  This is a helper function for :Iabbr .
    " fun! Yank()
    "   Purpose:  Example for using GetMotion() to remap an operator.
    " fun! GetMotion(char)
    "   Purpose:  Capture a sequence of characters that define a motion.  This is
    "   useful when redefining operators, such as y (yank).
    "   Techniques:  getchar(), while
    " fun! Common(str1, str2)
    "   Purpose:  Return the common initial part of two strings.
    "   Techniques:  matchend(), strpart(), while
    " fun! TWIN()
    "   Purpose:  Prompt for input, and insert something in the file.
    "   Techniques:  input(), append(), :normal, switching modes.
    " vmap i"   and also i', a", and a'
    "   Purpose:  implement some new text objects.
    "   Techniques:  search offsets and some useful Visual-mode commands.
    " fun! SetPersistentString(name, value)
    " fun! SetPersistentNumber(name, value)
    "   Purpose:  Save script variables in the file, to make them persistent.
    "   Techniques:  expand(), <sfile>, search(), setline(), getline()
    " fun! GCD(a, b)
    "   Techniques:  An example of a recursive algorithm.
    " function! RepeatString(count, ...)
    "   Purpose:  Repeat the optional argument to get a string of length a:count .
    " function! InvertString(str)
    "   Courtesy of Preben "Peppe" Guldberg
    "   Techniques:  It can be used with :s/.../\= .
    " function! MyMarks(action)
    "   Purpose:  Store and read marks in a special file.
    "   Techniques:  getline(), setline(), search(), ...
    " function! s:SID()
    " function! FooSID()
    "   Purpose:  implement a hack to expose the script ID.

    " *** User Configuration ***

    " Normally, a file that (like this one) contains only a few configuration
    " items suggests that the user set them (if (s)he wants to change the
    " defaults) in the vimrc file.  The method illustrated here is appropriate for
    " complicated plugins or packages with a large number of user options.  Note
    " that the use of :runtime! allows for the usual vim rules for overriding
    " options, so the system administrator can set system defaults (overriding the
    " plugin defaults) and the user can override those with an after/ directory.
    " See :help ftplugin-overrule for details.
    "
    " This vim plugin does many amazing and wondrous things, but you may prefer to
    " change some of the defaults.  Copy the following section to a file foo.vimrc
    " in your plugin directory, normally the same directory as this file.  If your
    " system administrator has installed this file, you should install foo.vimrc
    " in your after/plugin/ directory so that your choices override the system
    " defaults.  See
    "   :help ftplugin-overrule
    "   :help 'runtimepath'
    " for details.
    " ==================== file foo.vimrc ====================
    " User Configuration file for foo.vim .
    let g:foo_DefineAutoCommands = 0  " default 0, do not define autocommands.
    let g:foo_DefineCommands = 1  " default 1, define ex commands.
    let g:foo_DefineAllMaps = 0  " default 0, do not define all maps.
    " The following defaults will only be used if g:foo_DefineAllMaps is set.
    " For another way to let the user specify key bindings, see
    "   :help write-plugin
    let g:fooLNBchar = ''	" key mapping for LastNonBlank(), default '<M-4>'.
    let g:fooStripTagChar = ''  " key for StripTag(), default '<C-]>'.
    let g:fooVarTabChar = ''	" key for VarTab(), default '<Tab>'
    let g:fooMapUnderscore = 0  " default 0, do not map _ .
    let g:fooMapMouse = 0  " default 0, do not map <LeftMouse> and <RightMouse> .
    let g:fooTWINChar = ''	" key for TWIN(), default '<F4>' .
    let g:fooTextObjects = 1  " default 1, define new text objects.
    " ==================== end: foo.vimrc ====================

    " source the user configuration file(s):
    runtime! plugin/<sfile>:t:r.vimrc

    " *** End of User Configuration ***

    " Since I experiment a lot with this file, I want to avoid having
    " duplicate autocommands.
    augroup Foo
    autocmd!
    augroup END

    " This is the beginning of a function for taking an input string and
    " returning the value after "special characters" have been evaluated:
    " <C-U> erases all previous input.  One might also want to implement
    " <C-W> and others.
fun! DoSp(str)
    let s = substitute(a:str, '.*\<C-U>', "", "")
    return s
    endfun

    " This function evaluates the input string in Input mode.  Special
    " characters, such as <C-U> and <C-N> will be executed in Input mode.
    " Raw <Esc> characters will produce unpredictable results.
fun! EvalInput(string)
    new
    execute "normal a" . a:string . "\<Esc>ggyG"
    q!
    return @"
    endfun

    " Use with  :nmap % :call HTMLmatch()
    " If the cursor is on a non-alphabetic character then invoke the normal
    " behavior of %.  If the cursor is on an alphabetic character, attempt to
    " jump from <tag> to </tag> and back.  This is just a quick demo; it does
    " not deal with nesting.  For a more complete version, see matchit.vim .
fun! HTMLmatch()
    if getline(".")[col(".")-1] !~ "\\a"
    normal! %
    return
    endif
    execute "normal ?\\A\<CR>"
    normal lye
    if getline(".")[col(".")-2] == '/'
    execute 'normal ?<\s*' . @" . "\<CR>l"
    else
    execute 'normal /<\s*\/' . @" . "\<CR>ll"
    endif
    endfun

    " Insert a header every time you begin a new class in C++ .
    if g:foo_DefineAutoCommands
    augroup Foo
    autocmd BufEnter *.cpp,*.h inoremap { {<Esc>:call ClassHeader("-")<CR>a
        autocmd BufLeave *.cpp,*.h iunmap {
            " Keep your braces balanced!}}}
            augroup END
    endif " g:foo_DefineAutoCommands
fun! ClassHeader(leader)
    if getline(".") !~ "^\\s*class"
    return
    endif
    normal yyP$x
    let width = 80
    if exists("&tw")
    let width = &tw
    endif
    execute "normal " . (width-virtcol(".")-3) . "I" . a:leader . "\<Esc>"
    execute "normal a \<Esc>"
    execute "normal I//\<Esc>"
    " Keep your braces balanced!{
    execute "normal! jo};\<Esc>"
    normal k$
    endfun

    " This is my first user-defined command.  Unlike a user-defined function,
    " a command can be called from the function Foo() and have access to the
    " local variables of Foo().
    " Usage:  :let foo = 1 | Line foo s/foo/bar
    " Usage:  :let foo = 1 | let bar = 3 | Line foo,bar s/foo/bar
    " You can also do ":Line foo+1 s/foo/bar" or "Line foo-1,bar+1 ..."
    " There must be no spaces in "foo,bar".
    command! -nargs=* Line
    \ | let Line_range = matchstr(<q-args>, '\S\+')
    \ | let Line_range = "(" . substitute(Line_range, ",", ").','.(", "") . ")"
    \ | execute "let Line_range = " . Line_range
    \ | execute Line_range . substitute(<q-args>, '\S\+', "", "")
    \ | unlet Line_range
    " Example:  If foo=2 and bar=3 and you do ":Line foo-1,bar+1 s/foo/bar" then
    " 1. Line_range = "foo-1,bar+1"
    " 2. Line_range = "(foo-1).','.(bar+1)"
    " If there is no comma then this step has no effect.
    " 3. Line_range = "1,4"
    " 4. 1,4 s/foo/bar

    " Usage:  :let foo = 1 | let bar = 3 | Range foo bar s/foo/bar
    command! -nargs=* Range
    \ | execute substitute(<q-args>, '\(\S\+\)\s\+\(\S\+\)\(.*\)',
            \ 'let Range_range=\1.",".\2', "")
    \ | execute Range_range . substitute(<q-args>, '\S\+\s\+\S\+', "", "")
    \ | unlet Range_range

    " Usage:  :let ma = Mark() ... execute ma
    " has the same effect as  :normal ma ... :normal 'a
    " without affecting global marks.
    " You can also use Mark(17) to refer to the start of line 17 and Mark(17,34)
    " to refer to the 34'th (screen) column of the line 17.  The functions
    " Line() and Virtcol() extract the line or (screen) column from a "mark"
    " constructed from Mark() and default to line() and virtcol() if they do not
    " recognize the pattern.
    " Update:  :execute Mark() now restores screen position as well as the cursor.
fun! Mark(...)
    if a:0 == 0
    let mark = line(".") . "G" . virtcol(".") . "|"
    normal! H
    let mark = "normal!" . line(".") . "Gzt" . mark
    execute mark
    return mark
    elseif a:0 == 1
    return "normal!" . a:1 . "G1|"
    else
    return "normal!" . a:1 . "G" . a:2 . "|"
    endif
    endfun

    " See comments above Mark()
fun! Line(mark)
    if a:mark =~ '\dG\d\+|$'
    return substitute(a:mark, '.\{-}\(\d\+\)G\d\+|$', '\1', "")
    else
return line(a:mark)
    endif
    endfun

    " See comments above Mark()
fun! Virtcol(mark)
    if a:mark =~ '\d\+G\d\+|$'
    return substitute(a:mark, '.*G\(\d\+\)|$', '\1', "")
    else
return col(a:mark)
    endif
    endfun

    " Usage:  If the file contains lines like
    " let pippo1 = pippo12
    " I like pippo2
    " then :%call Pippo()<CR> will append lines
    " pippo1
    " pippo12
    " pippo2
    " to the end of the file.
    " I do not know what the original requester had in mind, but this could be
    " useful for generating dictionaries.  For example, for LaTeX, try
    " :%call Pippo('\\\a\+') and then sort the resulting lines.
    fun! Pippo(...) range
    if a:0
    let pat = a:1
    else
    let pat = '\<pippo\d\+\>'
    endif
    let bot = line("$")
    execute a:firstline . "," . a:lastline . 'g/' . pat . '/copy $'
    if bot == line("$")
    return
    endif
    execute (bot+1) . ',$s/' . pat . '/&\r/ge'
    execute (bot+1) . ',$v/' . pat . '/d'
    execute (bot+1) . ',$s/.\{-}\(' . pat . '\)$/\1/e'
    endfun

    " <S-4> or $ takes you to the last character of the line; this takes you
    " to the last non-blank character of the line.
if strlen(g:fooLNBchar)
    execute "map" g:fooLNBchar "<Plug>fooLNB"
    elseif g:foo_DefineAllMaps && !hasmapto('<Plug>fooLNB')
    map <M-4> <Plug>fooLNB
    endif
    map <Plug>fooLNB 0/.*\S/e<CR>:let @/=histget("/", -2)<CR>
    " Here is another way to do it.  I use a function for legibility and for the
    " sake of a local variable.
    map <Plug>fooLNB :call LastNonBlank()<CR>
fun! LastNonBlank()
    let i = matchend(getline("."), '.*\S')-1
    if i > 0
    execute "normal!0" . i . "l"
    elseif i == 0
    execute normal! 0
    endif
    endfun

    " Strip off a pattern from a keyword and jump to the tag.
if strlen(g:fooStripTagChar)
    execute "map" g:fooStripTagChar "<Plug>fooStripTag"
    elseif g:foo_DefineAllMaps && !hasmapto('<Plug>fooStripTag')
    map <C-]> <Plug>fooStripTag
    endif
    nmap <Plug>fooStripTag :call StripTag("xxx")<CR>
fun! StripTag(pattern)
    let keyword = expand("<cword>")
    if keyword =~ '^' . a:pattern
    execute "tag!" . substitute(keyword, a:pattern, "", "")
    else
    execute "normal! \<C-]>"
    endif
    endfun

    " These autocommands and function insert a template every time you
    " type "<scr" at the end of a line in a *.jsp file.
    if g:foo_DefineAutoCommands
    augroup Foo
    autocmd BufEnter *.jsp imap r r<Esc>:call JS_template()<CR>a
    autocmd BufLeave *.jsp iunmap r
    augroup END
    endif " g:foo_DefineAutoCommands
fun! JS_template()
    if getline(".") !~ '<scr$'
    return
    endif
    s/scr$/script language="JavaScript">/
    append
    function foo() {
        alert("Hello, world.");
    }
</script>

.
endfun

"The following autocommand and function align C++ style << characters.
if g:foo_DefineAutoCommands
augroup Foo
autocmd BufEnter *.cpp imap < <<C-O>:call LineUpLT()<CR>
autocmd BufLeave *.cpp iunmap <
augroup END
    endif " g:foo_DefineAutoCommands
fun! LineUpLT()
    if line(".") == 1 || getline(".") !~ '^\s*<<$'
    return
    endif
    let newline = getline(line(".")-1)
    let col = match(newline, "<<")
    if col != -1
let newline = strpart(newline, 0, col)
    let newline = substitute(newline, '\S', " ", "g") . "<<"
    call setline(line("."), newline)
    normal!$
    endif
    endfun

fun! Count(pat)
    let num = 0
    execute 'g/' . a:pat . '/let num = num + 1'
    return num
    endfun

    " A joint effort with Douglas Potts.
    " Show the colors of all highlight groups.
    " Oops, we reinvented the wheel!  See $VIMRUNTIME/hitest.vim .
fun! ShowHi()
    " Save the value of 'more'
    let save_more = &more
    " Spare me the "more" prompts!
    set nomore
    " Redirect output of :hi to register a
    redir @a
    hi
    redir END
    let &more = save_more
    new
    " Put it in a temp buffer
    put a
    " Remove any line that does not match '\h' (head-of-word character)
    v/\h/d
    " Do some processing to add 'syn keyword' syntax
    %s/.\{-}\(\h\w*\).*/syn keyword \1 \1/
    " Yank the buffer into register a and execute it.
    %y a
    @a
    endfun

    if g:foo_DefineCommands
command! -nargs=1 -complete=function EditFun call EditFun(<q-args>)
    endif
fun! EditFun(name)
    " Redirect output of :function to register a
    redir @a
    silent execute "function" a:name
    redir END
    " Put it in a temp buffer
    execute "sp" tempname() . ".vim"
    silent put a
    " Go to the function declaration and add a "!".
    0/function
    s//&!/
    " Remove the numbers from the listing.
    silent .,/^\s*endfunction/s/\d\+//
    " Fix the indentation.
    /^\s*endfunction/
    execute "normal! =?^\\s*function\<CR>"
    " set ft=vim
    endfun

    " Get information from user-defined modelines.  If the file contains
    " /* foo:  bar */
    " on line 17 then GetModelines('/\* foo:') returns the String "17:".
    " If the pattern contains a \(group\) then the matching text is
    " returned:  GetModelines('/\* foo:  \(.*\) \*/') returns "17:bar".
    " A more robust input pattern would be '/\*\s*foo:\s*\(.\{-}\)\s*\*/'.
    " If no match is found, the function returns "0:".  Vim will also
    " report that no match was found; this may trigger a hit-return prompt.
    " At least, it does not count as an error.
    "
    " By default, the whole file is searched, and the LAST match counts.
    " You can restrict the range as follows:
    "   GetModelines(pat, 100)	searches the first 100 lines;
    "   GetModelines(pat, -100)	searches the last 100 lines;
    "   GetModelines(pat, 10,100)	searches lines 10 to 100.
    " In all cases, the script checks for a valid range, so that you do
    " not have to.
fun! GetModelines(pat, ...)
    " Long but simple:  set start line and finish line.
    let EOF = line("$")
    if a:0 >1
    let start = a:1
    let finish = a:2
    elseif a:0 == 1
    if a:1 > 0
    let start = 1
    let finish = a:1
    else
    let start = EOF + a:1 + 1
    let finish = EOF
    endif
    endif
    if !exists("start") || start < 1
    let start = 1
    endif
    if !exists("finish") || finish > EOF
    let finish = EOF
    endif
    " Now for the fun part!  Remember that any command can be used after
    " :g/pat/ although :s is the most common.  Since I am using "/" to
    " delimit the :g command, I have to escape them in a:pat.
    let n = 0
    " The :silent command requires vim 6.0.
    silent execute start .",". finish
    \ 'g/' . escape(a:pat, "/") . "/let n=line('.')"
    " Now, some substitute() magic:  I enclose the pattern in a \(group\),
    " in case it contains branches, and add .\{-} and .* at the beginning
    " and end, so it matches the whole line.  Since \(pat\) is the first
    " group, \2 refers to the user's first group, if any.
    if n
    execute "normal!\<C-O>"
    return substitute(getline(n), '.\{-}\(' . a:pat . '\).*', n.':\2', '')
    else
    echo
    return "0:"
    endif
    endfun

    " Make tab stops at columns 8, 17, 26, and 35.
if strlen(g:fooVarTabChar)
    execute "imap" g:fooVarTabChar "<Plug>fooVarTab"
    elseif g:foo_DefineAllMaps && !hasmapto('<Plug>fooVarTab')
    imap <Tab> <Plug>fooVarTab
    endif
    imap <Plug>fooVarTab <C-R>=VarTab(virtcol("."),8,17,26,35)<CR>
fun! VarTab(c, ...)
    " Find the first tab stop after the current column.
    let i = 1
    while i <= a:0
    execute "let num_sp = -a:c + a:" . i
    if num_sp > 0
    break
    endif
    let i = i+1
    endwhile
    if i > a:0  " We are already past the last tab stop.
    return ""
    endif
    " This may be overkill, but I want an efficient way to generate a string
    " with the right number of spaces.
    let spaces = " "
    let len = 1
    while len < num_sp
    let spaces = spaces . spaces
    let len = len + len
    endwhile
return strpart(spaces, 0, num_sp)
    endfun

    " For HTML files, map <BS> to delete "&foo;" as one character.
    " To avoid complications (start of line, end of line, etc.) the
    " mapping inserts a character, the function deletes all but two
    " characters, and the mapping deletes the last two.
    if g:foo_DefineAutoCommands
    augroup Foo
    autocmd BufEnter *.html,*.htm
    \ inoremap <BS> x<Esc>:call SmartBS('&[^ \t;]*;')<CR>a<BS><BS>
    autocmd BufLeave *.html,*.htm iunmap <BS>
    augroup END
    endif " g:foo_DefineAutoCommands
fun! SmartBS(pat)
    let init = strpart(getline("."), 0, col(".")-1)
    let len = strlen(matchstr(init, a:pat . "$")) - 1
    if len > 0
    execute "normal!" . len . "X"
    endif
    endfun

    " If you have the line
    "	foobar
    " and call :Transform abc xyz
    " then the "a" and "b" in "foobar" are translated into "x" and "y", to give
    "	fooyxr
    " If the Transform() function is given the optional third argument, a string,
    " then it returns the transformed string instead of operating on the current
    " line.  Both can be given a range of lines, following the usual rules.
    if g:foo_DefineCommands
command! -nargs=* -range Transform <line1>,<line2> call Transform(<f-args>)
    endif
fun! Transform(old, new, ...)
    if a:0
    let string = a:1
    else
    let string = getline(".")
    endif
    let i = 0
while i < strlen(a:old) && i < strlen(a:new)
    execute "let string=substitute(string,'".a:old[i]."','".a:new[i]."','g')"
    let i = i+1
    endwhile
    if a:0
    return string
    else
    call setline(".", string)
    endif
    endfun

    " :Search foo
    " will find the next occurrence of "foo" and select it in Select mode.
    " It does not work well if the match is a single character.
    if g:foo_DefineCommands
command! -nargs=1 Search call Search(<f-args>)
    endif
fun! Search(pat)
    execute "normal! /" . a:pat . "\<CR>"
    execute "normal! v//e+1\<CR>\<C-G>"
    endfun

    " Change _foo_ into FOO on the fly, in Insert mode.
    " This version only works within one line.
    " It will not get confused if you switch bufffers before the second "_".
    if g:fooMapUnderscore || g:foo_DefineAllMaps
    :imap _ _<Esc>:call Capitalize()<CR>s
    endif
fun! Capitalize()
    if exists("b:Capitalize_flag")
    unlet b:Capitalize_flag
    normal! vF_Ux,
    else
    let b:Capitalize_flag = 1
    execute "normal! a_\<Esc>"
    endif
    endfun

    " If you switch between windows with the mouse, and want each window to
    " remember whether it was in Insert or Normal mode, try this:
    if g:fooMapMouse || g:foo_DefineAllMaps
    inoremap <LeftMouse> <Esc>:let w:lastmode="Insert"<CR><LeftMouse>
    \ :if exists("w:lastmode")&&w:lastmode=="Insert"<Bar>
    \ startinsert<Bar>endif<CR>
    nnoremap <LeftMouse> :let w:lastmode="Normal"<CR><LeftMouse>
    \ :if exists("w:lastmode")&&w:lastmode=="Insert"<Bar>
    \ startinsert<Bar>endif<CR>
    endif

    " Echo a command and then execute it.  This is useful for making a record
    " of your vim session (the Command-line portion) with
    " :redir > vimlog.txt .
    if g:foo_DefineCommands
    command! -nargs=* Echo echo ":".<q-args> <bar> <args>
    endif

    " Use getchar() to eat up the space that triggers an abbreviation.  (This
    " requires vim 6.x .)  If you want to type "foo " and get "foo()" with the
    " cursor between the parentheses, use the following command and enter
    " :Iab <silent> foo foo()<Left>

    if g:foo_DefineCommands
    command! -nargs=+ Iabbr execute "iabbr" <q-args> . "<C-R>=Eatchar('\\s')<CR>"
    endif

    " The built-in getchar() function returns a Number for an 8-bit character, and
    " a String for any other character.  This version always returns a String.
    fun! Getchar()
let c = getchar()
    if c != 0
let c = nr2char(c)
    endif
    return c
    endfun

    fun! Eatchar(pat)
let c = Getchar()
    return (c =~ a:pat) ? '' : c
    endfun

    " If you want to remap an operator, use GetMotion() to supply the motion that
    " follows the operator.  For example,
    "
    " nmap <silent> y :call Yank()<CR>
    "
    " will redefine y (yank) in Normal mode, so that the cursor does not move.
    " (By default, the cursor moves to the start of the selection.)
    " This version of GetMotion() is usable, but not complete.
    " One disadvantage is that the command is not shown as you type, even if you
    " have the 'showcmd' option set.
    " TODO:  How can we capture an optional register?

    fun! Yank()
let startpos = Mark()
    execute "norm! y" . GetMotion("y")
    execute startpos
    endfun

    " Get a sequence of characters that describe a motion.
fun! GetMotion(char)
    let motion = ""
let c = Getchar()
    " In some contexts, such as "yy", a particular character counts as a motion.
    if c == a:char
    return c
    endif
    " Capture any sequence of digits (a count) and mode modifiers.
    " :help o_v
    while c =~ "[vV[:digit:]\<C-V>]"
    let motion = motion . c
let c = Getchar()
    endwhile
    " Most motions are a single character, but some two-character motions start
    " with 'g'.  For example,
    " :help gj
    if c == "g"
    let motion = motion . c
let c = Getchar()
    endif
    " Text objects start with 'a' or 'i'.  :help text-objects
    " Jump to a mark with "'" or "`".  :help 'a
    if c =~ "[ai'`]"
    let motion = motion . c
let c = Getchar()
    endif
    return motion . c
    endfun

    " Return the common initial part of two strings.
    " Just change the return statement for a Strcmp() function.
fun! Common(str1, str2)
    let n = 0
    " Thanks to Peppe Guldberg, who noticed that we get an infinite loop if we
    " omit this test.  If  n  is too big then a:str1[n] is the empty string...
    while n < strlen(a:str1) && a:str1[n] == a:str2[n]
    let n = n+1
    endwhile
    " return char2nr(a:str1[n]) - char2nr(a:str2[n])  " for Strcmp()
return strpart(a:str1, 0, n)
    endfun

if strlen(g:fooTWINChar)
    execute "map" g:fooTWINChar "<Plug>fooTWIN"
    elseif g:foo_DefineAllMaps && !hasmapto('<Plug>fooTWIN')
    map <F4> <Plug>fooTWIN
    endif
    inoremap <Plug>fooTWIN <C-O>:call TWIN()<CR>
fun! TWIN()
    let str = "I hear that the weather is nice in "
    let str = str . input("Where do you want to go today?  ")
    let str = str . " this time of year."
    call append(".", str)
    +normal! gqq$
    endfun

    " Some mappings to implement new text objects; only Visual mode is possible,
    " as far as I can tell.
    " TODO:  Save and restore the search history.
    if g:fooTextObjects || g:foo_DefineAllMaps
    vmap i" ?"<CR>/.<CR>o/"<CR>?.<CR><Esc>:noh<CR>gv
    vmap i' ?'<CR>/.<CR>o/'<CR>?.<CR><Esc>:noh<CR>gv
    vmap a" ?"<CR>o/"<CR><Esc>:noh<CR>gv
    vmap a' ?'<CR>o/'<CR><Esc>:noh<CR>gv
    endif

    " Use the current file to store persistent variables.  Return 1 if not found.
    " See example after the functions have been defined.
    " TODO:  Restore the search register.
fun! SetPersistentNumber(name, value)
    " Search, from end of file, for "let name = ..."
    $
    if !search('^\s*let\s\+s:' . a:name . '\s*=', 'bW')
    return 1
    endif
    execute 's/=.*/=' a:value
    endfun
fun! SetPersistentString(name, value)
    " Search, from end of file, for "let name = ..."
    $
    if !search('^\s*let\s\+s:' . a:name . '\s*=', 'bW')
    return 1
    endif
    let newline = matchstr(getline("."), '.\{-}=\s*')
    " If a:value = "a'b\c" then we want :let name = 'a' . "'" . 'b\c'
    let newline = newline."'" . substitute(a:value, "'", "'.\"'\".'", "g") . "'"
    call setline(".", newline)
    endfun
    " Example:  the full path of this file and the number of times it has been
    " sourced.
    let s:fooFile = expand("<sfile>:p")
    let s:fullPath = '/home/benji/.vim/plugin/foo.vim'
    let s:sourceCount = 0
    if filewritable(s:fooFile)
let s:filePosition = Mark()
    call SetPersistentString("fullPath", s:fooFile)
    call SetPersistentNumber("sourceCount", s:sourceCount+1)
    update
    execute s:filePosition
    endif
    command! FooCount echo "FooCount =" s:sourceCount

    " An example of a recursive algorithm.  GCD(4,6) should return 2.
    " Do not feed in negative numbers.
fun! GCD(a, b)
    if a:a == 0
    return a:b
    else
return GCD(a:b%a:a, a:a)
    endif
    endfun

    " A silly exercise in efficientcy.  Instead of building it up one copy at a
    " time, double the string repeatedly and then truncate.
    " Usage:  :echo RepeatString(68, '1 + ') . '0 = 17'
function! RepeatString(count, ...)
    " Initialize str to a:1, default to "-" .
    let str = (a:0 ? a:1 : "-")
let len = strlen(str)
    while len < a:count
    let str = str . str
    let len = len + len
    endwhile
return strpart(str, 0, a:count)
    endfunction

function! InvertString(str)
    " Courtesy of Preben "Peppe" Guldberg
    " This will invert/reverse a string
    " This will work on arbitrary length strings, too. The /.*/ should be
    " quick, which might make it up for using a regex rather than using
    " numerous commands in a :while loop.
    "
    " This can be used in a substitute command as follows:
    " :%s/AUTHORIZATION/\=InvertString(submatch(0))
    let inverted = substitute(a:str, '.\(.*\)\@=',
            \ '\=a:str[strlen(submatch(1))]', 'g')
    return inverted
    endfunction

    " This function stores and reads marks in a special file, in the format
    "   File:/home/benji/.vim/plugin/foo.vim
    "   Mark:normal!890Gzt898G5|
    " To read a mark, it finds the appropriate "File:" line, extracts everything
    " after the "Mark:" in the next line, and :execute's it.  The "Mark:" line
    " uses the same format as the Mark() function in this file.
    " Usage:
    "   :call MyMarks("write")
    "   :call MyMarks("read")
    "   :call MyMarks("delete")
    " To use this automatically with all *.txt files in path/ , you can use
    " autocommands such as
    " augroup MyMarks
    "   au! BufReadPost path/*.txt call MyMarks("read")
    "   au! BufWritePre path/*.txt call MyMarks("write")
    " augroup END
    " Limitations:  There is no error checking, so if the marks file is corrupted,
    " you will get strange errors.  Beware of Trojan-horse marks files!
    " The function uses a :split and :quit, so it may mess up your window layout.
function! MyMarks(action)
    " Get the full path to the current file and a mark for the current position.
    let file = expand("%:p")
let mark = Mark()
    " Go to the marks file and look for an entry for the file.
    split $HOME/MyMarks.txt
    " Using '\V' at the start of the pattern, the only special character in the
    " file name that might cause trouble is '\', so escape it.
    let markline = search('\V\^File:' . escape(file, '\') . '\$', 'w')
    if a:action ==? "read" && markline
    " Extract the mark, quit the marks file, and execute.
let mark = getline(markline + 1)
    let mark = substitute(mark, 'Mark:', '', '')
    quit
    execute mark
    elseif a:action ==? "write"
    " Add an entry, or modify the existing one, for this file.
    if markline
    call setline(markline + 1, 'Mark:' . mark)
    else
    " Since setline("$+1",...) does not work, add a blank line at EOF.
    $put=''
    call setline("$", 'File:' . file)
    $put=''
    call setline("$", 'Mark:' . mark)
    endif
    write
    quit
    elseif a:action ==? "delete" && markline
    " Remove both the "File:" line and the "Mark:" line.
    .,+delete
    write
    quit
    endif
    endfunction

    " The following two functions implement a hack to expose the script ID.
    " Usage:  :echo {FooSID()}Fun() if s:Fun() is defined in this file.
function! s:SID()
    let fullname = expand("<sfile>")
    " this looks like "function FooSID..<SNR>38_SID" if called from FooSID().
    return matchstr(fullname, '<SNR>\d\+_')
    endfunction
    function! FooSID()
return s:SID()
    endfunction
