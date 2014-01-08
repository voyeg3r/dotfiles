" Maintainer: Matt Ephraim
" Based On: wombat.vim

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "efrum"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   guibg=#263133
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen   guifg=#F11818 guibg=bg
  hi Pmenu        guifg=#f6f3e8 guibg=#242829
  hi PmenuSel     guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor       guifg=NONE    guibg=#656565 gui=none
hi Normal       guifg=#f6f3e8 guibg=#0A0A0A gui=none
hi NonText      guifg=#A7A7A7 guibg=#090909 gui=none
hi LineNr       guifg=#857b6f guibg=#000000 gui=none
hi StatusLine   guifg=#f6f3e8 guibg=#2B4133 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#181B22 gui=none
hi VertSplit    guifg=#181B22 guibg=#181B22 gui=none
hi Folded       guibg=#272727 guifg=#E1F3FA gui=none
hi FoldColumn   guifg=#444444 guibg=#080808
hi SignColumn   guibg=#0A0A0A
hi ColorColumn  guibg=#130707
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold
hi Visual       guifg=#f6f3e8 guibg=#1F4457 gui=none
hi SpecialKey   guifg=#808080 guibg=#0A0A0A gui=none
hi Search       guibg=#E4F565 guifg=#000000
hi Conceal      guibg=#272727 guifg=#E1F3FA gui=none
hi Directory    guifg=#8ac6f2

" Syntax highlighting
hi Comment      guifg=#A7A7A7 gui=italic
hi Todo         guibg=bg guifg=#F1F13A gui=underline
hi Constant     guifg=#E04331 gui=none
hi String       guifg=#95e454 gui=italic
hi Identifier   guifg=#cae682 gui=none
hi Function     guifg=#cae682 gui=none
hi Type         guifg=#D4EB9C gui=none
hi Statement    guifg=#8ac6f2 gui=none
hi Keyword      guifg=#8ac6f2 gui=none
hi PreProc      guifg=#81BDCC gui=none
hi Number       guifg=#F5773C gui=none
hi Boolean      guifg=#E04331 gui=underline
hi Special      guifg=#e7f6da gui=none
hi Error        guifg=#e7f6da guibg=#3A0505
hi Warning      guifg=#e7f6da guibg=#3A0505
hi WarningMsg   guifg=#F11818 guibg=bg
hi Tag          gui=underline

" Diff highlighting
hi DiffAdd    guibg=#D1FFB6 guifg=#080C06
hi DiffChange guibg=#0F1308 guifg=NONE
hi DiffText   guibg=#D1FFB6 guifg=#080C06
hi DiffDelete guibg=#290700 guifg=#FC5B3B

" Syntastic
hi SyntasticError guibg=bg guifg=#F11818
hi SyntasticWarning guibg=bg guifg=#F1F13A

" Taglist
hi MyTagListFileName guibg=bg guifg=#8ac6f2

" Mediawiki
hi wikiItalic	       guifg=#A7A7A7
hi wikiBold	         guifg=#E04331
hi wikiBoldAndItalic guifg=#8ac6f2 gui=none

hi wikiH1 guifg=#8ac6f2 gui=underline
hi wikiH2 guifg=#8ac6f2 gui=underline
hi wikiH3 guifg=#8ac6f2 gui=underline
hi wikiH4 guifg=#8ac6f2 gui=underline
hi wikiH5 guifg=#8ac6f2 gui=underline
hi wikiH6 guifg=#8ac6f2 gui=underline

hi wikiLink guifg=#95e454 gui=underline

" HTML
hi htmlBold guifg=#E04331
hi htmlUnderline gui=underline

