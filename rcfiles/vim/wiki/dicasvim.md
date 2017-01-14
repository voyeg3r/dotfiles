# Manual de dicas do vim

```
File:		 DicasVim.md
Created:     Sáb 06/Nov/2010 hs 18:10
Last Change: sex 13 jan 2017 14:16:34 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

See also: [Regex](Regex) page

### Editing complex commands and search

When you have complex commands and searches you can open for each of theses modes a special window

    Ctrl-f in command mode opens 'command line window'
    q: also open command line window
    q/ open search command window

    /ctrl-p inserts my last search

### Inserting filename

The following commands insert lines consisting of the full path of the current
and alternate files into the buffer:

``` vim
:put =expand('%:p')
:put =expand('#:p')
```
**using ultisnips**
``` vim
snippet filename "insert filename" w
`!p snip.rv = snip.fn`
endsnippet
```

I also have this line on my `~/.vimrc`, it allows me to insert the filename easily

``` vim
iab fname <c-r>=expand("%:p")<cr>
```


### Tips on searching
[Read more here](https://www.linux.com/learn/vim-tips-basics-search-and-replace)

``` markdown
/finding/e ...... puts the cursor at the end
/finding/b ...... puts the cursor at the beginning 'also s'

/string/e-3 will place the cursor on the third character from the last character of the matched string.
```

### Função para converter wiki para markdown
[Source: stackoverflow](http://stackoverflow.com/a/3024430/2571881)

``` vim
" :bufdo execute "normal @a" | write
fun! FuncWikiToMd()
    %s/\v^\={1,3}([^\=]+)\={1,3}/### \1/ge
    %s/\[\[code format.*/``` sh/ge
    %s/\[\[code\]\]/```/ge
endfun
command! -nargs=0 W2MD :call FuncWikiToMd()
```

### Getting rid of '-' on html links
[Source: stackoverflow](http://stackoverflow.com/questions/41529264/)

The `\%V \%V` will make the search pattern work over
only in selected area.

    <a href="https://example.com/hello world hi">hello-world-hi</a>

    :s/\%V-\%V/ /g

    :s/\%V\s\%V/-/g

    "ANOTHER EXAMPLE WITH \%V

    Transform this:
    printf(text goes her);

    into this:
    printf("text goes her");

    s/\%V\(.*\)\%V./"\1"/g

OBS: the \%V option only selects up to the cursor, leavin
one char out of the substituition, that's way we are using
a dot '.' in the searh, to add a extra char.

### Tips about ultisnips
source: http://vimcasts.org/episodes/ultisnips-visual-placeholder/

If you wnat to overwrite a snippet definition just put
at the beginning of your file

    priority 1

### Editing your snippets quickly

    :UltiSnipsEdit

    In my case I have a vim map:

    nnoremap <leader>u :call UltiSnipsEdit<cr>

    As interpolações tem que estar dentro de crases
    ou backtickets in English

### Insere a data usando interpolação do vim
    !v strftime('%Y-%m-%d')

    !p  interpolação python

    !p snip.rv = "return value"
    t[1] --> tabstop 1

### Usando snippets espelho ou não

        snippet req "require a module" b
        let ${1:${VISUAL}} = require('${2:$1}');
        ${0}
        endsnippet

O snippet acima repete na posição 2 o valor da posição 1
e permite que o segundo possa ser alterado

Outro snippet com conceitos interessantes:

    snippet us "replace specials with underscores" w
    `!p
    import re
    snip.rv = re.sub("[^0-9a-zA-Z]", "_", snip.v.text)
    `
    endsnippet


### Remove parenthesis of current line

    %s/(\([^)]\+\))/\1/g

    ( ................... patenthesis
    \( .................. start group 1
    [^)] ................ denied (
    \+   ................ at least once
    \) .................. end group 1
    ) ................... close parenthesis


### Quickfix list manipulations and :cdo command

``` vim
copen
ccl
```

Um exemplo de fluxo de trabalho com o comando `:cdo`
Primeiro usar o grep para popular o quickfixlist

        grep arquivo

Abrir o quickfixlist pra ver se a busca casou

        :copen

Pra fechar o quickfixlist apenas :ccl

        :ccl

No meu caso adicionei uma linha no começo de todos os arquivos

        :cdo normal ggOthis is only a test^[

Depois eu apaguei a linha adicionada

        :cdo normal ggdd

Gravei todos os arquivos depois do teste

        :cdo write

Fechei  todos os arquivos

        :qall


### Links or worth clicking

    http://www.mileszs.com/vimlinks.html

### Vimgolf

Search vimgolf chalenges to vim users
ao instalar o vimgolf como recomenda o site digite

    gem list

    PATH=$PATH:/home/sergio/.gem/ruby/2.3.0/bin

See also [[vimbesttips]]

### Start vim with no plugins
source: Book practical vim
https://pragprog.com/book/dnvim2/practical-vim-second-edition

    vim -u NONE -N
    vim -u NONE -N fileyouwantopen

The -u NONE flag tells Vim not to source your vimrc on startup. That way, your
customizations won’t be applied and plugins will be disabled. When Vim starts
up without loading a vimrc file, it reverts to vi compatible mode, which causes
many useful features to be disabled. The -N flag prevents this by setting the
‘nocompatible’ option.


### Magic with expression register

    6 chairs, each costing $35, totals $

    A ............... start insert mode at the end of line
    Ctrl-r = ........ starts expression register (cursor at the bottom)
    6 * 35 <enter> .. inserts the result

### Viewing where maps are setted

``` vim
:verbose map

:redir! > vim_keys.txt
:silent verbose map
:redir END
```

### Reopen previous buffer in a new window

    Ctrl-w Ctrl-6

### Copy from one buffer to another

source: http://stackoverflow.com/questions/41259890/

I try to copy the lines 7,11 from buffer 2 to my buffer 3 without leaving
buffer 3. Is it possible to do that with a simple command?

Usually I go to B2, yank the lines come back to B3 and paste them. I will be
interest to do that using range but I do not succeed.

There is the getbufline() function that allows you to obtain lines from another
buffer. You can :put that into the current buffer via the expression register:

     :put =getbufline(2, 7, 11)

### Setting and getting position on vim

References: http://vi.stackexchange.com/questions/6208/
http://stackoverflow.com/questions/3922384/

``` vim
:call setpos('.',[0,6,10,0])

:let pos = getpos("'a")

:call setpos("'a", pos)

if  getpos("'a")[1] == 0
    mark a
else
    process calculate
endif

:exec "'a"

:ec getpos("'a")[1]  --> returns line number of mark 'a'

:put =getbufline(1,1)

o comand acima pega o buffer 1 linha 1 e cola na linha atual

ec expand(getline('.'))
o comando acima ecoa na tela a string da linha atual

let var = expand(getline('.'))

to search for lines equal to current line do this:

exec '/' . getline('.')

/<C-r>=getline('.')<CR>

Using a "register" on search

:exe '%s/' . @a . '/foo/g'
```

### How to knwo if vim has python support

    vim --version | grep python

### Insert a command rnnge easily
Reference: http://stackoverflow.com/questions/35693335/

``` vim
4:   equals to :.,.+3

for example if you want to save only the next three lines
you cand do this:

3:   then vim will show this:
:.,.+2  what means the current line "." plus the next two lines

and finally you type wq!

the entire line will be:

:.,.+2wq!
```

### Adjusting columns of text on vim

``` markdown
Stallman  Richard GNU 1953  USA
Wall  Larry   Perl  1954  USA
Moolenar  Bram  Vim 1961  Netherlands
Tridgell  Andrew  Samba  1967  Australia
Matsumoto  Yukihiro  Ruby  1965  Japan
Ritchie  Dennis  C  1941  USA
Thompson  Ken  Unix  1943  USA

Stallman   Richard   GNU    1953  USA
Wall       Larry     Perl   1954  USA
Moolenar   Bram      Vim    1961  Netherlands
Tridgell   Andrew    Samba  1967  Australia
Matsumoto  Yukihiro  Ruby   1965  Japan
Ritchie    Dennis    C      1941  USA
Thompson   Ken       Unix   1943  USA
```

The command typed to perform the above change was:

    :'<,'>!column -t

to sort by surname just do this:

    :%!sort -k1

### Yank text object on multiple lines

 Let's say you have:

 ``` markdown
 - 'autoindent' is set by default
 - 'autoread' is set by default
 - 'backspace' defaults to "indent,eol,start"
 - 'backupdir' defaults to .,~/.local/share/nvim/backup (|xdg|)
 - 'complete' doesn't include "i"
 - 'directory' defaults to ~/.local/share/nvim/swap// (|xdg|), auto-created
 ```

And you want to get the names at the beginning like 'autoindent' and grab them
into a register 'z'

you cand do

``` vim
:%norm f'"Zya'

and to paste it into a file you can do:

:put Z

To make it available outside of Vim you can do:

:let @+ = @z

if your register z is not clean you can clear it by doing

qzq
```

### Inserting ttyrecordings at stackexchange

[![asciicast](https://asciinema.org/a/14.png)](https://asciinema.org/a/14) https://asciinema.org/docs/embedding

### Avoiding error messages on vim substituitions

``` vim
:%s/\s\+$//e
:silent! %s/\s\+$//
```

### Clipboard manipulation
[souce stackoverflow](http://stackoverflow.com/a/11489440/2571881)

Faster way to paste data into vim than with paste mode? When I try to paste
hundreds of lines or more into Vim, even in paste mode, it takes much longer
(10 times or more?)

If your Vim is compiled with clipboard support

``` vim
:echo has('clipboard') returns 1

```
you can simply use "+p or "*p

On X11 systems both registers can be used. See `:help x11-selection` for more
details, but basically the `"*` is analogous to X11's PRIMARY selection (which
usually copies things you select with the mouse and pastes with the middle
mouse button) and `"+` is analogous to X11's CLIPBOARD selection (which is the
clipboard proper).

