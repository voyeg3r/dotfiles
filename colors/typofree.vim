" Vim color file
" Name:           typofree.vim
" Maintainer:     Michiel Roos <vim@typofree.org>
" Created:        ma 06 okt 2008 07:29:31 pm CEST
" Last Modified:  Mon 16 May 2011 03:46:05 pm CEST CEST CEST CET
" License:        This file is placed in the public domain.
" Version:        0.1 alpha
"
" This is a 256 color theme for xterm-256color

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "typofree"

hi Normal        ctermfg=247   ctermbg=NONE  cterm=NONE
hi SpecialKey    ctermfg=127   ctermbg=NONE  cterm=NONE " ^M
hi NonText       ctermfg=236   ctermbg=NONE  cterm=NONE " e.g. the + symbol on line wrap
hi PreProc       ctermfg=67    ctermbg=NONE  cterm=NONE
hi Directory     ctermfg=67    ctermbg=NONE  cterm=NONE
hi LineNr        ctermfg=238   ctermbg=NONE  cterm=NONE

hi Cursor        ctermfg=130   ctermbg=NONE  cterm=NONE
hi CursorLine    ctermfg=NONE  ctermbg=NONE  cterm=underline
hi CursorColumn  ctermfg=NONE  ctermbg=234   cterm=NONE

hi DiffAdd       ctermfg=NONE  ctermbg=22    cterm=NONE
hi DiffDelete    ctermfg=NONE  ctermbg=52    cterm=NONE
hi DiffChange    ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi DiffText      ctermfg=NONE  ctermbg=17    cterm=underline

hi ModeMsg       ctermfg=65    ctermbg=NONE  cterm=NONE
hi MoreMsg       ctermfg=65    ctermbg=NONE  cterm=NONE
hi Question      ctermfg=65    ctermbg=NONE  cterm=NONE

hi Pmenu         ctermfg=16    ctermbg=23    cterm=NONE
hi PmenuSel      ctermfg=65    ctermbg=23    cterm=NONE
hi PmenuSbar     ctermfg=16    ctermbg=23    cterm=NONE
hi PmenuThumb    ctermfg=65    ctermbg=23    cterm=NONE

hi IncSearch     ctermfg=209   ctermbg=88    cterm=NONE
hi Search        ctermfg=209   ctermbg=88    cterm=NONE
hi Visual        ctermfg=231   ctermbg=60    cterm=NONE
hi Error         ctermfg=231   ctermbg=88    cterm=NONE

hi FoldColumn    ctermfg=88    ctermbg=NONE  cterm=NONE
hi Folded        ctermfg=NONE  ctermbg=NONE  cterm=bold

hi StatusLineNC  ctermfg=94    ctermbg=234   cterm=NONE
hi StatusLine    ctermfg=208   ctermbg=236   cterm=NONE
hi VertSplit     ctermfg=240   ctermbg=234   cterm=NONE

" Tab menu
hi TabLineSel    ctermfg=208   ctermbg=NONE  cterm=NONE
hi TabLineFill   ctermfg=94    ctermbg=236   cterm=underline
hi TabLine       ctermfg=94    ctermbg=236   cterm=underline

hi Comment       ctermfg=240   ctermbg=NONE  cterm=NONE
hi Todo          ctermfg=208   ctermbg=NONE  cterm=underline

hi String        ctermfg=65    ctermbg=NONE  cterm=NONE " 'blah'
hi Number        ctermfg=88    ctermbg=NONE  cterm=NONE
hi Boolean       ctermfg=127   ctermbg=NONE  cterm=NONE
hi Float         ctermfg=88    ctermbg=NONE  cterm=NONE
hi Constant      ctermfg=127   ctermbg=NONE  cterm=NONE

hi Identifier    ctermfg=67    ctermbg=NONE  cterm=NONE " the text in $blah
hi Function      ctermfg=137   ctermbg=NONE  cterm=NONE " init() substr()

hi Define        ctermfg=28    ctermbg=NONE  cterm=NONE " function new
hi Statement     ctermfg=130   ctermbg=NONE  cterm=NONE " $ = : . return if exit for
hi Conditional   ctermfg=130   ctermbg=NONE  cterm=NONE " if then else
hi Repeat        ctermfg=130   ctermbg=NONE  cterm=NONE " foreach while
hi Label         ctermfg=130   ctermbg=NONE  cterm=NONE " 

hi Operator      ctermfg=215   ctermbg=NONE  cterm=NONE " $ = : . return if exit for

hi Include       ctermfg=28    ctermbg=NONE  cterm=NONE " require include
hi Type          ctermfg=28    ctermbg=NONE  cterm=NONE
hi StorageClass  ctermfg=28    ctermbg=NONE  cterm=NONE
hi Structure     ctermfg=28    ctermbg=NONE  cterm=NONE " class ->
hi Typedef       ctermfg=28    ctermbg=NONE  cterm=NONE

hi Special       ctermfg=88    ctermbg=NONE  cterm=NONE " () {} []
hi SpecialChar   ctermfg=88    ctermbg=NONE  cterm=NONE " hex, ocatal etc.
" hi Delimiter     ctermfg=88    ctermbg=NONE  cterm=NONE
