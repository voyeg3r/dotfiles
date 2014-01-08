" Vim color file
" Converted from Textmate theme Tomorrow Night Bright using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Tomorrow Night Bright"

hi Cursor  guifg=NONE guibg=#3a3a3a gui=NONE
hi Visual  guifg=NONE guibg=#bbc5d3 gui=NONE
hi CursorLine  guifg=NONE guibg=#dae5f6 gui=NONE
hi CursorColumn  guifg=NONE guibg=#dae5f6 gui=NONE
hi LineNr  guifg=#afafaf guibg=#ffffff gui=NONE
hi VertSplit  guifg=#e1e1e1 guibg=#e1e1e1 gui=NONE
hi MatchParen  guifg=#373737 guibg=NONE gui=NONE
hi StatusLine  guifg=#5f5f5f guibg=#e1e1e1 gui=bold
hi StatusLineNC  guifg=#5f5f5f guibg=#e1e1e1 gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#bbc5d3 gui=NONE
hi IncSearch  guifg=NONE guibg=#bdbdbd gui=NONE
hi Search  guifg=NONE guibg=#bdbdbd gui=NONE
hi Directory  guifg=#d61819 guibg=NONE gui=NONE
hi Folded  guifg=#7c7e7a guibg=#ffffff gui=NONE

hi Normal  guifg=#5f5f5f guibg=#ffffff gui=NONE
hi Boolean  guifg=#e08e2f guibg=NONE gui=NONE
hi Character  guifg=#d61819 guibg=NONE gui=NONE
hi Comment  guifg=#7c7e7a guibg=NONE gui=NONE
hi Conditional  guifg=#8c5ea7 guibg=NONE gui=NONE
hi Constant  guifg=NONE guibg=NONE gui=NONE
hi Define  guifg=#373737 guibg=NONE gui=NONE
hi ErrorMsg  guifg=#eb291c guibg=NONE gui=NONE
hi WarningMsg  guifg=#eb291c guibg=NONE gui=NONE
hi Float  guifg=#e08e2f guibg=NONE gui=NONE
hi Function  guifg=#3975b6 guibg=NONE gui=NONE
hi Identifier  guifg=#9062a5 guibg=NONE gui=NONE
hi Keyword  guifg=#373737 guibg=NONE gui=NONE
hi Label  guifg=#88c300 guibg=NONE gui=NONE
hi NonText  guifg=#d5d7ce guibg=#dae5f6 gui=NONE
hi Number  guifg=#e08e2f guibg=NONE gui=NONE
hi Operator  guifg=#373737 guibg=NONE gui=NONE
hi PreProc  guifg=#257bb4 guibg=NONE gui=NONE
hi Special  guifg=#5f5f5f guibg=NONE gui=NONE
hi SpecialKey  guifg=#d5d7ce guibg=#dae5f6 gui=NONE
hi Statement  guifg=#8c5ea7 guibg=NONE gui=NONE
hi StorageClass  guifg=#9062a5 guibg=NONE gui=NONE
hi String  guifg=#88c300 guibg=NONE gui=NONE
hi Tag  guifg=#8c5ea7 guibg=NONE gui=NONE
hi Title  guifg=#5f5f5f guibg=NONE gui=bold
hi Todo  guifg=#7c7e7a guibg=NONE gui=inverse,bold
hi Type  guifg=NONE guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#8c5ea7 guibg=NONE gui=NONE
hi rubyFunction  guifg=#3975b6 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#d61819 guibg=NONE gui=NONE
hi rubyConstant  guifg=#c6241b guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#88c300 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#466fb9 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyInclude  guifg=#257bb4 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#466fb9 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#88c300 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#88c300 guibg=NONE gui=NONE
hi rubyEscape  guifg=#d61819 guibg=NONE gui=NONE
hi rubyControl  guifg=#8c5ea7 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#373737 guibg=NONE gui=NONE
hi rubyException  guifg=#257bb4 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#c6241b guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#8c5ea7 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#8c5ea7 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#8c5ea7 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#8c5ea7 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=#e18e2f guibg=NONE gui=NONE
hi erubyComment  guifg=#7c7e7a guibg=NONE gui=NONE
hi erubyRailsMethod  guifg=#8c5ea7 guibg=NONE gui=NONE
hi htmlTag  guifg=#8c5ea7 guibg=NONE gui=NONE
hi htmlEndTag  guifg=#8c5ea7 guibg=NONE gui=NONE
hi htmlTagName  guifg=#8c5ea7 guibg=NONE gui=NONE
hi htmlArg  guifg=#8c5ea7 guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#d61819 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#9062a5 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#8c5ea7 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#8c5ea7 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#466fb9 guibg=NONE gui=NONE
hi yamlAlias  guifg=#466fb9 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#88c300 guibg=NONE gui=NONE
hi cssURL  guifg=#466fb9 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#8c5ea7 guibg=NONE gui=NONE
hi cssColor  guifg=#d61819 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#9062a5 guibg=NONE gui=NONE
hi cssClassName  guifg=#9062a5 guibg=NONE gui=NONE
hi cssValueLength  guifg=#e08e2f guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#c6241b guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