In order to preserve indentation during paste you could use <c-r><c-p>* or
<cr>c-p>+ see more at `:help i_CTRL-R_CTRL-P`

### Como criar um diário no vim usando o vimwiki

source: http://stackoverflow.com/questions/40414720/

    vim +VimwikiMakeDiaryNote

### Select yanked and pasted text

     gv ............ reselects last visual selection

 in order to select previous pasted text put this in your .vimrc

 " select last paste in visual mode
 nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

 to select the same ammount of lines for example
 use 1v

### Non-greedy search on vim

    /abc\_.\{-}def

Finds abc followed by any characters or newlines (as few as possible) then def.
Finds abcdef or abc followed by any characters then def.

### Changing modes on ctrl-p

   just press Ctrl-f or Ctrl-b

### Fixing subtitles with vim

My problem: subtitles whithout space like this;

``` markdown
133
00:06:36,398 --> 00:06:37,398
Com licença.
134
00:06:37,910 --> 00:06:39,538
Me explique o
sistema organizacional
```

The solution

``` vim
\v([^0-9]$\n)([0-9]+)
:%s//\1\r\2/g
```

References: http://vim.wikia.com/wiki/Search_across_multiple_lines

### Appending registers with global command

    :g/TODO/yank A

if you have a function like:

``` vim
if (isFoo)
    bar();
```

and want something like:

    if (isfoo) { bar(); }

    you can do:

    :g/if/normal A {^v^cJA}

this is a normal mode move being applied to lines matching an specific pattern.
We are opening a curly brackets in the end of the line (A {), getting back to
normal mode (ctrl+v ctrl+c or ctrl+v esc), bringing up the line below it (J)
and adding the closing curly brackets (A })

If you are wondering, the ctrl+v allows us to type a non-digit literally in
command line (in our case the ESC or Ctrl+C).


References: http://vim.wikia.com/wiki/Search_across_multiple_lines

            one two
            three

            (one) (two)
            (three)

       temos que usar

            <c-r><c-o>"

### Command line tricks

    :9 copy 13

    copia a linha 9 para a linha 13

    :9t16

    does the same faster

    :[range]copy {address}

    :9t.

    Usando relative numbers

    :-7t.

    command 	action
    :9t. 	    copy line 9 placing a duplicate below the current line
    :t5 	    copy the current line placing a duplicate below the line 5 (and moving the cursor)
    :-7t. 	    copy the line 7 before the current cursor position placing a duplicate below the current line
    :+4t. 	    copy the line 4 after the current cursor position placing a duplicate below the current line
    :9,11t. 	copy the lines 9 to 11 placing the duplicate lines below the current cursor position
    :-5t.       copy the line 5 rows above to the current line

