" Vim color file
" Converted from Textmate theme Ruby Blue using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Ruby Blue"

hi Cursor  guifg=NONE guibg=#ffffff gui=NONE
hi Visual  guifg=NONE guibg=#38566f gui=NONE
hi CursorLine  guifg=NONE guibg=#253e5a gui=NONE
hi CursorColumn  guifg=NONE guibg=#253e5a gui=NONE
hi LineNr  guifg=#898f98 guibg=#121e31 gui=NONE
hi VertSplit  guifg=#3f4958 guibg=#3f4958 gui=NONE
hi MatchParen  guifg=#f8bb00 guibg=NONE gui=NONE
hi StatusLine  guifg=#ffffff guibg=#3f4958 gui=bold
hi StatusLineNC  guifg=#ffffff guibg=#3f4958 gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#38566f gui=NONE
hi IncSearch  guifg=NONE guibg=#5e5221 gui=NONE
hi Search  guifg=NONE guibg=#5e5221 gui=NONE
hi Directory  guifg=#b53b3c guibg=NONE gui=NONE
hi Folded  guifg=#428bdd guibg=#121e31 gui=NONE

hi Normal  guifg=#ffffff guibg=#121e31 gui=NONE
hi Boolean  guifg=#8aa6c1 guibg=NONE gui=NONE
hi Character  guifg=#8aa6c1 guibg=NONE gui=NONE
hi Comment  guifg=#428bdd guibg=NONE gui=italic
hi Conditional  guifg=#f8bb00 guibg=NONE gui=NONE
hi Constant  guifg=#8aa6c1 guibg=NONE gui=NONE
hi Define  guifg=#f8bb00 guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#eddd3d guibg=NONE gui=NONE
hi Function  guifg=NONE guibg=NONE gui=NONE
hi Identifier  guifg=NONE guibg=NONE gui=NONE
hi Keyword  guifg=#f8bb00 guibg=NONE gui=NONE
hi Label  guifg=#1dc116 guibg=NONE gui=NONE
hi NonText  guifg=#404040 guibg=#253e5a gui=NONE
hi Number  guifg=#eddd3d guibg=NONE gui=NONE
hi Operator  guifg=#8aa6c1 guibg=NONE gui=NONE
hi PreProc  guifg=#f8bb00 guibg=NONE gui=NONE
hi Special  guifg=#ffffff guibg=NONE gui=NONE
hi SpecialKey  guifg=#404040 guibg=#253e5a gui=NONE
hi Statement  guifg=#f8bb00 guibg=NONE gui=NONE
hi StorageClass  guifg=NONE guibg=NONE gui=NONE
hi String  guifg=#1dc116 guibg=NONE gui=NONE
hi Tag  guifg=NONE guibg=NONE gui=NONE
hi Title  guifg=#ffffff guibg=NONE gui=bold
hi Todo  guifg=#428bdd guibg=NONE gui=inverse,bold,italic
hi Type  guifg=NONE guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#f8bb00 guibg=NONE gui=NONE
hi rubyFunction  guifg=NONE guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#b53b3c guibg=NONE gui=NONE
hi rubyConstant  guifg=NONE guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#1dc116 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#8aa6c1 guibg=NONE gui=italic
hi rubyInstanceVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyInclude  guifg=#f8bb00 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp  guifg=#ca4344 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#ca4344 guibg=NONE gui=NONE
hi rubyEscape  guifg=#8aa6c1 guibg=NONE gui=NONE
hi rubyControl  guifg=#f8bb00 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#8aa6c1 guibg=NONE gui=NONE
hi rubyException  guifg=#f8bb00 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#b43d3d guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#b43d3d guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#b43d3d guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#b43d3d guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#428bdd guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#b43d3d guibg=NONE gui=NONE
hi htmlTag  guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag  guifg=NONE guibg=NONE gui=NONE
hi htmlTagName  guifg=NONE guibg=NONE gui=NONE
hi htmlArg  guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#8aa6c1 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=NONE guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#b43d3d guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=NONE guibg=NONE gui=NONE
hi yamlAnchor  guifg=NONE guibg=NONE gui=NONE
hi yamlAlias  guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#1dc116 guibg=NONE gui=NONE
hi cssURL  guifg=#8aa6c1 guibg=NONE gui=italic
hi cssFunctionName  guifg=#b43d3d guibg=NONE gui=NONE
hi cssColor  guifg=#b53b3c guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=NONE guibg=NONE gui=NONE
hi cssClassName  guifg=NONE guibg=NONE gui=NONE
hi cssValueLength  guifg=#eddd3d guibg=NONE gui=NONE
hi cssCommonAttr  guifg=NONE guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
