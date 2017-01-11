### Plugin surround

* artigo sobre o plugin 'repeat' que completa o plugin surround
* http://www.catonmat.net/blog/vim-plugins-repeat-vim

O plugin surround auxilia a colocar trechos entre parênteses
chaves, colchetes etc.

 Veja também o RepeatPlugin

url: http://www.vim.org/scripts/script.php?script_id=1697
artigo: http://www.catonmat.net/blog/vim-plugins-surround-vim/
video: http://vimeo.com/6093081

### deletando surround

 ds' ........ apaga aspas simples
 ds( ........ apaga parenteses
 dst ........ retira <div


### alterando surround

 cs' ........ apaga aspas simples
 cs( ........ apaga parenteses
 cst ........ retira <div

### Para colocar uma palavra entre (,{,[,<,"

   cswb .............  (palavra)
   cswB .............  {palavra}
   cswr .............  [palavra]
   cswa .............  <palavra>
   csw"..............  "palavra"

   MODO INSERT

   Ctrl-s" ................. ""
   Ctrl-s( ................. ()
   Ctrl-s[ ................. []
   Ctrl-s' ................. ''

   Ctrl-s-b .................()
   Ctrl-s-B .................{}
   Ctrl-s-r .................[]
   Ctrl-s-a .................<>

### Modo visual

  Vs<p>
  V .......... Seleção por linha
  s .......... surround
  <p> ........ tag envolvendo

  asdf asdfasdfasd


### Para colocar uma serie de palavras entre aspas

   csw" ................ coloca palavra atual entre aspas
   . ................... repete a inserção das aspas

   ( necessita do plugin repeat instalado )