### Formating text on vim

    gwip .... formats paragraph and restores cursor position

### How repeat last command in vim

    @:

Which means "@" register, : command

    @@  --> repeat last register easily

Following the same logic you can repeat last search by pressing @/ or just //

    Repeating the last substituition using &
    Repeat last substituition over whole file g&

### Using submatch in vim search

Supose you have these lines:

``` html
<h2>Heading number 1</h2>
<h3>Number 2 heading</h3>
<h4>Another heading</h4>
```

" highlight only digits inside html tags

        \v<\/?h\zs\d\ze

" promote each digit matched in the above search

        :%s//\=submatch(0)-1/g

### Jumping to edit positions and insert position

``` markdown
gi ................. start insert mode at the latest insert position
g; ................. go to the position of the older edit positon
g, ................. go to the previous change position

Ctrl-o ............. jumplist go previous
Ctrl-i ............. go forward in the jumplist
```

### Registros

Registro de expressões

``` markdown
21 * 12  =
12 * 12  =
156 / 12 =
35 * 19  =
```
nnoremap <leader>q 0yt= A<C-r>=<C-r>"<CR><Esc>

Para o trecho acima usamos

       yt=  .......... copia até o igual mas não incluido
       A ............. entra em modo insert no final da linha
       <c-r> ......... inicia o registro de expressões
       <c-r>"......... cola o texto copiado dentro do registro

``` vim
:put =sqrt(81)   "inserts result in a new line

:h function-list

:put =system('ruby fake-creds.rb')
:read! ruby fake-credentials.rb
:h :r!
```

### Writing vim functions

    :put =system('echo $RANDOM')

    :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

The above map can change sections like this:

``` markdown
Topic One
=========
This is some text about topic one.
It has multiple paragraphs.
Topic Two
=========

```
``` vim
:onoremap ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>
```

Try it by putting your cursor in a section’s text and typing cah .
This time Vim will delete not only the heading’s text but also the
line of equal signs that denotes a heading. You can think of this
movement as “around this section’s heading”.

### Neovim

O problema de instalar o neovim no arch são as dependências
mas é fácil de resolver, basta rodar esta função:

``` sh
installneovim (){
    yaourt -S libtermkey-bzr
    yaourt -S libvterm-git-neovim
    yaourt -S unibilium
    yaourt -S neovim-git
    yankrt -S lua51-messagepack
    } && installneovim
```

### Dica sobre como debugar vim script

    :echom 'Cria uma saida permanente de echo'

  visivel com o comando

    :messages

### Gerando os helptag para navegar na ajuda

http://stackoverflow.com/questions/4180590/

    cd <plugindir>
    vim -c "helptags doc/"

se usa o plugin pathogen coloque no .vimrc

``` vim
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
```

### Configuração do airline
Uma barra de status mais bacana para o vim
https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation

### Corretor ortográfico no vim

Corretor ortográfico para VIM
Standard

Você usa VIM para criação de textos (LaTeX ou afins)? Sempre sentiu falta de um
corretor ortográfico? Seus problemas se acabaram!!!

success_vim-273x300
Preparando ambiente:

# Cd ~ ; mkdir corretor ; cd corretor
Baixando a base de palavras:

# Wget http://extensions.libreoffice.org/extension-center/vero-verificador-ortografico-e-hifenizador-em-portugues-do-brasil/pscreleasefolder.2012-01-04.1563120832/2.1.2/vero_pt_br_v212aoc.oxt

# Unzip -x vero_pt_br_v212aoc.oxt
Aplicando no vim

Acesse o vim com o comando abaixo:

# Vim

No vim digite:

:mkspell pt pt_BR

Obs: Pode demorar um pouco e dará alguns erros de arquivos duplicados, ok?

# Cp pt.utf-8.spl /usr/share/vim/vim*/spell/
Usando o corretor no vim

Dentro do vim execute o seguinte comando:

set spell spelllang=pt,en

Caso queira que o corretor seja habilitado automaticamente sempre que acessar o vim:

# Echo ‘set spell spelllang=pt,en’ >> ~/.vimrc

### Conertendo o formato de arquivo de Windows para Linux

   :set ff=unix

   Para inserir  use o atalho Ctrl-v Ctrl-m no modo [[insert]]

### Colocando o nome do arquivo no proprio

      :put =expand('%:p')

Para somente exibir o full name do arquivo corrente faça:

     1 Ctrl-g   (em modo normal)

### Como limpar os cartões exportados do anki

``` vim
""Primeiro remover as tags html
:%s,<[^>]*>,,g
```

 Tive que exportar meu deck do anki para fazer um backup
 e queria apenas os textos dos cartões (decks), daí me deparei
 com um problema como apagar as tags associadas ao som?

 A solução começa testando este padrão de busca

		\[sound:[^]]*]

		Localizar:

		\[  ............. um colchete de abertura literal
		sound: .......... a palavra sound seguida de dois pontos
		[^]]*] .......... uma lista negada que pega tudo dentro dos colchetes em qualquer quantidade

### Como apagar tags do tipo </font*> no vim

Toda vez que for fazer uma ação de substituição complexa no
vim recomendamos primeiro fazer uma busca incremental pela ocorrência
a ser substituida ou apagada.

Primeiro testamos a busca com o comando abaixo
lembrando que a opção 'hlsearch' ou seleção incremental
da busca estando ativada nos ajuda consideravelmente
no nosso teste de busca

    <\/\?font[^>]*>

A expressão regular acima apaga a tag <font*> ou </font*>
de documentos quaisquer, o asterisco representa qualquer caractere
no intervalo entre 'font' e o fechamento da tag

Explicando:

    < .................. abertura 'literal' da tag
    \ .................. escape para a barra
    / .................. no caso de tag de fechamento tip </font*>
    \? ................. quantificador (no caso zero ou mais)
    font ............... palavra font literal

 EXPLICAÇÃO PARA O GRUPO  ---->  [^<]*

    [ .................. abertura de um grupo
    ^ .................. se aparece no começo do grupo nega tudo que nele aparece
    > .................. no caso estamos negando a fechamento de tag
    ] .................. fechamento do grupo
    * .................. quantificador para o grupo (zero ou mais)


		%s,</\?font[^>]*>,,g

Para evitar usar muitos escapes usamos no comando final (acima) um
delimitador de busca diferente, para não ter que escapar todas asa
barras, havendo somente um escape para \? que é o quantificador da
barra nornal, significa uma barra normal no começo ou não (zero ou 1 ocorrências)

