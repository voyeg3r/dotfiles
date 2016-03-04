" Vim color file
" Converted from Textmate theme Why’s Poignant using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "whysPoignant"

hi Cursor  guifg=NONE guibg=#340019 gui=NONE
hi Visual  guifg=NONE guibg=#c4dbec gui=NONE
hi CursorLine  guifg=NONE guibg=#ffffdc gui=NONE
hi CursorColumn  guifg=NONE guibg=#ffffdc gui=NONE
hi LineNr  guifg=#96b2ca guibg=#fffef9 gui=NONE
hi VertSplit  guifg=#d7e1e7 guibg=#d7e1e7 gui=NONE
hi MatchParen  guifg=#761b48 guibg=NONE gui=bold
hi StatusLine  guifg=#2d669a guibg=#d7e1e7 gui=bold
hi StatusLineNC  guifg=#2d669a guibg=#d7e1e7 gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#c4dbec gui=NONE
hi IncSearch  guifg=NONE guibg=#d2b3bf gui=NONE
hi Search  guifg=NONE guibg=#d2b3bf gui=NONE
hi Directory  guifg=#000000 guibg=NONE gui=NONE
hi Folded  guifg=#555555 guibg=#fffef9 gui=NONE

hi Normal  guifg=#2d669a guibg=#fffef9 gui=NONE
hi Boolean  guifg=#4f1900 guibg=NONE gui=bold
hi Character  guifg=#000000 guibg=NONE gui=NONE
hi Comment  guifg=#555555 guibg=NONE gui=NONE
hi Conditional  guifg=#761b48 guibg=NONE gui=bold
hi Constant  guifg=NONE guibg=NONE gui=NONE
hi Define  guifg=#761b48 guibg=NONE gui=bold
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#2a9a66 guibg=NONE gui=NONE
hi Function  guifg=NONE guibg=NONE gui=NONE
hi Identifier  guifg=NONE guibg=NONE gui=NONE
hi Keyword  guifg=#761b48 guibg=NONE gui=bold
hi Label  guifg=#2a9a66 guibg=#e8f5f5 gui=NONE
hi NonText  guifg=#ff98ca guibg=#ffffdc gui=NONE
hi Number  guifg=#2a9a66 guibg=NONE gui=NONE
hi Operator  guifg=#761b48 guibg=NONE gui=bold
hi PreProc  guifg=#761b48 guibg=NONE gui=bold
hi Special  guifg=#2d669a guibg=NONE gui=NONE
hi SpecialKey  guifg=#ff98ca guibg=#ffffdc gui=NONE
hi Statement  guifg=#761b48 guibg=NONE gui=bold
hi StorageClass  guifg=NONE guibg=NONE gui=NONE
hi String  guifg=#2a9a66 guibg=#e8f5f5 gui=NONE
hi Tag  guifg=#761b48 guibg=NONE gui=bold
hi Title  guifg=#2d669a guibg=NONE gui=bold
hi Todo  guifg=#555555 guibg=NONE gui=inverse,bold
hi Type  guifg=NONE guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#761b48 guibg=NONE gui=bold
hi rubyFunction  guifg=NONE guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#000000 guibg=NONE gui=NONE
hi rubyConstant  guifg=#4f1900 guibg=NONE gui=bold
hi rubyStringDelimiter  guifg=#2a9a66 guibg=#e8f5f5 gui=NONE
hi rubyBlockParameter  guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#2d669a guibg=NONE gui=NONE
hi rubyInclude  guifg=#2d669a guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#2d669a guibg=NONE gui=NONE
hi rubyRegexp  guifg=#443355 guibg=#e8f1f5 gui=NONE
hi rubyRegexpDelimiter  guifg=#443355 guibg=#e8f1f5 gui=NONE
hi rubyEscape  guifg=#000000 guibg=NONE gui=NONE
hi rubyControl  guifg=#761b48 guibg=NONE gui=bold
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#761b48 guibg=NONE gui=bold
hi rubyException  guifg=#2d669a guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#2d669a guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#4f1900 guibg=NONE gui=bold
hi rubyRailsARAssociationMethod  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=NONE guibg=NONE gui=NONE
hi erubyDelimiter  guifg=#9d3266 guibg=NONE gui=NONE
hi erubyComment  guifg=#555555 guibg=NONE gui=NONE
hi erubyRailsMethod  guifg=NONE guibg=NONE gui=NONE
hi htmlTag  guifg=#9d3266 guibg=NONE gui=NONE
hi htmlEndTag  guifg=#9d3266 guibg=NONE gui=NONE
hi htmlTagName  guifg=#9d3266 guibg=NONE gui=NONE
hi htmlArg  guifg=#9d3266 guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#2a9a66 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=NONE guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=NONE guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#761b48 guibg=NONE gui=bold
hi yamlAnchor  guifg=#2d669a guibg=NONE gui=NONE
hi yamlAlias  guifg=#2d669a guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#2a9a66 guibg=#e8f5f5 gui=NONE
hi cssURL  guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName  guifg=NONE guibg=NONE gui=NONE
hi cssColor  guifg=#000000 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#4f1900 guibg=NONE gui=bold
hi cssClassName  guifg=#4f1900 guibg=NONE gui=bold
hi cssValueLength  guifg=#2a9a66 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=NONE guibg=NONE gui=NONE
hi cssBraces  guifg=#9d3266 guibg=NONE gui=NONE
