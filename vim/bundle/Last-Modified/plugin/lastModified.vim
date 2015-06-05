" File Name:   lastModified.vim
"
" Author: 	   Sudipta Ghorui <sudipta05@gmail.com>
"
" Credits: 	   Srinath Avadhanula <srinath@fastmail.fm>
"			   Justin Randall <Randall311@yahoo.com>
"			   for the original script and concept, and			
"			   Neeraj Prasad <neeraj@alumnux.com>
"			   Bikram Chatterjee <bikram@alumnux.com>
"			   who suggested me not to delete any comment (if exists) after
"			   the time stamp and inspired me to do further modifications
"			   			
" Last Modified: Fri May 04 04:30 PM 2007
"
" Description: sets the last modification time of the current file.
"              the modification time is truncated to the last hour.  and the
"              next time the time stamp is changed, it is checked against the
"              time already stamped. this ensures that the time-stamp is
"              changed only once every hour, ensuring that the undo buffer is
"              not screwed around with every time we save.
"              To force the time stamp to be not updated, use the command:
"              		:NOMOD
"              To change it back, use
"              		:MOD
"
" Things To Remember:  a> Change the variable 's:timeStampLeader' to the string
" 						 which you use in your code (by default which is 'Last
" 						 Modified')
" 					   b> Change the variable 'timeStampFormat'. Put an example
" 					     of the time format you want.
" 					   c> Change the variable 'timeStampString'. Change it to
" 					     get the proper time stamp. Read the comments in the
" 					     code to change the variable.


" Initialise the variables: {{{1
if !exists('g:timeStampLeader')
	let s:timeStampLeader = 'Last Modified'
else
	let s:timeStampLeader = g:timeStampLeader
endif

" Main Function: {{{1
function! UpdateWithLastMod()
	if exists('b:nomod') && b:nomod
		return
	end
	let pos = line('.').' | normal! '.virtcol('.').'|'
	0
	let searchPos = search(s:timeStampLeader)
	if searchPos <= 20 && searchPos > 0 && &modifiable

        let totalLine = getline('.')
        let lastdate  = matchstr(totalLine, s:timeStampLeader.'.*:\zs.*')
        let timePos   = match(totalLine, lastdate)
        let crFirst   = strpart(totalLine, 0, timePos)

		" The format of the time stamp  {{{1
		" please change the two variables according to the format you want
		"
		" syntax - format  - example
		" %a	 - Day	   - Sat
		" %Y     - YYYY    - 2005
		" %b	 - Mon	   - Sep (3 digit month)
		" %m	 - mm	   - 09 (2 digit month)
		" %d	 - dd	   - 10
		" %H	 - HH	   - 15 (hour upto 24)
		" %I	 - HH	   - 12 (hour upto 12)
		" %M	 - MM	   - 50 (minute)
		" %X	 - HH:MM:SS-12:29:34)
		" %p	 - AM/PM
		"
		let timeStampFormat = "19 Dec 2005"
		let timeStampString = "%d %b %Y"

		let timeStampFormatLength = strlen(timeStampFormat)

		let newdate  = strftime(timeStampString)
		let prefix   = ""
		let spaceLength = 0

		" Determines the space or tab before the time stamp {{{1
		while 1
			if match(lastdate, " ") == 0
				let lastdate= strpart(lastdate, 1)
				let prefix = prefix.' '
			elseif match(lastdate, '	') == 0
				let lastdate = strpart(lastdate, 1)
				let prefix = prefix.'	'
			else
				break
			end
		endwhile

		let spaceIndex = 0

		" Checks whether the time format is same or not {{{1
		while spaceIndex <= timeStampFormatLength
			let spaceIndex1 = match(lastdate, " ", spaceIndex)
			let spaceIndex2 = match(timeStampFormat, " ", spaceIndex)
			if spaceIndex1 == -1
				let spaceIndex1 = strlen(lastdate)
			end
			if spaceIndex2 == -1
				let spaceIndex2 = strlen(timeStampFormat)
			end

			if spaceIndex1 != spaceIndex2
				echohl WarningMsg | echo "The time format is different" | echoh None
				exe pos
				return
			else
				let spaceIndex = spaceIndex1 + 1
			end
		endwhile

		let newdate = newdate.strpart(lastdate, spaceIndex - 1)
		if lastdate == newdate
			exe pos
			return
		end

		"let newdate = prefix.newdate
		exe 's/'.lastdate.'/'.newdate.'/e'
		call s:RemoveLastHistoryItem()
	else
		exe pos
		return
	end

	exe pos
endfunction

" Call the function: {{{1
augroup LastChange
	au!
	au BufWritePre * :call UpdateWithLastMod()
augroup END

" Remove history: {{{1
function! <SID>RemoveLastHistoryItem()
  call histdel("/", -1)
  let @/ = histget("/", -1)
endfunction


" Modify the commands: {{{1
com! -nargs=0 NOMOD :let b:nomod = 1
com! -nargs=0 MOD   :let b:nomod = 0

" vim:ts=4:sw=4:noet fdm=marker