Para quem não sabe no vim você pode fazer substituições do tipo:

    :%s,Windows,GNU/Linux,g

No caso acima o uso da virgula no lugar da barra é providencial
uma vez que a barra no nome GNU/Linux se confundiria com a barra
que delimita a busca ficando assim:

    :%subsitua,isto,poristo,g

### Opening two files side by side

      vim -O file1.txt [[file2.txt]]

### Setting utf-8 encoding

``` vim
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
```

### Reindenting whole file

		gg=G

### Move some line to current line

		:3m .

### Numbering operators

as you know 'u' refers to undo, then you can do this  3u or 3.

### How install new version of vim from source

``` sh
installvim () {
# Https://speakerdeck.com/mbrochh/vim-as-a-python-ide
#   On Ubuntu:
	sudo apt-get install gtk2-engines-pixbuf

	hg clone https://vim.googlecode.com/hg/ vim
	cd vim/src
	./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
	make && make install
	mkdir -p $HOME/bin
	cd $HOME/bin
	ln -s $HOME/opt/vim/bin/vim
	which vim
	vim --version
} && installvim
```

### How extract urls

``` vim
%s/.*\(http.*.mp3\).*/\1/g
g!/\.mp3/d
```


### How to append to clipboard?

    let @+ .= my_expression

### Repeating last subtituition

      &  ........... in normal mode

repetir ultima substituição  &

### Simplest way to show current colorschem

``` vim
:colo

this is the same

:ec g:colors_name
```

### Showing number of lines

besides tradicional  g Ctrl-g that shows in statusbar some
information u can do this

    :echo line('$')

or even map some keystroke to this result

### How insert digraphs in vim
first we explain what are digraphs - are simbols,
to see a complete list of them type  :dig<enter>

In orde to insert digraphs you have:

1 - :set paste
2 - in insert mode type the correpondent code of digraph

### How insert one arrow - type  →

to view the code of carachter below of cursor type 'ga'


To paste text from the system clipbo ard use Shift + Ins in Insert mode or
"*p in Normal mode.  Conversely, "+y yanks the current selection to the system
clipbo ard.

### Executing a macro over all files

``` vim
vim *.txt
:bufdo execute "normal @a" | write
```

### Dealig with previous yank register
http://stackoverflow.com/q/12547369/

EDIT 1: repeating using a macro

I was surprised that this operation isn't repeatable using ., but this is
presumably due to the use of visual mode. To repeat the operation using
a macro, do this:

    qqV"0pq

The macro can then be repeated by pressing @q or @@.

EDIT 2: repeating using .

Here's an attempt at making it repeatable using . by not using visual mode.
After yanking the stamp line and moving the cursor, do this:

    "_S<c-r>0<delete>

which uses the insert mode <c-r> command to insert the contents of register 0.
Note that the <delete> is necessary because the stamp line contained a carriage
return. If it did not (i.e. yanking using y$ rather than yy) the <delete> could
be omitted.


### Correct all occurrences of misspelled word

``` markdown
:spellr

]s .......... next misspelled word
=z .......... accept sugestions
1=z ......... accept first sugestion
zg .......... add word as good
zw .......... add word as "wrong"
zuw ......... undo add word as wrong
zug ......... undo add word as good one
```

### How add a line after every few lines in vim

    :%s/^/\=line(".")%4==0?"\n":"")/g

### How add a new line after a pattern

    :%s/PATTERN/&\r/g

### How join lines whithin xml <div>s

     :g/<div>/+1,/<\/div>/-1 join

### Vim search pattern for a piece of text line yanked in visual mode

First you would select and copy chunk of text, after that you
start a search typing /  then you press Ctrl-r 0

This tip was copied in stackoverflow in this link http://va.mu/UIs6

### How do condicional replace on vim
from: http://stackoverflow.com/questions/8814069/

``` vim
" como substituir uma palavra em uma linha que começa com -
:%g/^-/s/word/WORD/g
```

### Saindo temporariamente do vim para o shell

        Ctrl-z

Execute os comandos do shell

        fg

### Apagando linhas intercaladas
Vim: how to delete every second row?

reference: http://stackoverflow.com/questions/1946738/

    g/^/+d

### Como saber onde um atalho de teclas foi definido no vim

``` vim
:verbose map atalho
:verbose command Dos2Unix
```

### Remapear caps lock para ESC

        xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

### Vim - paste in insert mode?

While in insert mode hit CTRL-R {register}. For example, CTRL-R * will
insert in the contents of the clipboard and CTRL-R " (the unnamed register)
inserts the the last delete or yank.

To find this in vim's help type :h i_ctrl-r

### Vim How to paste text into Vim command line

``` markdown
Ctrl-r 0

0 (yank register),
1 to 9 (shifting delete registers),
_ (like /dev/null, this is a black hole),
" (default register, hence the Ctrl-R, "),
- (small delete register),
/ (the search pattern register),
: (last command register),
a to z for your own use (capitalized A to Z are for appending to corresponding registers).
```

See :help registers for the full reference.


### Editando arquivos remotamente

    :e scp://username@someremotehost/./path/to/file

	gvim scp://manager@192.168.1.11/./bashrc

### Alias para abrir arquivos recem editados

``` vim
" coloque no ~/.bashrc
alias lvim='vim -c "normal '\''0"'
```

### Vim delete HTML tag, but not content

    yit vat p

What this does is yanks:

    y - yanks
    it - the inside of the tag
    vat - selects the entire tag
    p - pastes the previously yanked text over it

### VIM: append to clipboard

http://stackoverflow.com/questions/6303882/

    let @+ = @+ . my_expression

or shorter:

	let @+ .= my_expression

Reference: :help :let.=

### Put the clipboard content into a register

	:let @a="<C-r>*"

### Navegando em linhas longas no vim

``` markdown
gj ............ desce
gk ............ sobe
```

### Como buscar pela palavra sob o cursor?

 ``` vim
 *  ........... busca para frente
 #  ........... busca para traz
 ```

### Como sair do vim direto do modo normal

        ZZ .......... o mesmo que :x

### Como colar texto posicionando o cursor depois do texto?

    Em modo insert <Ctrl>r +
    em modo normal "+gp

