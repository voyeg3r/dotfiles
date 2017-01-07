" Python import management
" Vim plugin
"
" Version: 0.2
" Licence: VIM licence
"
" Copyright (c) 2012, Phillip Berndt
"
" Maps a function to <C-f> in insert mode which automatically adds import
" statements if needed. Simply position the cursor over a module name and the
" import will be added. If there is no word under the cursor the user will be
" asked to enter a module name.
"
" This script also exports a function called g:PythonAddImport
" which adds an arbitrary line (should start with import or from) at the
" imports section at the top of the file.
"
" If you want automatic imports for common modules, define
"  let g:PythonAutoAddImports = 1
" to your vimrc.
"
" Ideas for improvement:
"  * Somehow handle from .. import .. statements
"  * Recognize strings at the top of the file and insert
"    imports below. Currently, only hash'ed comments are
"    recognized to cope with the shebang and encoding comment
"

if !exists("g:PythonAddImportDefined")
let g:PythonAddImportDefined = 1

function g:PythonAddImport(import)
	let l:oldpos = getpos(".")

	" First check if this already gets imported
	call cursor(1, 1)
	if search("\\m^[ \t]*" . a:import . "[ \t]*$", "cn") != 0
		call setpos(".", l:oldpos)
		return
	end

	" Locate the first import line
	call cursor(1, 1)
	let l:firstImport = search("\\m^[ \t]*\\(from\\|import\\)[ \t]", "cn")
	if l:firstImport == 0
		" Search for the first non-comment line and use that one
		call cursor(1, 1)
		let l:firstImport = 1
		while 1
			let l:firstImport += 1
			let l:found = search("\\m^[ \t]*#", "", line("$"))
			if l:found == 0 || l:found > l:firstImport
				break
			end
		endwhile
	end
	if line("$") < l:firstImport
		let l:firstImport = line("$")
	end

	" Insert the new import
	call cursor(l:firstImport, 1)
	exe "normal I\<CR>\<ESC>"
	let l:oldpos[1] += 1
	call setline(l:firstImport, a:import)

	" Resort the imports
	call cursor(l:firstImport, 1)
	let l:lastImport = l:firstImport
	while 1
		let l:found = search("\\m^[ \t]*\\(from\\|import\\)[ \t]", "", line("$"))
		if l:found == 0 || l:found > l:lastImport + 1
			break
		end
		let l:lastImport += 1
	endwhile
	exe "normal :" . l:firstImport . "," . l:lastImport . "sort\<CR>"

	" Position the cursor where it was before
	let l:oldpos[2] += 1
	call setpos(".", l:oldpos)

	" Return an empty string to allow to use this in snippets
	return ""
endfunction

function <SID>PythonInsert()
	let l:import = substitute(expand("<cWORD>"), "\\m\\.[^\\.]*$", "", "")
	let l:import = substitute(l:import, "\\m^.*[(]", "", "")
	let l:import = substitute(l:import, "\\m\\W\\+$", "", "")
	if match(l:import, "[^A-Za-z0-9_.-]") != -1
		let l:import = ""
	end
	if l:import == ""
		let l:import = input("Module to import: ")
		if l:import == ""
			return
		endif
	end
	call g:PythonAddImport("import " . l:import)
endfunction

" Register normal insert hook
imap <C-f> <C-O>:call <SID>PythonInsert()<CR>

if exists("g:PythonAutoAddImports") && g:PythonAutoAddImports == 1
	" Get a list of available Python modules
python <<END
import sys
import os
import vim
vim.command("let s:PythonModules = " + 
	repr([ y[:-3] for x in filter(os.path.isdir, sys.path) for y in os.listdir(x) if y[-3:] == ".py" ] +
		[ "sys", "gtk" ]
	))
END

	" Hook for dynamic imports
	function <SID>DynamicPythonInsert()
		let l:import = substitute(expand("<cWORD>"), "\\m\\.[^\\.]*$", "", "")
		let l:import = substitute(l:import, "\\m^.*[(]", "", "")
		let l:import = substitute(l:import, "\\m\\W\\+$", "", "")
		if l:import == ""
			return
		endif
		if index(s:PythonModules, l:import) == -1
			return
		end
		call g:PythonAddImport("import " . l:import)
	endfunction
	imap . <C-V>.<C-O>:call <SID>DynamicPythonInsert()<CR>
end

endif
