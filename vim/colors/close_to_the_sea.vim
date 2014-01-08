" Vim color file
" Converted from Textmate theme Close to the Sea using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Close to the Sea"

hi Cursor  guifg=NONE guibg=#ffffff gui=NONE
hi Visual  guifg=NONE guibg=#b5a9ad gui=NONE
hi CursorLine  guifg=NONE guibg=#151e21 gui=NONE
hi CursorColumn  guifg=NONE guibg=#151e21 gui=NONE
hi LineNr  guifg=#8b908f guibg=#172024 gui=NONE
hi VertSplit  guifg=#434a4d guibg=#434a4d gui=NONE
hi MatchParen  guifg=#5f919a guibg=NONE gui=bold
hi StatusLine  guifg=#fffffa guibg=#434a4d gui=bold
hi StatusLineNC  guifg=#fffffa guibg=#434a4d gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#b5a9ad gui=NONE
hi IncSearch  guifg=NONE guibg=#2f454b gui=NONE
hi Search  guifg=NONE guibg=#2f454b gui=NONE
hi Directory  guifg=#aed4dc guibg=NONE gui=NONE
hi Folded  guifg=#78b2c7 guibg=#172024 gui=NONE

hi Normal  guifg=#fffffa guibg=#172024 gui=NONE
hi Boolean  guifg=NONE guibg=NONE gui=NONE
hi Character  guifg=#aed4dc guibg=NONE gui=NONE
hi Comment  guifg=#78b2c7 guibg=NONE gui=italic
hi Conditional  guifg=#5f919a guibg=NONE gui=bold
hi Constant  guifg=NONE guibg=NONE gui=NONE
hi Define  guifg=#5f919a guibg=NONE gui=bold
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#b8252a guibg=NONE gui=NONE
hi Function  guifg=#ea511b guibg=NONE gui=NONE
hi Identifier  guifg=#fffffa guibg=NONE gui=NONE
hi Keyword  guifg=#5f919a guibg=NONE gui=bold
hi Label  guifg=#3a81c8 guibg=NONE gui=NONE
hi NonText  guifg=#fafaf5 guibg=#151e21 gui=NONE
hi Number  guifg=#b8252a guibg=NONE gui=NONE
hi Operator  guifg=#5f919a guibg=NONE gui=bold
hi PreProc  guifg=#5f919a guibg=NONE gui=bold
hi Special  guifg=#fffffa guibg=NONE gui=NONE
hi SpecialKey  guifg=#fafaf5 guibg=#151e21 gui=NONE
hi Statement  guifg=#5f919a guibg=NONE gui=bold
hi StorageClass  guifg=#fffffa guibg=NONE gui=NONE
hi String  guifg=#3a81c8 guibg=NONE gui=NONE
hi Tag  guifg=NONE guibg=NONE gui=NONE
hi Title  guifg=#fffffa guibg=NONE gui=bold
hi Todo  guifg=#78b2c7 guibg=NONE gui=inverse,bold,italic
hi Type  guifg=NONE guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#5f919a guibg=NONE gui=bold
hi rubyFunction  guifg=#ea511b guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#aed4dc guibg=NONE gui=NONE
hi rubyConstant  guifg=#54ba42 guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#3a81c8 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#c0effe guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#d0bfaf guibg=NONE gui=NONE
hi rubyInclude  guifg=#5f919a guibg=NONE gui=bold
hi rubyGlobalVariable  guifg=#d0bfaf guibg=NONE gui=NONE
hi rubyRegexp  guifg=#3a81c8 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#3a81c8 guibg=NONE gui=NONE
hi rubyEscape  guifg=#aed4dc guibg=NONE gui=NONE
hi rubyControl  guifg=#5f919a guibg=NONE gui=bold
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#5f919a guibg=NONE gui=bold
hi rubyException  guifg=#5f919a guibg=NONE gui=bold
hi rubyPseudoVariable  guifg=#d0bfaf guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#54ba42 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#e1da69 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#e1da69 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#e1da69 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#e1da69 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#78b2c7 guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#e1da69 guibg=NONE gui=NONE
hi htmlTag  guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag  guifg=NONE guibg=NONE gui=NONE
hi htmlTagName  guifg=NONE guibg=NONE gui=NONE
hi htmlArg  guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#aed4dc guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#fffffa guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#e1da69 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=NONE guibg=NONE gui=NONE
hi yamlAnchor  guifg=#d0bfaf guibg=NONE gui=NONE
hi yamlAlias  guifg=#d0bfaf guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#3a81c8 guibg=NONE gui=NONE
hi cssURL  guifg=#c0effe guibg=NONE gui=NONE
hi cssFunctionName  guifg=#e1da69 guibg=NONE gui=NONE
hi cssColor  guifg=#aed4dc guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=NONE guibg=NONE gui=NONE
hi cssClassName  guifg=NONE guibg=NONE gui=NONE
hi cssValueLength  guifg=#b8252a guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#ff005c guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