### Como fechar o arquivo sem fechar o vim?

      :bd

      :enew .......... é melhor porque preserva o arquivo anterior na lista de buffers

      Source: http://stackoverflow.com/questions/256204/

### Para executar uma função do vim que está na área de transferência

      :@"

### Pular para fechamento ou abertura de uma função

 se temos uma função do tipo:

``` vim
nome () {
bla bla bla
bla bla bla
bla bla bla
bla bla bla
bla bla bla
}
```

    Podemos pular para a chave de abertura ou fechamento
    simplesmente usando [{  ou ]}

### Incrementando números ou decrementando com uma função

source: http://stackoverflow.com/questions/4951533/

Se eu tiver um arquivo assim:

``` markdown
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
```

E QUISER ASSIM

``` markdown
.star_10 {
background: url(stars.png) no-repeat 0 0;
}
.star_9 {
background: url(stars.png) no-repeat 0 -18px;
}
.star_8 {
background: url(stars.png) no-repeat 0 -36px;
}
.star_7 {
background: url(stars.png) no-repeat 0 -54px;
}
```

** Função para decrementar a sequência acima **

``` vim
let g:decr = 11

fu! Decr()
    let g:decr = g:decr - 1
    return g:decr
    endfu

:%s/.star_10/\=".star_" . Decr()/
```

Outro modo de fazer é rodar o comado:

       '<,'>g/star/ normal<c-v><c-a>


Lembrando que o Control-v é para inserir o Control-x
que decrementa em modo normal

### Como selecionar texto recém colado

``` markdown
`[  ...... inicio do trecho colado
v   ...... seleção visual
`]  ...... fim do trecho colado
V`] ...... reseleciona trecho colado
`[v`] .... reseleciona trecho colado
'[ ....... local anterior ao último insert
```


### Abrir ajuda em tela cheia em nova aba

      :tab h

### Incrementando números em modo normal

``` markdown
Ctrl-a ........... incrementa em um
10 Ctrl-a ........ incrementa em dez

"OBS: Ctrl-v Ctrl-a para inserrir Ctrl-a

 g/identifier/ normal 20^A
```

Para incrementar o trecho width="32", ou seja, um trecho
começado com width contendo dois dígitos faz-se assim

    :%s/width="\zs\d\{2}\ze"/\=submatch(0)+10/g

### Copiando linhas que contém um padrão para um registro

    :g/pattern/y A

Exibir apenas as linhas que contém um padrão

    :g/pattern/#

### Remapeando a tecla ESC

veja o arqtigo neste link
http://vim.wikia.com/wiki/VimTip166

### Trabalhando com intervalos
Numa substituição se desejar atuar sobre linhas subsequêntes
a um determinado ponto é possível omitir a linha atual como visto
abaixo.

    :,+7s/^/foo/

    "salvando da linha 1 a 7 do arquivo atual em novo arquivo
    :1,7 w ~/tmp/teste.txt

### Sobrescrevendo algo entre aspas

    vi"p

### Salvar um intervalo em outro arquivo

    :25,$w teste.txt

### Modo alternativo de sair do modo insert

Ao invés de usar <Esc> para sair do insert use:

    Ctrl + [

### Retirando a syntaxe das buscas

    :noh

ou

    map <leader>h :set hls!<cr>

### Como colocar a palavra sob o cursor em uma substituição

      :%s/<c-r><c-w>/new-word/g

Para colocar o nome do arquivo em uma substituição faça

      /<c-r>%

### Some regex tips

``` markdown
"if " not followed by "then"

if \(\(then\)\@!.\)*$

To represent a NOT, use the negative assertion \@!.

For example, "NOT Bush" would be:

^\(.*Bush\)\@!

or using \v:

\v^(.*Bush)@!
```

Let's say I have some lines like below and I want to find bar
only if it is preceded by foo

 ``` markdown
 foobar
 bazbar
 foobar
 fooother
 quxbar
 ```

The solution search pattern would seems like this:

``` markdown
/\v(foo)@<=bar .............. @<=bar (negates bar)
/\vfoo(bar)@! ............... @! also negates bar

\(foo\)\@<!bar		any "bar" that's not in "foobar"
\(\/\/.*\)\@<!in	"in" which is not after "//"
```

You can also use the tilde character (~) as your search pattern, and when
running your substitution, Vim will interpret the tilde as the value of your
last replacement. So, if you already executed a substitution in which you
replaced the pattern matched with the characters +++ but realized you made a
mistake and the +++ should have been !!!, you can quickly rectify the problem
by executing another substitution, like so: :%s/~/!!!/g.

``` vim
qu\@!  " matches a q that's not followed by a u. (This is more correct than
q[^u], " which requires that there is some character after the q.)
```

to match on f, fo, foo, or food, the pattern `f\%[ood]` can be used. In PCRE,
such a pattern would look like `f(o(od?)?)?`. (Imagine that for a longer string!)

**Non-capturing group**

``` vim
\%^   .......... the beginning of the file
\%( \) ......... a non-capturing group
\{-}   ......... repeated 0 or more times (as few as possible)
```

This helps you to use a patter in search and not use it in groups

Vim's regex has some anchors for matching positions in the buffer.

``` markdown
\%23c matches column 23
\%<23c matches before column 23
\%>23c matches after column 23
\%16l matches line 16

    Similar to column, there are anchors for before or after a line number

