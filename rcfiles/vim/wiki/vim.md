
{{{

### Introdução
### fonte consolas no linux
* http://igordevlog.blogspot.com/2007/05/how-to-consolas-font-in-linux.html

### usando o plugin vimball

mkdir ~/.vim/bundle/neocomplcache

:let g:vimball_home="~/.vim/bundle/neocomplcache"
:so %

### inserindo uma linha em branco após cada seguda linha

    :%s,.*\n.*\n,\0\r,g

### Formatando css no vim
* http://stackoverflow.com/questions/1422866/

# main {
      padding:0;
      margin: 10px auto;
}
# quero deixa-lo assim:

# main {padding:0;margin:10px auto;}

Here's a one-liner:

:%s/{\_.\{-}}/\=substitute(submatch(0), '\n', '', 'g')/

\_. matches any character, including a newline, and \{-} is the non-greedy version of *, so {\_.\{-}} matches everything between a matching pair of curly braces, inclusive.

The \= allows you to substitute the result of a vim expression, which we here use to strip out all the newlines '\n' from the matched text (in submatch(0)) using the substitute() function.

The inverse (converting the one-line version to multi-line) can also be done as a one liner:

:%s/{\_.\{-}}/\=substitute(submatch(0), '[{;]', '\0\r', 'g')/

### Resolvendo problema de permissões
Algumas vezes você começa a editar um arquivo importante do sistema para em seguida se dar
conta de que está fazendo isto como usuário comun, para resolver esta situação:

cmap w!! %!sudo tee > /dev/null %

"        ( O O )
" ====oOO==(_)==OOo=====

"        °v°
"       /(_)\
"        ^ ^

### setando uma variável ao abrir

vi +"se nu" Pessoa.py

### inserindo comentários

" Perl, Python and shell scripts
autocmd BufNewFile,BufRead *.py,*.pl,*.sh vmap u :-1/^#/s///<CR>
autocmd BufNewFile,BufRead *.py,*.pl,*.sh vmap c :-1/^/s//#/<CR>

### Que tal fazer substituição somente nas próximas 4 linhas?

:s/isto/aquilo/g 4

### Editando o histórico de comandos do vim

Com o cursor posicionado na linha de comandos do vim pressione:
<ctrl-f> abre o histórico de comandos do vim para edição

### tirando linhas em branco duplicadas

:%v/./,/./-j

### destacando linhas duplicadas

:g/^\(.*\)\n\ze\%(.*\n\)*\1$/#

### juntando todas as linhas do arquivo

:g/./-j

:%j

### salvando um trecho para outro arquivo

:20,45 w! ~/tmp/file.txt

### incrementando números

:4,$s/\d\+/\=submatch(0) + 1/

veja também o plugin visincr - faz incremento de um trecho selecionado
[[@http://www.vim.org/scripts/script.php?script_id=670]]
### mantendo uma linha a mais visível ao fazer a rolagem

set scrolloff=2

### ignorando espaços no modo diff

set diffopt+=iwhite

### destacando a linha ativa

:set cursorline

### correções para o livro

haverpa .... procure e corrija esta palavra
no modo normal, ato de deletar...
("mudança")
na seção 2.11 citar o a seção "trabalhando com janelas"

### inserção em bloco vertical

ctrl-v  shift-v + insert

### comparando dois arquivos remotamente com o vim

vimdiff <file> scp://[<user>@]<host>/<file>

### comando vim

vim -c "5,10s/a/b/g | wq" filename

###<span class="mw-headline">Boolean options</span>
fonte - wikia
The many ways to set a boolean option are best illustrated by a simple example. In the following, the 'number' option is used. Any boolean option, such as wrap, linebreak, diff, etc can be set in these ways.
|| {{:set number}} || Turn line numbers on ||
|| {{:set nonumber}} || Turn line numbers off ||
|| {{:set invnumber}}
{{:set number!}} || Toggle line numbers ||
|| {{:set number&}} || Set option to default value ||
|| {{:set number?}} || Show value of option ||

map <F2> :set wrap!<CR>

Para listar todas definições de uma macro use:

:dlist EOF

É semelhante a

[D e ]D

mas permite também selecionar um intervalo de linhas a serem pesquisadas.
O comando:

:dsearch EOF

pesquisa definições também, mas só lista a primeira.

### setando a barra de título

let &titlestring = hostname() . " - " . expand("%:p")

===[[http://vim-anotacoes.blogspot.com/2009/05/abrindo-uma-janela-com-o-primeiro.html|Abrindo uma janela com o primeiro arquivo com uma palavra]]===
Se você posicionar o cursor sob uma palavra e pressionar:

<Ctrl-W><Ctrl-I>

o vim pesquisará no arquivo corrente e nos includes, retornando a primeira
ocorrência na nova janela.
### contanto ocorrências de palavras

:%s/palavra//gn
" contagem de ocorrências de uma palavra (case insensitive)
nmap <F4> <esc>mz:%s/\c\<\(<c-r>=expand("<cword>")<cr>\)\>//gn<cr>`z
nmap <s-F4> <esc>mz:%s/\c\(<c-r>=expand("<cword>")<cr>\)//gn<cr>`z

### plugin fontsize
aumenta a fonte com <leader>++
* http://www.vim.org/scripts/script.php?script_id=2809#0.1.0

### exibindo todos os snippets disponíveis
No plugin snipmate

<c-r><tab>

### Abrir com o vim o último arquivo/diretório editado

vim $( ls -t | head -n1 )
:nohls ..... desabilita cores nas buscas

### Manipulando o nome do arquivo

amenu 20.351 &Edit.Copy\ fName :let @*=expand("%:t")<CR>
amenu 20.352 &Edit.Copy\ fPath :let @*=expand("%:p:h")<CR>
amenu 20.353 &Edit.Copy\ rName :let @*=expand("%:.")<CR>

### salvar ao sair do modo insert

:au InsertLeave <buffer> w

### buscar global clicável

:vimgrep /pattern/ %.

### Após instalar um doc

:helptags ~/.vim/doc

### dicas de busca

" contagem de ocorrências de uma palavra (case insensitive)
nmap <F4> :%s/\c\(<c-r>=expand("<cword>")<cr>\)//gn<cr>

" mapeamento para colocar palavra sob o cursor na busca
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

### Definindo a fonte e estilo do mouse

"use our custom font
if has("gui")
  set guifont=Courier_New:h10:cANSI
  "set anti gfn=Monaco:h9

  "see: http://vim.wikia.com/wiki/VimTip1
  set mousemodel=extend
endif

### estou tentando pegar uma palavra para um comando isto é só anotação

function! OnlineDoc()
  let s:browser = "firefox"
  let s:wordUnderCursor = expand("<cword>")
  if &ft == "cpp" || &ft == "c" || &ft == "ruby" || &ft == "php" || &ft == "python"
    let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor."+lang:".&ft
  elseif &ft == "vim"
    let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor
  else
    return
  endif
  let s:cmd = "silent !" . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
" Online doc search.
map <LocalLeader>k :call OnlineDoc()<CR>

### Sempre usar unicode utf-8

" *always* use Unicode
set encoding=utf-8 fileencodings=

### Definindo o Compilador

if has("autocmd")
  autocmd BufRead,BufNewFile *.java set makeprg=javac\ %
  "autocmd BufRead BufNewFile *.java set makeprg=ant\ -emacs

  " Mark Klips as XML files (17/2/2005)
  autocmd BufRead,BufNewFile *.klip set filetype=xml

  autocmd BufRead,BufNewFile *.tex set makeprg=latex\ %
endif

### project plugin
* http://www.vim.org/scripts/script.php?script_id=69
* [[http://github.com/tomasr/dotfiles/blob/9856d9635c45edf67f91b7d63a6d303161c70b5b/.vim/doc/project.txt|leia também]]

Project quickstart guide

I have to agree with GavinSinclair about the ease of use of
Project. Here is a quick guide to get you started after installing Project.

   1. Type :Project in Vim to launch the Project plugin.
   2. Type \C to launch the create project routine.
   3. Enter a name for the project (e.g. @RailsApp@)
   4. Enter the directory path (e.g. /Users/me/Development/RailsApp)
   5. Type . as the CD parameter.
   6. Type * as the filter.
   7. Type \r to load all files and directories.

You should now have a full directory list of your rails
application accessible from within Project. A lot of directories
that you may not need can simply be deleted (I normally only
keep around app and public directories).

To save you project settings, simply do a :w as you would any
other file. For Project settings, refer to :help project.

Para carregar o vim com a janela do plugin Project carregada faça
[g]vim +Project

Para mostrar um status do projeto
\i

" --------------------
" Project
" --------------------
map <A-S-p> :Project<CR>
map <A-S-o> :Project<CR>:redraw<CR>/
nmap <silent> <F3> <Plug>ToggleProject
let g:proj_window_width = 30
let g:proj_window_increment = 50
" habilitar e desabilitar o plugin
nmap <silent> ,p <Plug>ToggleProject<cr>

### dicas de substituição

:%s/foo/\=@a/g ...... \=@a (conteúdo do registro a)

### dica do comando global

 :g/pattern/# ...... o '#' faz exibir o número da linha

### dicas para nmap

nnoremap <Space> :

### dica para bufdo

:bufdo %s/pattern/substitution/ge | update

bufdo – apply the following command to all buffers – see :help :bufdo.
%s – search and replace the whole file
g – change all instances in a line
e – avoid an error when the pattern doesn’t exist in a buffer
update – write the file only if changes were made
See also :help :argdo.
### gerando uma lista
* http://vim.wikia.com/wiki/Increasing_or_decreasing_numbers

:0put =range(11,15)
11
12
13
14
15

" outro exemplo
:for i in range(1,10) | put ='192.168.0.'.i | endfor
192.168.0.1
192.168.0.2
192.168.0.3
192.168.0.4
192.168.0.5
192.168.0.6
192.168.0.7
192.168.0.8
192.168.0.9
192.168.0.10

Usando comandos externos

:.!seq -w 1 010
001
002
003
004
005
006
007
008
009
010

### copiando o arquivo para o clipboard

:%y+

### change case
* http://vim.wikia.com/wiki/Switching_case_of_characters
"widdle case
"With the following (for example, in vimrc), you can visually select text then press ~ to convert "the text to UPPER CASE, then to lower case, then to Title Case. Keep pressing ~ until you get the "case you want.

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

### Comando global para colocar sublinhado

:g/^Chapter/t.|s/./-/g

g ........... global
/ ........... inicio da busca
^ ........... começo de linha
Chapter ..... palavra considerada literal
/ ........... fim do padrão de busca
t ........... coresponde a cópia
. ........... o ponto indica que é para a linha atual
| ........... o pipe separa o próximo comando
s ........... substituição
. ........... qualquer caractere
- ........... por traço
g ........... globalmente

### Syntax em regiões do texto
* http://vim.wikia.com/wiki/Creating_your_own_syntax_files
### dicas do modo de inserção

 ^w ............ apaga palavra anterior ao cursor
 ^rp = "+p
 ^t ............ indenta
 ^d ............ remove indentação
 ^e ............ repete linha abaixo
 ^y ............ repete linha acima

### fuzzyfinder

map <leader>f <esc>:FuzzyFinderFile<cr>
map <leader>b <esc>:FuzzyFinderBookmark<cr>
map <leader>a <esc>:FuzzyFinderAddBookmark<cr>
map <leader>d <esc>:FuzzyFinderDir<cr>
map <leader>m <esc>:FuzzyFinderMruFile<cr>
let g:fuzzy_matching_limit=25

### set

set shiftwidth=3
set tabstop=3
set expandtab

### mostrar caracteres ocultos

set listchars=tab:\|\ ,extends:>,precedes:<,trail:-,nbsp:%
nmap <silent> <leader>s :set nolist!<CR>

### Abrir novos arquivos em abas
fonte: http://eustaquiorangel.com/blog/show/477

alias tvim="gvim --servername `gvim --serverlist | head -1` --remote-tab"

### path
Para fazer buscas mais legais use...

set path+=**
nmap <d-t> :e **/
:find filename

### bufdo

:bufdo exe "normal @q" | w   : perform a recording on open files

### Opções

set ve=all     "permite mover o cursor para áreas onde não há texto
set ttyfast    "Envia mais caracteres ao terminal, melhorando o redraw de janelas.

### Vim como editor binário

 :%!xxd ........... entra em modo binário
 :%!xxd -r ........ volta ao modo normal

### Livros
* aprendendo vim (inglês) http://www.mediafire.com/download.php?3yzmzzykzyi
* hackeando o vim (inglês) http://www.mediafire.com/download.php?mbjxhmjznmo

### spell
1. É necessário o dicionário do [[http://www.broffice.org/verortografico/baixar|broffice]] (vero).
2. Descompacte o arquivo no seu home.
3. Abra o vim e digite <span style="font-family: courier new;">**:mkspell pt pt_BR**</span>
4. Ele irá "compilar" os arquivos e gerar o arquivo pt.utf-8.spl
5. sudo cp ~/pt.utf-8.spl /usr/share/vim/vim71/spell/
6. echo 'set spell spelllang=pt' > ~/.vimrc

===Atalhos do spell===

  ]s ............. vai para a próxima palavra
  zg ............. adiciona palavra
  zw ............. retira palavra
  z= ............. sugestões

Para definir a quantidade de sugestões do spell

set sps=10

Para detalhes

:h sps

" função para exibir conteúdo de folders e sugestões do spell"{{{
set spell spelllang=pt
function! FoldSpellBalloon()
    let foldStart = foldclosed(v:beval_lnum )
    let foldEnd = foldclosedend(v:beval_lnum)
    let lines = []
    " Detec if we are in a fold
    if foldStart < 0
        " Detect if we are on a misspelled word
        let lines = spellsuggest(spellbadword(v:beval_text)[0],10,0)
    else
        " we are in a fold
        let numLines = foldEnd - foldStart + 1
        " if we have too many lines in fold, show, only the first 14
        " and the last 14 lines
        if ( numLines > 31 )
            let lines = getline(foldStart, foldStart + 14 )
            let lines += [ '--Snipped ' . (numLines - 30 ) . 'lines --' ]
            let lines += getline(foldEnd - 14, foldEnd )
        else
            "less than 30 lines, lets show all of them
            let lines = getline(foldStart, foldEnd)
        endif
    endif
    " return result
    return join(lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction
set balloonexpr=FoldSpellBalloon()
set ballooneval"}}}

### syntaxe

syn match   txtH1         "=[^=].*="hs=s+1,he=e-1
syn match   txtH2         "==[^=].*=="hs=s+2,he=e-2
syn match   txtH3         "===[^=].*==="hs=s+3,he=e-3

hi link txtH1           String
hi link txtH2           String
hi link txtH3           String

### Atalhos do plugin surround

Text              Command    New Text
---------------   -------    -----------
"Hello |world!"   cs"'       'Hello world!'
"Hello |world!"   cs"<q>     <q>Hello world!</q>
(123+4|56)/2      cs)]       [123+456]/2
(123+4|56)/2      cs)[       [ 123+456 ]/2
<div>foo|</div>   cst<p>     <p>foo</p>
fo|o!             csw'       'foo'!
fo|o!             csW'       'foo!'

(| is the position of cursor in these examples)

Text              Command      New Text
---------------   -------      -----------
Hello w|orld!     ysiw)        Hello (world)!
Hello w|orld!     csw)         Hello (world)!
fo|o              ysiwt<html>  <html>foo</html>
foo quu|x baz     yss"         "foo quux baz"
foo quu|x baz     ySS"         "
                                   foo quux baz
                               "

(| is the position of cursor in these examples)

Command                  New Text
-------                  ------------
<CTRL-s>"                ""
<CTRL-s><CTRL-s><html>   <html>
                             |
                         </html>

(| is the position of cursor in these examples)
Normal mode
-----------
ds  - delete a surrounding
cs  - change a surrounding
ys  - add a surrounding
yS  - add a surrounding and place the surrounded text on a new line + indent it
yss - add a surrounding to the whole line
ySs - add a surrounding to the whole line, place it on a new line + indent it
ySS - same as ySs

Visual mode
-----------
s   - in visual mode, add a surrounding
S   - in visual mode, add a surrounding but place text on new line + indent it

Insert mode
-----------
<CTRL-s> - in insert mode, add a surrounding
<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
<CTRL-g>s - same as <CTRL-s>
<CTRL-g>S - same as <CTRL-s><CTRL-s>

### site que indica muitos plugins
* http://mysite.verizon.net/astronaut/vim/

### alterar a cor da linha de status

" altera a cor da linha de status dependendo do modo
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

### vimrc para windows
* http://download104.mediafire.com/00lis3ieyjwg/2yonejyowl1/_vimrc

### broken terminals - cure for the vim
* fonte: http://vimrc-dissection.blogspot.com/
Many times I have come across broken terminals screwing vim handling
of shortcuts. Or vim just do not expect that some keys may produce
such long sequences.

The most common sign - '--INSERT--' isn't displayed immedaitely after
pressing insert key.

The cure is:

    set notimeout
    set ttimeout
    set timeoutlen=100

:g/\d\+.*/m $   .... move números para o final
:g/^/m0 ............ inverte a odem das linhas
:g/Line commented/d  remove linhas que contém o padrão
:global /^Capítulo [0-9]$/ . w >> index.txt   .... joga linhas para um
arquivo

### Junção de linhas com vim
* Colaboração: Rubens Queiroz de Almeida
* original do dicas-l: http://www.dicas-l.com.br/dicas-l/20081228.php

Recentemente precisei combinar, em um arquivo, duas linhas consecutivas. O arquivo original continha linhas como

  Matrícula: 123456
  Senha: yatVind7kned
  Matrícula: 123456
  Senha: invanBabnit3

E assim por diante. Eu precisava converter este arquivo para algo como:

  Matrícula: 123456 - Senha: yatVind7kned
  Matrícula: 123456 - Senha: invanBabnit3

Para isto, basta emitir o comando:

  :g/^Matrícula/s/\n/ - /

Explicando:

g/^Matrícula     busca, no arquivo inteiro (g) pela palavra Matrícula na primeira coluna
s/\n/ - /     substitui a quebra de linha (\n), pelos caracteres ** - **. Esta substituição faz a junção das duas linhas adjacentes

### backup
* fonte: http://www.dicas-l.com.br/dicas-l/20081212.php
* http://writequit.org/blog/?cat=464
A primeira define que quero backups e a segunda onde devem ser mantidas as cópias dos trabalhos.

set backup
set backupdir=~/.backup,./.backup

### extensão para o firefox usar o vim
* https://addons.mozilla.org/pt-BR/firefox/addon/4125

O mapeamento abaixo leva em conta o complemento automático
de colchetes, caso não tenha este recurso habilitado altere
o mapeamento

" mapeamento para o wikispaces
imap <F4> `
nmap <F4> `

### destacar palavra sob o cursor

" mostra a palavra atual destacada
nnoremap <F10> :set hls<CR>:let @/="<C-r><C-w>"<CR>

python_highlight_numbers
python_highlight_builtins
python_highlight_exceptions

### prevent vim from going to replace mode
Simpliest trick on the block. Took me long time to figure out.

imap <Insert> <Nop>

### funções para html

"http://pastebin.com/f784c635a

" funções para html
""============================================================
" HTML: Funcoes particulares para editar arquivos HTML
" Cria um esqueleto de arquivo HTML ao abrir um arquivo novo .html
" Should stop HTML Files auto-indenting fecha tags com  \c
""============================================================

augroup html
" au! <--> Remove all html autocommands
au!
  au BufNewFile,BufRead *.html,*.shtml,*.htm set ft=html
  "au BufNewFile,BufRead,BufEnter  *.html,*.shtml,*.htm so ~/docs/vim/.vimrc-html
  au BufNewFile *.html 0r ~/vimfiles/skel/skel.html
  "au BufNewFile *.html*.shtml,*.htm /body/+
  au BufNewFile,BufRead *.html,*.shtml,*.htm set noautoindent nolist
  " para fechar uma tag html faça \c
  nnoremap \hc :call InsertCloseTag()<CR>
  inoremap <leader>c <Space><BS><Esc>\hca<esc>F<F>a<space><space><left>
augroup end

function! InsertCloseTag()
" fonte: http://www.stripey.com/vim/html.html
" inserts the appropriate closing HTML tag; used for the \hc operation defined
" above;
" requires ignorecase to be set, or to type HTML tags in exactly the same case
" that I do;
" doesn't treat <P> as something that needs closing;
" clobbers register z and mark z
" by Smylers  http://www.stripey.com/vim/
" 2000 May 3

  if &filetype == 'html'

    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br DD DT HR Img Input LI Link Meta P Param '

    " remember current position:
    normal mz

    " loop backwards looking for tags:
    let Found = 0
    while Found == 0
      " find the previous <, then go forwards one character and grab the first
      " character plus the entire word:
      execute "normal ?\<LT>\<CR>l"
      normal "zyl
      let Tag = expand('<cword>')

      " if this is a closing tag, skip back to its matching opening tag:
      if @z == '/'
        execute "normal ?\<LT>" . Tag . "\<CR>"

      " if this is a unary tag, then position the cursor for the next
      " iteration:
      elseif match(UnaryTags, ' ' . Tag . ' ') > 0
        normal h

      " otherwise this is the tag that needs closing:
      else
        let Found = 1

      endif
    endwhile " not yet found match

    " create the closing tag and insert it:
    let @z = '</' . Tag . '>'
    normal `z"zp

  else " filetype is not HTML
    echohl ErrorMsg
    echo 'The InsertCloseTag() function is only intended to be used in HTML ' .
      \ 'files.'
    sleep
    echohl None
  endif " check on filetype

endfunction " InsertCloseTag()
""============================================================
" fim das funções para html

### vimrc
* http://amix.dk/vim/vimrc.html

### Alguns mapeamentos

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

### mapeamento para fechar tags html

:imap > >   <esc>yF<A<esc>p<esc>F<a/<esc>F<F><right>

 descrevendo:

  Ao inserir (modo insert imap) um fechamento de tag
  1 - colocar o próprio fechamento
  2 - seguido de três espaços
  3 - sai do modo insert
  4 - copia até o menor que anterioro 'yF<'
  5 - vai para o final da linha em modo insert 'A'
  6 - sai do modo insert <esc> e cola o que foi copiado 'p'
  7 - sai novament do modo insert
  8 - vai para o '<' anterior e insere após o mesmo uma barra '/'
  9 - sai do modo insert <esc>
  10 - vai para '<' anterior
  11 - vai para o '>' anterior e avança para a direita <right>

### skel html
Eu uso duas abordagens para inserir modelos (templates) de
documentos no vim:
* skels - modelos que são insridos no novo documento
* funções específicas

As funções estão me parecendo uma melhor abordagem por dois motivos
# Permitem inserir a data da criação
# Não necessitam de nenhum arquivo externo

Abaixo um modelo 'skel' para uma página html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!--
Criado em: <+data+>
Last Change: <+data+>
Instituicao: <+nome+>
Autor: <+seu nome aqui+>
-->
<html>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- comentario -->
<head>
<!-- estilo css -->
<link rel="stylesheet" href="estilo.css" type="text/css">
    <title>
            <+titulo+>
    </title>
</head>
<body>
    <+corpo do site+>
</body>
</html>

### função para ordenação
O vim 7 tem uma função interna chamada 'sort'

:sort

* http://vim.wikia.com/wiki/Sort_lines_by_a_specified_word_number
"Here is an improved version. Sort lines by word# count or visual area.
"To sort by visual area, select a visual area (with a visual block) and enter "v" when prompted for a word# count.
"Please disregard the original code and use the one below:
"Put in vimrc file - tested with GVim 6.3
"
" use visual block <Ctrl-V> to select lines to sort and hit <F3>

vmap <F3> :call Sort(Prompt("0","1"),Prompt("1","f"),"Strcmp")<CR>

"sort lines function
function Sort(wnum, order, cmp) range
  normal `<
  execute "let startcol = col(\".\")"
  normal `>
  execute "let endcol = col(\".\")"
  if startcol <= endcol
    let firstcol = startcol
    let lastcol = endcol
  else
    let firstcol = endcol
    let lastcol = startcol
  endif
  call SortR(a:firstline, a:lastline, firstcol, lastcol, a:wnum, a:order, a:cmp)
  normal gv
endfunction

"sort lines recursively
function SortR(start, end, first, last, wnum, order, cmp)
  if a:start >= a:end
    return
  endif
  let partition = a:start - 1
  let middle = partition
  let partstr2 = Words2(getline((a:start + a:end) / 2), a:first, a:last, a:wnum)
  let i = a:start
  while i <= a:end
    let str = getline(i)
    let partstr = Words2(str, a:first, a:last, a:wnum)
    if a:order == "r"
      execute "let result = ".a:cmp."(partstr2, partstr)"
    else
      execute "let result = ".a:cmp."(partstr, partstr2)"
    endif
    if result <= 0
      "swap i before partition
      let partition = partition + 1
      if result == 0
        let middle = partition
      endif
      if i != partition
        let str2 = getline(partition)
        call setline(i, str2)
        call setline(partition, str)
      endif
    endif
    let i = i + 1
  endwhile
  "make sure middle element at end of partition
  if middle != partition
    let str = getline(middle)
    let str2 = getline(partition)
    call setline(middle, str2)
    call setline(partition, str)
  endif
  call SortR(a:start, partition - 1, a:first, a:last, a:wnum, a:order, a:cmp)
  call SortR(partition + 1, a:end, a:first, a:last, a:wnum, a:order, a:cmp)
endfunction

"determine compare strings
function Words2(line, first, last, wnum)
  if a:wnum == "v"
    return strpart(a:line, a:first - 1, a:last - a:first + 1)
  elseif a:wnum > 1
    return strpart(a:line, matchend(a:line, "\\s*\\(\\S*\\s*\\)\\{".(a:wnum - 1)."}"))
  elseif a:wnum == 1
    return strpart(a:line, matchend(a:line, "\\s*"))
  elseif a:wnum < 0
    return matchstr(a:line, "\\(\\S*\\s*\\)\\{".(-a:wnum)."}$")
  else
    return a:line
  endif
endfunction

"compare two strings
function Strcmp(str1, str2)
  if a:str1 < a:str2
    return -1
  elseif a:str1 > a:str2
    return 1
  else
    return 0
  endif
endfunction

"prompt user for settings
function Prompt(str, ...)
  let default = a:0 ? a:1 : ""
  if a:str == "0"
    let str = "Sort by which word [(0)whole line (<0)count from right (v)isual]? "
  elseif a:str == "1"
    let str = "Order [(f)orward (r)everse]? "
  endif
  execute "let ret = input(\"".str."\", \"".default."\")"
  return ret
endfunction

    '<,'>!sort -n

### dicas úteis
* referência: http://www.dicas-l.com.br/dicas-l/19970430.php
O comando

  :global /^Capítulo [0-9]$/ . w >> index.txt

irá varrer todo o arquivo e gravar no arquivo index.txt todas as
linhas que contenham a string "Capítulo" seguida de um espaço em
branco e um algarismo variando de 0 a 9.

O comando

  :global /^Capítulo [0-9]$/ . copy $

irá efetuar a mesma pesquisa, porém as linhas que se encaixarem no
argumento de pesquisa serão copiadas para o final do arquivo.

### Vim quickref
http://vim.sourceforge.net/htmldoc/quickref.html

### vimrc
http://aurelio.net/vim/vimrc-ivan.txt

### Vim grep
fonte: http://vim.wikia.com/wiki/Find_in_files_within_Vim

### Setando o vim no bash
coloque no seu .bashrc

  set -o vi

let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0

### Editando via puty com cores
fonte: http://vim.wikia.com/wiki/Using_vim_color_schemes_with_Putty

### Função para buscar arquivos
fonte: http://www.vim.org/tips/tip.php?tip_id=1432
Para usar faça:

   :Find nome

function! Find(name)
  let l:_name = substitute(a:name, "\\s", "*", "g")
  let l:list=system("find . -iname '*".l:_name."*' -not -name \"*.class\" -and -not -name \"*.swp\" | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif

  if l:num != 1
    echo l:list
    let l:input=input("Which ? (<enter>=nothing)\n")

    if strlen(l:input)==0
      return
    endif

    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif

    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif

    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif

  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction

command! -nargs=1 Find :call Find("<args>")

### Verbose Regular Expressions for Vim
fonte: http://vim.wikia.com/wiki/Verbose_Regular_Expressions_for_Vim
Many regular expression engines have support for verbose regular expressions, but unfortunately Vim seems to lack built in support. In order to simulate the effect, you can build a regular expression gradually:

let s:VREM  = '^'                   " Start of line
let s:VREM .= '\s*'                 " This gets rid of leading spaces
let s:VREM .= '\('                  " Start OPTION groups
let s:VREM .= '\<else\s\+if\ze\s*(' " Option: else if (
let s:VREM .= '\|'                  " Next OPTION: else
let s:VREM .= '\<else\>'            " Option: else
let s:VREM .= '\)'                  " End OPTION groups

" Give it a meaningful name
let s:VerboseRegularExpressionMatcher = s:VREM

" Use it:
let result = matchstr("    else if (xyz == 1)", s:VerboseRegularExpressionMatcher)

### Transformando arquivo rst em latex

Os arquivos fonte encontram-se em formato rest (rst) e para trocar

=================================
Capítulo 1: O caminho do programa
=================================

por

\chapter{O caminho do programa}
\label{cha:O caminho do programa}

Comecei usando uma abordagem descrita no próprio livro:
Começe de um algorítimo mais simples e vá incrementando até chegar ao ponto desejado, no vim fiz primeiro uma busca.

/=\+\n\D\+\d:\s\+.*\n=\+

discecando   /=\+   .........  uma igualdade ou mais
           \n  ............  seguido de uma quebra de linha
           \D\+............  seguido de um "não dígito" ou mais
           \d\+ ...........  seguido de um dígito ou mias
           :   ............  seguido de dois pontos
           \s\+  ..........  seguido de um espaço ou mais
           .*  ............  seguido de qualquer coisa
           \n  ............  seguido de uma quebra de linha
           =\+  ...........  seguido de uma igualdade ou mais

Esse grpo ".*" (qualquer coisa agora vai para dentro de parênteses)

/=\+\n\D\+\d:\s\+\(.*\)\n=\+

Para o gran finale (referenciar numa substituição a última busca "//")//

//:%s//\\chapter{\1}\r\\label{\1}/g//

//Agora vou dar a ordem para executar em todos os arquivos//

//:bufdo :%s//\\chapter{\1}\r\\label{cha:\1}/g//

//Para as imagens faça://

//:bufdo :%s//\\includegraphics[scale=0.7]{.img\/\1}/g//

//para salvar tudo://

//:wall

Localizar trechos ````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````palavra````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
 /\`\`[^`]*\`\`
e substituir por {\em{palavra}}
:%s/\`\`\([^`]*\)\`\`/{\\em{\1}}/g//

###//saltos no vim//

//Vim stores a list of your movements throughout a file, whether they're associated with marks or not. To see a full list of jumps within a file, use :jumps. Here's a short sample:

:jumps
 jump line  col file/text
    3     1    0 /**
    2   608    0 }
    1    33    0 #include "log.h"
>

Vim lists the jump number, line number, and column of the last location of the cursor for each jump, as well as a bit of text to help provide context. You can cycle between jump locations using the Ctrl-o and Ctrl-i keybindings. Ctrl-o will move you to the last jump, then the next-to-last, and so forth. In this instance, if you use Ctrl-o, you'd be taken to line 33, then line 608, then 1. To move forwards through the jump history, use Ctrl-i -- which would take you from line 1 (jump 3) to line 608, then line 33.

"Configurações de impressão
if v:version >= 601
    set printoptions=paper:A4,number:y,portrait:y
    set printheader=%<%f%=Sergio\ Araújo\ (voyeg3r at google mail)\ %N
endif

" Abreviação para inserir o nome do arquivo
iab filename <c-r>=expand('%:t')<cr>//

//Os atalhos abaixo funcionam nos comandos do vim ":"//

//"  :his /  ...... mostra o histórico de buscas
"   " atalhos da linha de comando
"  ^u  ....... apaga para esquerda
"  ^w  ....... apaga a palavra antes do cursor
"  ^b  ....... begin of line
"  ^e  ....... end of line
"  ^c  ....... sai da linha de comando sem executar
"  ^d  ....... completa o comando
"  :history / 6,12//

###//Saltos//

  //gg .............. salta para a primeira linha do arquivo
  G  .............. salta para a última linha do arquivo
100gg ............. salta para a linha 100
  '' .............. salta para a última posição
  `. .............. salta para a posição da última alteração
  L ............... salta para a ultima linha da tela
  H ..............  salta para a primeira linha da tela
  M ..............  salta para o meio da janela
  * ............... salta para próxima ocorrência da palavra sob o cursor
  # ............... salta para a ocorrência anterior da palavra sob o cursor
  % ............... localiza o próximo ) } ]   "encontra fechamentos e aberturas"
  g, .............. salta uma alteração mais recente (avança na lista de alterações)
  g; .............. salta uma alteração anterior (retrocede na lista de alterações)//

###//setando o tipo de arquivo//

//:setf python//

//[[snippets]]//

###//Placeholders//

//nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <c-j> <esc>/<+.\{-1,}+><cr>c/+>/e<cr>
match Todo /<+.\++>/
iabbrev <buffer> for( for (x=0;x<var;x++){<cr><cr>}

" outro exemplo
" File Templates
" --------------
"  ^J jumps to the next marker
function! LoadFileTemplate()
  silent! 0r ~/.vim/templates/%:e.tmpl
  syn match vimTemplateMarker "<+.\++>" containedin=ALL
  hi vimTemplateMarker guifg=#67a42c guibg=#112300 gui=bold
endfunction
function! JumpToNextPlaceholder()
  let old_query = getreg('/')
  echo search("<+.\\++>")
  exec "norm! c/+>/e\<CR>"
  call setreg('/', old_query)
endfunction
autocmd BufNewFile * :call LoadFileTemplate()
nnoremap <C-J> :call JumpToNextPlaceholder()<CR>a
inoremap <C-J> <ESC>:call JumpToNextPlaceholder()<CR>a//

//Outra dica://

//:imap ( () <+jump+><esc>F)i//

###//Como mudar o editor padrão do ubuntu//
//Para alterar o editor padrão (default),//

//sudo update-alternatives --config editor//

//Você verá o seguinte diálogo://

//There are 3 alternatives which provide `editor'.

Selection Alternative
----------------------------------
1 /usr/bin/vim
2 /bin/ed
*+ 3 /bin/nano//

//Press enter to keep the default[*], or type selection number:
Pressione 1 para o Vim.//
###//Folders//
//Folderes são dobras, o vim oculta algumas linhas e mostra algo como//

   //+-10 linhas ------------------//

//zr //unfold one level
zR //unfold all levels
zm //fold one level
zM //fold all levels//

//veja [[http://www.vim.org/htmldoc/fold.html| documentação completa sobre o tema]]//

###//Uma barra de status melhor//
//fonte: http://www.linux.com/feature/120126//

//////" Acertando a barra de status
set laststatus=2 "Sempre mostrando a linha de status
:set statusline=%F%m%r%h%w\ [FORMAT=%{&amp;ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]//////

###//Dicas do histórico//

  //////:his  / 6,12
  " pesquisa o histórico de buscas de 6 a 12//////

###//Snippets//

//////" snippet para o laço for
Iabbr for for <{var}> in <{list}>:<cr><{}>//////

//O vim é um super editor, por enquanto esta página é só um rascunho
mas em pouco tempo conterá muito conteúdo interessante.//

### Indentando

>> .......... indenta a linha atual
>>ip ......... indenta o parágrafo atual
^t .......... indenta em "modo insert"
^d .......... remove indentação em "modo insert"
== .......... indenta linha atual em modo normal
= ........... indenta linha atual em modo visual

###//Repetindo a última substituição//

 //////&//////

###//Procurando padrões e inserindo em outro arquivo://

  //////:'a,'b/^Padrão/ . w! >> ~/tmp/busca.txt//////

###//Definindo o vim como editor padrão//
//coloque dentro do seu arquivo .bashrc//

  //////export EDITOR=vim
  export VISUAL=vim//////

###//Buscas especiais//

  ///////\c  ............ busca sem considerar maiúsculas e minúsculas
  //   ............ repete a última busca

  /teste/+3 ....... "posisiona o cursor três linhas após a ocorrência da palavra 'teste'
  /\%x69    .......  localiza a letra 'i' que em hexadecimal tem valor 069
  /<[^>]*>  .......  casa com todas as tags html
  ^\d\+\.\d\+\(.*)   localiza seções tipo  "10.1 introdução"//////

###//vim com python//

//**SmartIndent**
Veja estas referências.//
* //[[http://www.redbrick.dcu.ie/%7Enoel/python.html|http://www.redbrick.dcu.ie/~noel/python.html]]//
* //[[http://www.vex.net/%7Ex/python_and_vim.html|http://www.vex.net/~x/python_and_vim.html]]//
//The following line sets the smartindent mode for *.py files. It means that after typing lines which start with any of the keywords in the list (ie. def, class, if, etc) the next line will automatically indent itself to the next level of indentation://

//////" python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

let python_highlight_numbers=1
let python_highlight_builtins=1
let python_highlight_exceptions=1
let python_highlight_space_errors=1
autocmd FileType python filetype indent on
"autocmd FileType python set textwidth=79//////

//Another approach is to create a key mapping which detects when you type a colon (:) followed by a RETURN (<cr>), and adds a <tab> keypress to the end.//

//////im :<cr> :<cr><tab>//////

===//Complementação com tab//===
//primeiro crie um arquivo chamado .pythonrc no home do usuario, de permissão de execução, e coloque os seguinte://

////import readline
import rlcompleter
readline.parse_and_bind('tab: complete')////

//agora edite o arquivo// .bashrc// e edicone no final do arquivo o seguinte:

PYTHONSTARTUP="$HOME/.pythonrc"
export PYTHONSTARTUP

### Modo de destaque no python

" Auto open/close Tlist
"let Tlist_Auto_Open = 1
let Tlist_Exit_OnlyWindow = 1

" python
let python_highlight_all = 1

### Ocultando comentários

" F11 para esconder/mostrar comentários
"
fu! CommOnOff()
  if !exists('g:hiddcomm')
    let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
  else
    unlet g:hiddcomm | hi Comment ctermfg=cyan  guifg=cyan term=bold
  endif
endfu
map <f11> :call CommOnOff()<cr>

### Problemas e soluções

fonte: http://groups.yahoo.com/group/vi-br/message/853
Problema:
Essa deve ser uma pergunta comum.

Suponha o seguinte conteúdo de arquivo:

... // várias linhas
texto1000texto    // linha i
texto1000texto    // linha i+1
texto1000texto    // linha i+2
texto1000texto    // linha i+3
texto1000texto    // linha i+4
... // várias linhas

Gostaria de um comando que mudasse para

... // várias linhas
texto1001texto    // linha i
texto1002texto    // linha i+1
texto1003texto    // linha i+2
texto1004texto    // linha i+3
texto1005texto    // linha i+4
... // várias linhas

ou seja, somasse 1 a cada um dos números entre os textos especificando como range as linhas i,i+4

:10,20! awk 'BEGIN{i=1}{if (match($0, "[0-9]+")) print "texto"
(substr($0, RSTART, RLENGTH) + i++) "texto"}'

Mas muitos sistemas nao tem awk, e logo a melhor solucao mesmo eh usar o vim:

:let i=1 | 10,20 g/texto\d\+texto/s/\d\+/\=submatch(0)+i/ | let i=i+1

Obs: 10,20 é o intervalo, ou seja, da linha 10 até a linha 20

### Procurando dígitos pelo valor decimal ou hexadecimal no vim

Para quê eu iria querer fazer isto?
Bom, de repente você recebeu um arquivo 'txt' de um amigo qua ainda usa windows
e quer apagar os ^M do final das linhas. essa é apenas uma situação possível

   /\%xvalor  ...................... valor hexadecimal
   /\%dvalor ........................  valor decimal

No vim fazemos assim para localizar ^M de arquivos DOS/Windows

  /\%x0D  ............ o valor 0D corresponde a ^M

Mas para remover fazermos assim:

  :%s/\%x0D//g

E para fazer o mesmo em um conjunto de arquivos fazemos:

  :bufdo :%s/\%x0D//g | :wall
  :qall

### vim tips
Wiki com dicas sobre o vim: http://vim.wikia.com/wiki/Main_Page

http://www.vim.org/tips/tip.php?tip_id=1483
http://vim.wikia.com/wiki/VimTip1483

autocmd BufWrite  *  call SetStatusLine()
autocmd BufRead   *  call SetStatusLine()

function! SetStatusLine()
    set statusline=[%n]\ %f\ %(\ \ (%M%R%H)%)\ \ \ %=\t%{ShowTab()}\ \ \ Modified:\ %{Time()}\ \ [%3l:%3L,%2c]\ %p%%\
endfunction

function! Time()
    return strftime("%c", getftime(bufname("%")))
endfunction

### Remover duas ou mais linhas vazias
entre parágrafos diminuindo para uma só linha vazia.

:%s/\(^\n\{2,}\)/\r/g

### Inserindo a ultima busca, comando ou nome do arquivo no texto

<c-r>/

Para inserir o nome do arquivo faça:
<c-r>%

Para inserir o último comando no texto:
<c-r>:

Para repetir exatamente a última inserção
<c-a>

Para complementar a inseração de linhas
<c-x><c-l>

Para complementar com palavras
<c-x><c-p>

Para complementar à partir do dicionário
<c-x><c-k>

Para repetir linha acima caractere por caracte
<c-y>

Para repetir linha abaixo caractere por caractere
<c-e>

### Para tornar maiúsculo apenas um trecho faça

:5,25 normal gUU

### Contando ocorrências de um padrão
fonte: http://aurelio.net/doc/vim/vim-dicas-ivan.html

:let i=0|%g/{padrao}/let i=i+1
:echo i

### Abrindo o último arquivo editado

'0

### Python

"auto-complete (usando o pacote vim-python)
set omnifunc=pythoncomplete#Complete

"destacar caracteres TAB para poder vê-los
syntax match Special "\t"
highlight Special ctermfg=DarkBlue ctermbg=White
</c-e></c-y></c-k></c-x></c-p></c-x></c-l>

### LaTeX
" se você já tem alguma função para fechar parênteses
" apague no local apropriado
"
" Fechamento automático de parênteses
imap { {}<left>
imap ( ()<left>
imap [ []<left>

"   ,rl = run latex (on current file)
    map ,rl :!latex %

"Insert environments while you type:
imap ^e {\em}i
imap ^b {\bf}i
imap ^t {\tt}i
imap ^v \verb++i

map! ]i \item
map! ]bi \begin{itemize}\item
map! ]ei \end{itemize}
map! ]be \begin{enumerate}\item
map! ]ee \end{enumerate}
map! ]bd \begin{description}\item[
map! ]ed \end{description}
map! ]bc \begin{center}
map! ]ec \end{center}
map! [be{\samepage\begin{eqnarray}
map! [ee\end{eqnarray}}
map! ]s1 \section{
map! ]s2 \subsection{
map! ]s3 \subsubsection{
map! ]p1 \paragraph{
map! ]p2 \subparagraph{
map! ]f \frac{
map! ]o \overline{
map! ]u \underline{
map! ;em bi{\em lea}i

" From ~/_vimrc  vim:filetype=vim:
" AUTHOR:   GPL(C) Mohsin Ahmed, http://www.cs.albany.edu/~mosh

" Registers:
"  :disp        Show yank regs
"  :reg         registers, %=filename,
"  v<move>'xy   Yank region into register x.
"  "a5yy <move> "A5yy -- yank 5 lines to reg a then append further 5.
"  iC-rx        Inserts register x
"  iC-r%        Insert current filename (also #).
"   <c-w>       Pull cword to a command line or search
"   -           pull small register
"   [0-9a-z]    pull named registers
"   :           Last comand line into text.
"   /           Last search string
"  "*yy         Line to Clipboard is register *, paste with S-Insert.
"  "*p          clipboard (reg *) paste, also on S-Insert.
"  :s/str/<c-r>x/g  Register to cmdline
"  :let @a=@_              : clear register a
"  :let @*=@a              : copy register a to paste buffer
"  :map   <f11> "qyy:let @q=@q."zzz"

" Jumps Marks:
"  :jumps       List jump in this file,
"  ^I ^O        Jump to prev/next jumpers (list with :jumps).
"  :marks       Show marks; Use `[A-Z] Upcase char to goto other files.
"  ma           mark point with a, Use `a goto a.
"  ``           exchange-mark-and-point
"   *           find next word under-cursor.
"   #           find prev word under-cursor.
"  20%          Goto 20% of file from start.

" Buffers:
"  :ls :buffers list buffers.
"  :buf N       then goto buffer N.
"  :bdel        buffer delete

" Regions:
"    v          begin visual v-mode, region defined by marks < and >.
"   ^V          begin visual-rectangle vr-mode, mark rectangle.
"   gv          reselect visual-region.
"      o        exchange mark and point.
"      d        delete region.
"      v        switch vr-mode to v-mode.
"     ^V        switch v-mode  to vr-mode.
"      J        join region.
"      IStr     String rect

"   ^T ^D       indent/unindent in insert mode.
"   gqap        format this para, or gq[cursor move], eg. gq}, gqG, gq``
"   vGgq        format to end of buffer
"   {Visual}gq  format visual region
"   ^E/^Y       for scrolling up/down.
"   z<cr> zz z- Scroll to top/center/bot (without changing cursor pos).

" Automation:   macros and scripting.
"   qx .. q     Record actions to macro register x.
"   @x          Replay macro register x. (now on zx and F2='replay macro x').
"   Edit x      'xp (paste register x), Edit macro, 'xdd (macro back to register x).
"  $ vim -o file1 file2        -- open into a split
"  $ vim -c "/main" file.c
"  $ ls | gvim -               -- edit the pipe!
"  $ vim -c "%s/old/new/ge | set ff=dos" makefile
"  $ vim -c "argdo %s/old/new/ge | update" *.c
"  $ vim -w "script.vim" file1.c # record script of keystrokes.
"  $ vim -s "script.vim" file2.c # replay script.

"  K -- Runs `$key_word_program word_under_cursor`.
"  :mkvimrc/mkexrc -- Make/Write options to file.
"  :scriptnames    -- list scripts loaded.

" Windows:       See windows.txt
"    :buffers        :split          :new file
"    ^W s  Split     ^W q  Quit      ^W j  Down Win  ^W t  Top Win
"    ^W o  Only      ^W c  Close     ^W k  Up Win    ^W b  Bot Win
"    ^W n  New                       ^W w  Other Win ^W p  Prev Win
"    ^W f    New Win find file under-cursor.
"    ^W ]    New Win find tag  under-cursor.
"    ^W g ]  New Win :tselect ..
"    vim -o files Open separate window for each file.

" C PROGRAMMING: See tips.txt  index.txt
"   gd          goto local  var defn of id under-cursor.
"   gD          goto global var Defn of id under-cursor.
"   gf          goto include file under-cursor, eg #include <stdio.h> 'gf'.
"   g]          choose from menu of matching tags for id under cursor.
"   :bdel       go (b)ack original file, after 'gf'.
"   [i          TYPEDEF word under-cursor.
"   [I          List grep(id under-cursor, current file).
"   ]I          List grep(id under-cursor, ,.$ current file).
"   [d          find #define of id under-cursor in file and incs.
"  :checkpath   verify inc files present.
"  :cl          List errors,
"               vim -q error.txt, use :cn (next err), :cl (list err).
"   [/ ]/       goto prev/next comment /* */
"   [# ]#       goto prev/next PreProc #ifdef/#else/..
"   [(,]),[{,]} goto prev/next umatched paren/brace. C-Left/Right.
"   99[{  99]}  prev/next func, finds the start/end of the current function,
"               even when {} are not in the first column.
"   :ce,:ri,:le center, right,left justify.
"   C-x C-a     inc/dec ++,-- (octal/hex/number) number under-cursor, 0x0b.
"   ga          show ascii code of char under-cursor.
"   C-e/C-y     copy and insert char above/below cursor.

" Completion: see vim_diff.txt.
"   ^P/^N    dynamic completion.
"   ^X       completion menu.
"   ^K       keyword completion from dictionary.
"        ^X  menu of completion keys.
"        ^F  file names. eg. ~/.em^X^F(^N/^P to chose file name)acs.
"        ^K  words from $dictionary, eg. mos^X^K(^N/^P to chose)er.
"        ^D  definitions or macros.
"        ^I  words from included files.
"        ^L  whole lines.
"        ^]  words from the tags file.
"

" Color Xterm:   see options.txt
"   t_ti Restore screen,
"   http://www.clark.net/pub/dickey/xterm/xterm.faq.html
"   -r /usr/share/lib/terminfo/x/xtermc
"   for builtin function list see eval.txt

" Tags: see tagsearch.txt
"       ctags --file-tags=yes -R .  -o etags -e
"       ctags --file-tags=yes -R .
"   vim -t main, or :tag main
"   C-] goto tag <cword>
"   C-t return from tag.
"  See: tag, pop, ptag, tnext, tprev, tlist, tjump, tselect, tselect /, stjump
"

" MsDev:
"   See sendtovim.exe, keyboard map, copy to clip
"   Customize,tools,<pause>=gvim=arg:="+/$(CurText) +$(CurLine) $(FilePath)"
"     Implicit final <cr> hence the colon.
"    <pause>=vi=sendtovim:arg=":cd $(FileDir)<cr>:e $(FilePath)<cr>\
"       :$(CurLine)<cr>/$(CurText)<cr>$(CurCol)|:"
"    <c-pause>=vt=sendtovim:arg=":cd $(FileDir)<cr>:ta $(CurText)<cr>/$(CurText)"
"    <s-pause>=emacs.bat=emacs:arg=+$(CurLine) $(FilePath)
"     HKEY_CLASSES_ROOT\*\shell\Vim\command    gvim.exe "%1"
"   vim60: vc<pause>: c:\bin32\gvim.exe, +$(CurLine) -c "-/$(CurText)" "$(FilePath)";
"      vc<c-pause>: gvim.exe, -c ":ta $(CurText)" "$(FilePath)";
" Emacs: :emacs %  .. launches emacs on current file.

" Explorer:
"     see gui_w32.txt
"     HKEY_CLASSES_ROOT\*\shell\Vim            Edit with &amp;Vim

" FileType:
"   see man assoc ftype, init/vim-asoc.bat
"    sh assoc.ksh  .log vim
"    sh assoc.ksh  .txt vim
"    sh ftype.ksh -c Edit vim "gvim.exe \"%1\""
"   sh ftype.ksh -c Open vim "gvim.exe \"%1\""

" Abbrev:
" :imap xx yy "Comment not ok. Dont use common prefixes for xx, slows down input.
" <c-h> mapping can move over \n, while h can't.

" Time:
"   man co .. for many/ISO time formats, and man strftime for %Y...
"   Y=1999,m=08,d=22,H=24,M=60,Z=PDT,b=Aug,B=August,%a=Sun,%A=Sunday

" GrepFind:
"     :!grep <cword> *.* < err.log
"     vim -q err.log .. Quickfix mode
"     See clist cprev cnext clist
"
" Filter: double_qouting perl args will hang sh call to perl.exe
"  :1,$! perl -pe 's,(\w+)/,\"$1 \".length($1),gex' .. Dont ask.
"
" Gcc:
"     gcc  *.c 2<< errlog ; vim -q errlog
"     vim -q errlog
"      :copen
"      :source ~/vim/cnext.vim
"           :map <f3>  :cprev<cr>
"           :map <f4>  :cnext<cr>
"
" ===================================================================

" TIP. zf to visit current file in other window
"  map  zF    gf:sp<cr>:e#<cr><c-w>w:f<cr>
"  map  zf    <c-w>o<c-w>sgf<c-w>w

" TIP. misc
"   map  <c-k>m  :%s/<c-v><cr>\+$//  "Remove control-m .. USE <c-k>s"<cr>
"   map  <c-k>q  <esc>:mksession $PWD/session.vim! $PWD/session.vim<cr>:qa<cr>
"   map  <c-k>Q  <esc>:so $PWD/session.vim<cr>
"   map  <c-k>U  :%s,\(.*\),<a href="%5C1">\1</a><br>,gc "Convert URLs to HTML" <cr>

" TIP. Using Dictionary
"   imap <f8>      <esc>:!cat $DICT \|egrep -i "<cword>" <cr>
"   map  zd    :!egrep -i "^^<cword>" $WORDS<cr>
"   map  zd    :execute 'r !perl.exe -ne \"print  \\"/\^\\\b\\U<cword>\\E\\\b/\\";\" d:/x'<cr>
"   map  zd    :execute 'r !perl.exe -ne \"print if m/\\U<cword>\\E/;\" $DICT'<cr>
"   map  zd    :execute '/' . expand("<cword>")<cr>:sp $DICT<cr>n
"   map  zd    :execute 'r !perl.exe -ne \"print if m/"^"\\U<cword>\\E/;\" $DICT'<cr>
"   map  zD    :pclose<cr>
"   map  zd    :exe "silent pedit +/^" . toupper(expand("<cword>")) . " $DICT"<cr>

" TIP. zs to cd to dir mentioned in file.
"   map  zs    ma?^cd \S\+<cr>\
"           :execute getline(".")<cr>\
"           :echo "cwd()="getcwd()"  $PWD="$PWD<cr>`a

" TIP. One click file pickup with f5.
"       map  <f5>  ma?^cd \S\+<cr>\
"                 :execute getline(".")<cr>\
"                 :echo "cwd()="getcwd()"  $PWD="$PWD<cr>`agf\
"                 :sp #<cr>

" TIP. highlights virtual 8 columns and 80+ overshoot.
"       /\%8v\|\%16v\|\%24v\|\%32v\|\%40v\|\%48v\|\%56v\|\%64v\|\%72v\|\%80v..*

" TIP. list lines matching current line.
"      map  <a-*> :exe "g/^\M" . getline(".") . "$/"<cr>

" TIP. map  <a-n> Lnz<cr>  -- Search again from next page

" TIP. :execute send-to-vim.ksh <cfile> line? <cword><cr>

" TIP. 0"ay0  :g/<pattern>/y A --  Yank matching lines to reg 'a'

" TIP. Reverse file :g/^/m0

" TIP. Copy matching lines to eof :g/<pattern>/t$

" TIP. Upcase line -- gUU, tolower line -- guu

" TIP.
"   perl s//$reg/ vim:s/str/<c-r>x/g
"   perl s///e    vim:s/str/\=strftime("%c")/

" TIP.
"   output to file:   a,'b g/^Error/ . w >> errors.txt

" TIP. Operate command over multiple files:
"   :argdo %s/foo/bar/
"   :bufdo %s/foo/bar/
"   :windo %s/foo/bar/

" TIP.  gvim -c "/$1"  $(egrep -isl "$1" *) &amp; -- Edit all files having $1.
"       -i case, -s suppress-error, -l only filenames.

" TIP. Add menu entry
"  amenu  Mosh.Insert\ a\ VIM\ modeline <esc><esc>ggOvim:ff=unix ts=4 ss=4<cr>vim60:fdm=marker<esc>gg

" TIP. Save word under cursor to file
"   function! SaveWord()
"       normal yiw
"       exe ':!echo '.@0.' >> word.txt'
"   endfunction
"   map ,p :call SaveWord()

" TIP. toggle two words
"  :%s/\&lt;\(on\|off\)\>/\=strpart("offon", 3 * ("off" == submatch(0)), 3)/g

"Junk from ~/_vimrc

" set  titlestring=%n,File=%R%m%&lt;%F,%=Line=%l/%L=%P,Column=%v,Point=%o,Char=%b=0x%B
" set  titlestring=%n.%F,%f,%=Point=%o,Char=%b=0x%B
" set  titlelen=70

":au BufReadPost quickfile silent ":map <c-up> cprev<cr>:map <c-down> cnext<cr>"
"map <c-up>   cprev
"map <c-down> cnext

" File explorer switches ... Using emacs dired as vim60 loses dired buffer.
"  let g:explVertical=1
"  let g:explSplitRight=1
   let g:explDetailedList=1
   let g:explDateFormat="%Y-%b-%d %H:%M"

" set  errorformat=%f:%l:%m

" See options.txt, \"0 to not save registers.
" addr.txt has vim:ts=2:sw=2:ws:viminfo=:

"au FocusLost *   :let @* = @0
"au FocusLost *   :wv
"au FocusGained * :rv

" Keys: <kenter> and <k5> dont work in Console/GUI on NT.
" map <kplus>          :bnext<cr>
"imap <kplus>     <esc>:bnext<cr>
" map <kminus>         :close<cr>
"imap <kminus>    <esc>:close<cr>
" map <kmultiply>      <c-w>w
"imap <kmultiply> <esc><c-w>w

EOF

### Referências
* [[http://pt.wikibooks.org/wiki/Vim]]
* http://pyconbrasil.com.br/saiba-mais/edicoes-anteriores/pyconbrasil-2006/downloads/apresentacoes/archetypes-o-bagulho-e-bom/vimrc/view
* vim faq: [[http://www.faqs.org/faqs/editor-faq/vim/]]