\%# Matches the cursor position
```
This is useful for things like [highlighting trailing whitespace except when you're typing at the end of the line](http://vim.wikia.com/wiki/Highlight_unwanted_spaces)

####  Anoter approach to similar situation

  If you have to change or copy only quoted text but
  not want to catch quotes you [can](can) make use of this vim resource:

      /\v"\zs[^"]+\ze"

``` markdown
/ ................... starts searching
\v .................. very magic (avoid scapes)
" ................... literal quote
\zs ................. tells vim to start selecting from this point
[^"]+ ............... non quote followed at least for one non quote
\ze ................. tells vim to stop selecting at this point
```

### Finding words no larger than 5 chars

    /\v<\w>{5}

    \v .......... very magic
    < ........... word boundary (start)
    > ........... word boundary (end)
    \w .......... word
    {5} ......... exactly 5 chars

    /\v<\w{1,5}>\ze

    In the previous search "words 1 up to five chars" ignoring
    white spaces \ze stands for end of search

### Regex to uppercase multiple patterns at once

Let's say you have these lines:

``` markdown
class XhtmlDocument < XmlDocument; end
class XhtmlTag < XmlTag; end
```

And you want to uppercase "Xhtml" "Xml" at once

    :%s,\vX(ht)?ml,\U&,g

### Regex para pegar aspas simples

source: http://vimcasts.org/episodes/refining-search-patterns-with-the-command-line-window/

``` markdown
This string contains a 'quoted' word.
This string contains 'two' quoted 'words'.
This 'string doesn't make things easy'.
```

This string doesn't contain any quotes, isn't it.

    " a busca

``` vim
\w\@<!'\(\(\w'\|[^']\)\+\)'\(\w\)\@!  - without very magic

\v\w@<!'((\w'|[^'])+)'(\w)@! - very magic option

```


``` markdown
----------------------------------------------------------
" a explicação
----------------------------------------------------------
\v ........... very magic
\w@<!' ....... qualquer ' que naõ tiver uma palavra antes dele
\w|[^']+ ..... uma palavra ou não colchete ao menos uma vez
'(\w)@! ...... apóstofro que não tem uma palavra depois dele

%s/\v\w@<!'((\w'|[^'])+)'(\w)@!/"\1"/g
```

### Numerando linhas com novo comando
source: http://stackoverflow.com/questions/4224410/

``` vim
command! -nargs=0 -range=% Number <line1>,<line2>s/^\zs/\=(line('.') - <line1>+1).' '
```

``` vim
" para inserir numeração de linhas de dois dígitos
:%s/^/\=substitute(printf("%2d",line("."))," ","0","g")
```

### Abrindo e fechando folders com o mouse

``` vim
" se setar-mos como abaixo mostra os subníveis dos folders
set foldcolumn=3
```

``` markdown
zi .............  opens and closes all folders
zO ................  open all folders
zM ................  close all folders
```

### Colando o que foi selecionado com o mouse

`Ctrl-r *` Or `"*p`

### Artigos e links legais sobre o vim

 * http://stevelosh.com/blog/2010/09/coming-home-to-vim

### Vim script

* http://www.swaroopch.com/notes/Vim_en:Scripting

para ecoar uma lista

     :ec split('uma lista de palavras')

Para exibir o tamanho da linha atual

     :ec strlen(getline('.'))

 Para exibir o tipo do arquivo

     :ec &filetype

``` vim
function CurrentLineLength()
    let len = strlen(getline("."))
    return len
endfunction
```

See :help function-list for a huge list of functions available.

### Para listar o caminho completo de cada esquema de cores do vim

``` vim
ec split(globpath(&runtimepath, 'colors/*.vim'),"\n")

" coloca cada cor instalada localmente em uma variável g:mycolors

let g:mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")

ec split(glob(expand("$HOME")."/.vim/colors/*.vim"), "\n")
```

### Script para trocar o esquema de cores

* http://vim.wikia.com/wiki/Switch_color_schemes

### Setando o programa grep

Instale o programa grin

``` markdown
sudo easy_install grin

no vimrc   set grepprg=grin

:grin -il padrão

:clist

Para abrir os arquivos que correspondem ao padrão

:copen ......... abre a lista - use Ctrl-w-f
```



### Usando o grep nativo do vim

``` vim
" para continuar usando autochdir configure o formato do erro
set grepformat=%f:%l:%m
```

``` vim
:vim /\cpattern/gj ~/.vim/**/*.wiki
:noautocmd vim /\cdica/gj ~/.vim/**/*
:cn
```

    o comando :lw equivale a :cope

    nnoremap <F4> :execute "vimgrep /" . expand("<cword>") . "/gj **" <Bar> cw<CR>

    :vimgrep /{searchTerm}/[gj] {/path/to/project/**/*.rb}

    Para visualizar buscas prévias use:

        :colder

        ou para buscas mais antigas:

        :cnewer

### Como exibir as opções de formatação?

``` vim
:ec &fo
:ec &rtp
```

### Como indentar um bloco de código vuado

     ={

     ou

     ==

" retira a indentação das próximas 99 linhas

     :%< 99

### Atalhos para marcas

``` markdown
]' .......... próxima marca
[' .......... marca prévia
```

### Função para criar marcas visíveis

``` vim
function! SignLines() range
  let n = a:firstline
  execute(":sign define fixme text=>> texthl=Todo")
  while n <= a:lastline
    if getline(n) =~ '\(TODO\|FIXME\)'
      execute(":sign place ".n." line=".n." name=fixme file=".expand("%:p"))
    endif
    let n = n + 1
  endwhile
endfunction
map <S-F5> :call SignLines()<CR>
```

### Saltos para alterações

``` vim
g, ...... alteração mais recente
g; ...... alteração mais antiga
```

somente lista de saltos

    Ctrl-o
    Ctrl-i

### Manipulando o histórico

``` vim
q:
q/
```

ou abra a linha de comando e pressione

    Ctrl-f

Outro modo é digitar o comando:

    :cedit

Para fechar a janela do histórico

      Ctrl-w-q

``` markdown
O registro @: contém o último comando e
o registro @/ contém a última busca
```

### Limpando um registro de forma fácil

      qaq .......... limpa o registro 'a'

      let @a=''

### Corretor ortográfico do vim

    Fonte: http://www.dicas-l.com.br/arquivo/corretor_ortografico__em_portugues__no_vim.php

Baixar o dicionário atualizado em
http://www.broffice.org/files/pt_BR-2010-01-09AOC.zip Descompactar o dicionário
No mesmo diretório que estiver os arquivos descompactador, iniciar o vim e
executar o seguinte comando:

  ``` vim
  :mkspell pt pt_BR
  ```

(esse comando demora alguns minutos)
Copiar o arquivo gerado neste diretório, chamado pt.utf-8.spl, para ~/.vim/spell
Após a instalação do dicionário, para habilitar o corretor ortográfico (em português) no vim, basta digitar:

``` vim
:set spell spelllang=pt
:setlocal spell spelllang=en_us
```

    Uma vez no vim, com o corretor ligado, basta digitas os seguintes comandos para as tarefas mais básicas:

``` markdown
]s 	move o cursor para a próxima palavra "errada"
[s 	move o cursor para a palavra "errada" anterior
zg 	adiciona a palavra (no dicionario) em que o cursor está em cima.
zug 	remove a última palavra adicionada no dicionario
z= 	Vê as sugestões para uma palavra certa, e troca se você escolher alguma delas.

No modo insert, quando o cursor estiver após uma palavra marcada com erro
você pode usar Ctrl-x s para procurar sugestões. Use Ctrl-n ou Ctrl-p para
voltar. i_CTRL-X_s
```

### Seleção

  see vim text objects the definitive guide
  http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-

selecionar

``` markdown
Trecho entre parênteses  ......... vi(
Entre parênteses (inclusive) ..... v%
Trecho entre aspas ............... vi"
Seleciona um parágrafo ........... vip
Selection uma sentença ........... vis
```

  Pode usar copiar ao inves de visual

``` markdown
yi"
yi(

Ou deletar

di"

ou ainda

ci"
ci(
cib
```

### Movendo-se

``` markdown
fx ........... para o próximo 'x'
Fx ........... para o prévio 'x'
tx ........... antes de próximo 'x'
Tx ........... antes de prévio 'x'
gf ........... go to file
gd ........... go to definition
```

### Completar caminhos no modo insert

    Ctrl-x Ctrl-f

    Completar:
    Linhas  .................... Ctrl-x Ctrl-l
    Palavra (arquivo corrente) . Ctrl-x Ctrl-n
    Palavra dicionário ......... Ctrl-x Ctrl-k
    Palavra tesaurus ........... Ctrl-x Ctrl-t
    Palavra arquivos incluidos . Ctrl-x Ctrl-i
    tags ....................... Ctrl-x Ctrl-]
    definições de macros ....... Ctrl-x Ctrl-d
    linha de comando ........... Ctrl-x Ctrl-v
    definições de usuário ...... Ctrl-x Ctrl-u
    omni completion ............ Ctrl-x Ctrl-o
    sugestões de spelling ...... Ctrl-x _s
    complemento ................ Ctrl-x Ctrl-n

### Manipulando buffers

    :ls ............... lista os buffers
    :b mat<tab> ....... mostra os buffers começados com 'mat'
    :bd  .............. tira o buffer atual da lista
    :bufdo ............ executa um comando para todos os buffers

### Função para inverte strings no vim

    function! InvertString(str)
        " Courtesy of Preben "Peppe" Guldberg
        " This will invert/reverse a string
        " This will work on arbitrary length strings, too. The /.*/ should be
        " quick, which might make it up for using a regex rather than using
        " numerous commands in a :while loop.
        "
        " This can be used in a substitute command as follows:
        " :%s/AUTHORIZATION/\=InvertString(submatch(0))
        let inverted = substitute(a:str, '.\(.*\)\@=',
                    \ '\=a:str[strlen(submatch(1))]', 'g')
        return inverted
    endfunction

    " em modo normal
    map <Leader>rv Yo<C-O>:set revins<cr><C-R>"<esc>:set norevins<cr>

### Comando para inverter palavras de uma linha

    inverter uma string por palavras

    source: http://stackoverflow.com/questions/5532431/

    command! ReverseLine call setline('.', join(reverse(split(getline('.')))))

### Como definir a fonte no vim
[referencias: Ask Ubuntu](http://askubuntu.com/q/363142)

Você pode até escolher a fonte graficamente e em seguida
copie a saida deste comando

     :set gfn?


Agora coloque no vimrc o resultado

     set anti gfn="nome da fonte que você pegou"

Alternatively, enter the following to insert the current font setting into the buffer:

    :put =&guifont


   ** no modo gráfico (gvim) **

    :set anti gfn=Ubuntu\ Mono\ for\ PowerLine:h13

Você pode também aumentar a fonte do terminal (se estiver usando um)
com o atalho `Ctrl-Shif-+`

### Contando quantas vezes uma palavra ocorre

You can use the following set of commands to count the number of times a
particular word occurs in a buffer: >

``` vim
:let cnt=0
:g/\<your_word\>/let cnt=cnt+1
:echo cnt
```

### Name spaces para variáveis no vim

There are several name spaces for variables.  Which one is to be used is
specified by what is prepended:

(nothing) In a function: local to a function; otherwise: global
|buffer-variable|    b:	  Local to the current buffer.
|window-variable|    w:	  Local to the current window.
|tabpage-variable|   t:	  Local to the current tab page.
|global-variable|    g:	  Global.
|local-variable|     l:	  Local to a function.
|script-variable|    s:	  Local to a |:source|'ed Vim script.
|function-argument|  a:	  Function argument (only inside a function).
|vim-variable|	     v:	  Global, predefined by Vim.

### Contar os caracteres da linha atual

    :echo strlen(getline("."))

    :let len = strlen(getline("."))
    :echo "We have" len "characters in this line."

    :function Currentlinelength()
    :    let len = strlen(getline("."))
    :    return len
    :endfunction

### Contar ocorrências de uma palavra

  :%s/<c-r><c-w>//gn

### Dicas para substituições

 A opção \zs quando usada em uma substituição faz com
que tudo que estiver a sua esquerda seja ignorado na substituição
evitando o uso de \1 \2 (back references das expressões regulares)

Para mais detalhes :h zs

### Como instalar plugins com a extensão vba no vim

Plugins com a extensão vba usam o seguinte método:
você baixa o plugin, abre ele com o vim e executa este comando

   :so %

Mas para quem usa o plugin

Ao instalar um plugin com extensão vba 'vimball' você pode listar
quais arquivos serão instalados assim:

 `  :VimballList    `

  Pode ainda determinar um local no qual os arquivos vba serão
  colocados ao usar o comando :so

  Para isto use:

    :usevimball ~/.vim/bundle/bundle-dir-name-here
     veja o help :h :usevimball

    OBS: troque o nome de usuário no comando abaixo para corresponder ao seu usuário

    :let g:vimball_home="/home/sergio/.vim/bundle/plugin"
    :so %

### Manipulando visualização da janela e lista de saltos

    let a = winsaveview()
    call winrestview(a)

    veja :h keepjumps

        keepjumps command

   Para saltar para a posição da alteração mais recente use Ctrl-i
   Para saltar para a posição da alteração mais antiga use Ctrl-o

   há uma discussão na web a respeito desta função
   http://tech.groups.yahoo.com/group/vim/message/51005

### Exibindo o histórico de comandos no vim

     :history : -20,
     :his / -20,

### Plugins do vim

First try install vundle

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

``` vim
:PluginInstall(!) - install (update) plugins
:PluginUpdate
:PluginSearch! plugin_query

Plugin 'rking/ag.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'kien/ctrlp.vim'
Plugin 'ompugao/ctrlp-z'
Plugin 'sjl/gundo.vim'
Plugin 'edsono/vim-matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'chrisbra/NrrwRgn'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-abolish'
Plugin 'bling/vim-airline'
Plugin 'eparreno/vim-l9'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-scripts/VisIncr'
```

``` markdown
ProjectPlugin
AirLine...............https://github.com/bling/vim-airline
VisincrPlugin
SurroundPlugin........https://github.com/tpope/vim-surround
GundoPlugin
RepeatPlugin .........https://github.com/tpope/vim-repeat
PathogenPlugin........https://github.com/tpope/vim-pathogen
[[Abolish]] ..............https://github.com/tpope/vim-abolish
[[vim-system-copy]] ....... https://github.com/christoomey/vim-system-copy
```


### Trabalhando com janelas

       Ctrl-w_^ .......... divide a janela atual e edita arquivo alternativo

### Colando do clipboard em modo insert

Em modo normal colamos o conteúdo da área de transferência usando o clássico "+p já em modo insert faça:

       <Ctrl-r>+
       <Ctrl-r>"

The Control-R mechanism is very useful:-

        :h i_CTRL-R

Usually used for inserting the contents of a register 0-9a-z
but can also insert the following special registers etc

``` markdown
'"' the unnamed register, containing the text of the last delete or
yank
'%' the current file name
'#' the alternate file name
'*' the clipboard contents (X11: primary selection)
'+' the clipboard contents
'/' the last search pattern
':' the last command-line
'.' the last inserted text
'-' the last small (less than a line) delete
=5*5 insert 25 into text (mini-calculator)
```

The paste buffer is usually the easiest way to transfer text between VIM and
another application.

``` vim
" Redirection & Paste register *
:redir @* : redirect commands to paste buffer
:redir END : end redirect
:redir >> out.txt : redirect to a file
" Working with Paste buffer
"*yy : yank current line to paste
"+y} : yank to end of paragraph
"+yi{ : yank current paragraph
"*p : insert from paste buffer
" yank to paste buffer (ex mode)
:'a,'by* : Yank range into paste
:%y* : Yank whole buffer into paste
:.y* : Yank Current line to paster
" filter non-printable characters from the paste buffer
" useful when pasting from some gui application
:nmap p :let @* = substitute(@*,'[^[:print:]]','','g')"*pr
```

### Convertendo temas do texmate para o vim

http://coloration.sickill.net/

programa para possibilitar a conversão de esquemas de cor do texmate (binario para xml1)
http://vimcasts.org/episodes/creating-colorschemes-for-vim/
usando este site: http://coloration.sickill.net/

    apt-fast install -y libplist-utils

### Videos bacanas sobre o vim

http://vimeo.com/user1690209/videos

muito louco, tranformando um xml em texto plano http://vimeo.com/15443936

### Busca dentro de seleção visual

``` vim
/\%V
:%s/\%Visto/aquilo/ge
```

### Como abrir vários arquivos no gvim

      :args ~/path/*.py

isto evita o erro E77: muitos arquivos para editar

### Deletando linhas que não contém padrão

    :v/pattern/d

### Destacando as linhas duplicadas

    :g/^\(.*\)\n\ze\%(.*\n\)*\1$/#

### Pegar linha que começa com palavra e sublinhar

    g/^\w/t.|s/./=/g

### Adicionar uma linha em branco após linhas que começam com espaço

    :g/^\s*-/normal O

### Função para deletar linhas em branco duplicadas

``` vim
fun! DelBlank()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :g/^\n\{2,}/d
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
map <leader>d :call keepjumps DelBlank()<cr>
```

``` vim
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let save_cursor = getpos(".")
    let old_query = getreg('/')
        execute a:command
    " Clean up: restore previous search history, and cursor position
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction"}}}
```

### Adding blank lines  - adding empty lines between lines
source: [superuser.com](http://superuser.com/questions/592503/)

    :g/.\n\n\@!/norm o

The pattern I use is `/.\n\n\@!/`. Breaking that down into its component pieces:

. Matches any character in the line. (used to immediately discard any
existing empty lines from consideration) \n Matches a single \n at the end
of the character above \n\@! Fails the match if there's another \n
immediately after the earlier \n.

### Visualizar o histórico de comandos do vim

Com o cursor na linha de comandos do vim pressione <C-f>

``` vim
:redir @a>  ......... redireciona para o registro 'a'
:history : -20,
:redir END
"ap
```

Outro modo de colar o regitro "a" é pressionar Ctrl-r Ctrl-r a

Comando para colar o histórico dos ultimos 22 comandos

     q:22kyG Ctrl-w-q p

### Mapeamento para inserir números randomicos no vim

``` vim
imap <leader>r <C-r>=system('echo "$(($RANDOM % 100))"')<cr>
```

### Adicionado espaços em títulos markdown

Se você tem um título ou subtitulo markdown com o texto
colado no titulo como em  ##titulo podemos adicionar um espaço assim:

``` vim
%s/\v(^#{1,3})([a-z])/\1 \2/g
```

``` markdown
grupo 1 ---> comço de linha # Ou mais
grup 2  ---> tudo menos # E espaço
```

### Fazer com que subseções markdown virem subsubseções

``` vim
:g/^##[^#]/ normal I#
```

Obs: os caracteres ^[ são obtidos digitando-se Ctrl-v + [

### Trocar título tipo == assim == para markdown

O código abaixo troca dois iguais por três ###

``` vim
%s/\v^\=\=([^\=]+)\=\=/### \1/g
```

### Delet the character before cursor

Let's say you have:

    sales_tax: row["sales tax"] ,

And you want to delete the space before caret, in command mode
just press X

### How to convert html to markdown using vim-pandoc
[link here](http://amandogra.github.io/blog/how-to-convert-html-to-markdown-using-vim-pandoc/)

#### Install pandoc
after that install these plugins with your favorite vim plugin manager

``` vim
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
```
In my case I usually create a function to this task

``` vim
fun! HtmlToMarkdown()
    :%!pandoc -f html -t markdown<CR>
endfun
command! -nargs=0 H2M :%!pandoc -f html -t markdown<CR>
```
### References
* http://vi.stackexchange.com/q/2268/

