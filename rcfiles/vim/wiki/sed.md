### Introdução

``` markdown
File:		 ComandoSed.md
Created:	 qua 11 jan 2017 06:45:53 BRT
Last Change: qua 11 jan 2017 12:42:56 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

Sed é um editor de streams, ou seja, ele manipula fluxos
de texto que podem ser pipeados fazendo deleções, inserções
substituições, etc.

### apagando toda segunda linha


      sed -i '1~2d' file

A ação acima ocorre diretamente no arquivo devido a opção '-i'
que permite ao sed editar diretamente o arquivo, caso contrário
a mágica não ocorre.

o numeral 1 indica o ponto onde se inicia
o numeral 2 indica que toda segunda linha receberá a ação
indicada que no caso é deleção 'd'

### Criando pastas para aruqivos

OBS: Se você tem uma estrutura com subdiretórios pode listar os arquivos
com o find, no meu caso (em certas situações )
A listagem dos arquivos é feita com um recurso do [ZSH](zshell.md) --> `ls -1 **/*(.)`
que na prática é o equivalente a: `find -type f`


Eu tenho uma pasta com um monte de arquivos tipo:

    xminusone_560501_SeaLegs.mp3

E desejo criar as pastas para todos os arquivos e mover os arquivos
para cada uma delas

A criação das pastas eu fiz assim:

      ``` sh
      ls | awk -F'[_.]' '{print $3}' | xargs mkdir
      ```

Daí eu testei o comando de mover (o shell me dará só uma string)

      ``` sh
      ls -1 **/*(.) | sed -r 's@(.*_)([^.]*).mp3@ mv  & \2@g'
      ```

A mesma solução com o awk (as strings necessárias presicam estar entre aspas)

      ``` sh
      ls **/*(.) | awk -F'[_.]' '{print "mv " $0" "$3}' | sh

      $0 ................. string inteira
      $3 ................. corresponde ao terceiro campo "nome da pasta"
      ```

Pra finalizar uso uma dica do [Aurélio Marinho Jargas](http://aurelio.net/)
da sua série [Tela Preta](https://www.youtube.com/playlist?list=PLkMH2SrZj2aiWw-t6rLgciBQqqoZZn5t1)
basta colocar um pipe e "sh" no final da linha acima, ficando assim:


        ``` sh
        ls -1 **/*(.) | sed -r 's@(.*_)([^.]*).mp3@ mv  & \2@g' | sh

        ls -1  ............... listagem de um por linha
        **/*(.) .............. casa com arquivos (não pastas)
        sed -r ............... extended regular expressions
        ```

### imprimir da segnda linha em diante

    sed -i '1d' filename

### adicionando uma linha em branco após toda segunda linha
Adding a new line after each second line

        sed '0~2 a\\' inputfile

### juntando três linhas consecutivas

        sed 'N;N;s/\n/ /g' file

### operadores do sed

    =  .......... insere um número entre cada linha
    G ........... insere uma linha em branco entre cada linha

    sed '=;G' annoying.txt


### remover espaços não separáveis

source: http://askubuntu.com/questions/357248/how-to-remove-special-m-bm-character-with-sed

    sed -i 's/\xc2\xa0/ /g' file

### Imprimir somente as linhas impares

    sed -n '1~2p'

    Em inglês "odd lines"
    as pares seriam "even lines"

### Removendo o caratere ' de uma string

      sed 's/\x27//g'

### separando o ultimo campo de um caminho

### O problema

* fonte: http://br.groups.yahoo.com/group/shell-script/message/32415

Galera,
preciso pegar o ultimo campo. Vou explicar, tenho as linhas

``` markdown
/dados/teste/uu/eu.sh
/dados/eu/eu.log
/nfs/bin/cp

preciso separar o que é o full path e o que é o arquivo. Tipo:

full=/dados/teste/uu/
arq=eu.sh

full=/dados/eu/
arq=eu.log
```

e por ai vai.

### A solução

    `sed -i.backup -r  's,(.*/)(.*),full=\1 \narq=\2,'  arquivo`


    use '-i' para alterar diretamente o arquivo com o sed, com
    -i.backup ele gera um backup antes


    troquei o delimitador para não confundir com as barras
    veja  sed -

    r ............. expressões regulares extendidas
    (.*/) ......... grupo 1 tudo até a ultima barra
    (.*) .......... grupo 2 nome do arquivo
    \1 ............ coloca o grupo 1 no local indicado
    \2 ............ coloca o grupo 2 no local indicado
    \n ............ note o \n antes de 'arq='

### converter primeira letra em maiúsculo

    sed -r 's/\b[a-z]{3,}/\u&/g' <<< "coordenacao de analise e instrucao de processos"

### deleção na próxima linha

    sed '/follow me/{n; /the end$/d}' file

### substituição na próxima linha
Substituir na linha subsequente a um padrão
+ referência: http://sed.sourceforge.net/sed1line.txt
+ http://br.groups.yahoo.com/group/shell-script/message/31774


``` sh
sed -i '/pattern/,+1 s/this/that/g' file
sed -e '/address2/,+1s/address1/address2/' eri.txt
```
    sed -i.backup '/src admin/{n;s/\(.*\)/\1 teste/g}' file

#### se a inteção é apenas imprimir a linha subsequente a um padrão

    sed -n '/pattern/{n;p}' < file

### de-me o numero da linha

    sed -ne '/gimme this line number/{=;q;}'

### Monitorando um arquivo
fonte: [[@http://aurelio.net/sed/sed-HOWTO/sed-HOWTO-8.html]]

No //Sed// da GNU, a partir da versão **3.02.80**(*), foi adicionada a opção -u, que significa "unbuffered",
ou seja, faz um uso minimalista dos registradores, mostrando a saída o mais rápido possível,
tornando possível editar um fluxo interminável como o gerado por um //tail -f//.
Um exemplo prático seria mostrar apenas as mensagens do sistema relativas às conexões //ssh//:

     tail -f /var/log/messages | sed -nu '/sshd/p'

Volta e meia aparecem dúvidas sobre o SED "stream editor"
e quase sempre alguém sugere algo como:

``` sh
cat arquivo.original > arquivo.original.backup
cat arquivo.original | sed '/padrao/d' > arquivo.modificado
mv arquivo.modificado arquivo.original
```

mas você pode simplificar tudo fazendo:

      sed -i.backup '/padrao/d' arquivo.original

No caso acima o sed irá apagar a palavra "padrão"
mas antes ele já cria o bakcup pra você, tudo em uma
mísera linha. :)

### Casando números de 0 a 100

    cat file | sed  -n -r '/^100|^[0-9]{1,2}$/p'

### trocando colunas de um texto
* fonte: http://br.groups.yahoo.com/group/sed-br/message/4432

> > > arquivo, para esse formato
> > >
> > > AAAA/MM/DD HH:MM:SS

ARQUIVO ORIGINAL
----------------8<---------------
Mon Apr 12 00:04:55 2010
TOTAL 0
Mon Apr 12 00:04:55 2010
Mon Apr 12 08:18:32 2010
1142 10000
TOTAL 10000
Mon Apr 12 08:27:20 2010
Mon Apr 12 10:24:33 2010
1142 20000
TOTAL 20000
Mon Apr 12 10:29:52 2010
Mon Apr 12 13:17:44 2010
1142 24940
1162 3076
1171 1984
TOTAL 30000
---------8<--------------------------------

Expressão regular para solução

``` sh
(^[A-Z][a-z]{2})\s([A-Z][a-z]{2})\s([0-9]{2})\s([0-9]{2}):([0-9]{2}):([0-9]{2})\s([0-9]{4}$)
```

tudo que estiver dentro de parênteses é um grupo (grupo) e pode ser chamado
assim \1  grupo 1    \2 grupo 2

^ ... começo de linha
seguido de uma letra maiúscula de A até Z [A-Z]
seguido de duas letras minúsculas de a até z [a-z]{2}  {2,3} --> isso daria de 2 até tres vezes
\s .... seguido de um espaço \s corresponde a um espaço
o próximo grupo tem o mesmo padrão do grupo 1  ([A-Z][a-z]{2})
segue-se um grupo de dois números ([0-9]{2}) --> grupo 3
depois vem um grupo de dois números seguido de dois pontos  ([0-9]{2}):
repete-se o grupo de dois números seguidos de dois pontos  ([0-9]{2}):
no penúltimo grupo dois números seguidos de um espaço ([0-9]{2})\s
o último grupo são quatro números seguidos de final de linha ([0-9]{4}$)

agora faço referências na substituição, por exemplo o ano que está
no último grupo (grupo 7) referencio com \7

No sed a substituição é feia assim:

sed -i.backup -r 's/isto/aquilo/g'
mas o delimitador pode ser uma vírgula como estou usando abaixo, veja
uma vírgula logo após o 's' de substituição.

sed -r -i.backup 's,(^[A-Z][a-z]{2})\s([A-Z][a-z]{2})\s([0-9]{2})\s([0-9]{2}):([0-9]{2}):([0-9]{2})\s([0-9]{4}$),\7/\2/\3 \4:\5:\6,g' teste.txt

então estou pedindo carinhosamente ao sed para me dar
o grupo 7 seguido de uma barra /
seguido do grupo 2 seguido de uma /
seguido do grupo 3 seguido de um espaço
seguido do grupo 4 seguido de dois pontos
seguido do grupo 5 seguido de dois pontos
seguido do grupo 6 seguido de dois pontos


### pegar elementos de uma url
faça uma regex para pegar:

``` sh
protocolo http ou https
servidor uol, oi, google
linguagem no final do nome php, asp, pl

 http://www.uol.com.br/index.php
 http://www.oi.com.br/recados.asp
 https://google/service.pl

 minha regex ficou assim:
 ^(https?)://(www\.)?([^./]*)[^/]*[^.]*(.*$)

# usando o sed para escrever o resultado
cat file | sed -r 's,(https?)://(www\.)?([^./]*)[^/]*[^.]*\.(.*$),protocolo: \1 server: \3 linguagem: \4,g'
```

### substituir somente onde houver um padrão

``` sh
sed '/baz/!s/foo/bar/g' # onde não houver o padrão
sed '/baz/s/foo/bar/g'
```
### Juntando linhas com o sed

** você tem a seguinte entrada **

``` html
<abc a="1">
   <val>0.25</val>
</abc>
<abc a="2">
    <val>0.25</val>
</abc>
<abc a="3">
   <val>0.35</val>
</abc>
```

** e deseja a seginte saida**

``` html
<abc a="1"><val>0.25</val></abc>
<abc a="2"><val>0.25</val></abc>
<abc a="3"><val>0.35</val></abc>
```

Com o sed faz-se assim

        sed -i.backup '/^<abc/{N;N;s/\n\| //g}' file

### Converte formatos de arquivos (terminador de linha) dos unix

To convert a UNIX file to DOS using <span style="font-family:
monospace;">sed</span> (GNU <span style="font-family: monospace;">sed</span>
3.02.80 or later):


    $ sed 's/$/\r/' UNIX_file > DOS_file

To convert a DOS file to UNIX file, use <span style="font-family: monospace;">tr</span> to remove the carriage return:


    $ tr -d '\r' < DOS_file > UNIX_file

To accomplish the same thing using <span style="font-family: monospace;">sed</span>:


    $ sed 's/^M//' DOS_file > UNIX_file

    sed -i.backup 's/\x0D$//' file


### Inserir texto na linha 1

    sed -i '1i\
    texto após linha 1' file

    sed -i "1i $SHELL-VARIABLE" filename


### Consertando o resolv.conf por tabela

    sed -i '/^# *prepend/s/^#//g; s/127.*/208.67.220.220, 208.67.222.222;/g' /etc/dhcp3/dhclient.conf

### Adicionando os repositórios universe e multiverse

sed -i.backup -r '/^#\s?deb\s?(http|ftp|-src).*(partner|multiverse|universe)/s/^#\s?//g' /etc/apt/sources.list

### baixando atualizações para usar em outra máquin

    apt-get -qq --print-uris dist-upgrade|sed "s/'\(.*\)'.*/\1/" >urls.txt

### deletando uma linha específica

    sed -i 8d ~/.ssh/known_hosts

### extraindo parte de um arquivo

``` sh
sed -n '/start/,/end/p' file
sed '27,99 !d' file.txt > /tmp/file2
```

### consertando o /etc/hosts
No ubuntu o nome da máquina tem que estar na linha 1 tambem

    [ -z "$(head -1 /etc/hosts | grep "$(hostname)")" ] && sed -i.backup -r "1s/(.*)/\1 `hostname`/g" /etc/hosts

### Apagando tags html

    sed 's/<[^>]*>//g' index.html

### inserindo links html
fonte: http://aurelio.net/sed/sed-dicas.txt

 ``` markdown
 tranforma texto (URL) em tags HTML de links.
 era : http://www.com
 fica: <a href="http://www.com">http://www.com</a>
 ```
    sed 's_\<\(ht\|f\)tp://[^ ]*_<a href="&">&</a>_'
    sed -i.bakup 's|http.[^ \t]*|<a href="&">&</a>|'  htmlfile

### Comentando scripts bash

    sed 's/^abc/#&/'   # comenta a linha que comeca com abc


### Corrigindo os atalhos do mouse e terminal do ubuntu intrepid
Para esta solução vamos pedir ao amado 'sed' que busque uma linha
começada com '/^X-Ubuntu-Gettext-Domain=gnome-terminal/', caso
obtenhamos sucesso ele substitui o começo da linha por um comentário.

``` sh
sed -i '/^X-Ubuntu-Gettext-Domain=gnome-terminal/ s/^/#/g' \
  /usr/share/applications/gnome-terminal.desktop
```

``` sh
sed -i '/^X-Ubuntu-Gettext-Domain=gnome-control-center-2.0/ s/^/#/g' \
   /usr/share/applications/gnome-settings-mouse.desktop
```

### Inserir arquivo em outro
fonte: http://br.groups.yahoo.com/group/sed-br/message/4138

Experimente somente

    sed '/insertPoint/r arquivo.txt' padrao.txt

para valer a variavel shell dentro do sed
use

``` sh
arq=arquivo.txt
sed "/insertPoint/r $arq" padrao.txt
```

### Mostrar primeira linha

    sed 1q /etc/passwd | awk '{ FS = ":" ; print $1 }'

### Exibindo o path de uma forma mais legível

    sed 's/:/\n/g' <<<$PATH

outro exemplo

``` sh
printenv PATH
env | grep -i PATH | cut -d= -f2
```

### imprimir uma linha randômica de arquivo
fonte: http://www.commandlinefu.com/commands/view/2748/pick-a-random-line-from-a-file

    sed -n $(($RANDOM % $(wc -l < file.txt) +1 ))p file.txt

### Quebras de linha
retirado da lista sed-br

``` markdown
-- "Marcelo G. Dias" > wrote:
>
> Estou com o seguinte problema, tenho 640 arquivos txt e
> os mesmos não poderão ter mais de 80 caracteres por linha,
> ai vem o problema, preciso gerar uma ER que quebre as
> linhas em 80 caracteres.
```

``` sh
echo 123456789 | sed 's/.\{3\}/&:/g'
123:456:789:
```

``` markdown
a ER ".{3}" casa qualquer sequencia de 3 caracteres.
estou trocando ela por ela mesma (&) seguido de :,
globalmente (várias na mesma linha).

no teu caso basta usar 80 e \n
beleza?

--
Aurelio Marinho Jargas, Curitiba, Conectiva
http://aurelio.net
```

### Trocando a página inicial do firefox

    sed -i 's|\("browser.startup.homepage",\) "\(.*\)"|\1 "http://www.google.com"|' .mozilla/firefox/*.default/prefs.js

### Retirando linhas em branco duplicadas

       sed '/./,/^$/!d'

### como mover parte de um arquivo para o seu final
fonte: http://stackoverflow.com/questions/1286883/

    sed '/\(pattern\)/,+4 { H; d; }; $ { p; x; }' file

``` markdown
sed '/\(2.6.18-157.el5\)/,+3

 { #Find line which contains version of our kernel in parentheses and took also 3 following lines
  H # Append this line into buffer
  d # Delete line
 }

 $ { # On the last line
 p # Print current line
 x # Change current line with buffer and vice versa
 # Afterwards sed print current line => in our case deleted line
 }' /boot/grub/menu.lst
```

### Inserindo linhas em brancom após linhas maiores que
Observe que a quebra de linha é explícita, ou seja o comando sed
continua na próxima linha

Append an empty line after a line with exactly 42 characters

    sed -ie '/^.\{42\}$/a\' huge_text_file

### insert a blank line above every line which matches "regex"

     sed '/regex/{x;p;x;}'

### Modificando a profundidade de cores do xorg.conf

      sed -i.backup 's/\(DefaultDepth\s\+\)24$/\116/g' /etc/X11/xorg.conf

No caso acima há um bocado de expressões regulares, para este assunto
sugiro o guia do Aúrélio.  Vou tentar traduzir a expressão regular acima:
o sed está fazendo

    sed -i.backup 's/isto/aquilo/g'

1 - Referenciamos um grupo que contém DefaultDepth junto com um
ou mais espaços \s\+ tudo isto agrupado dentro de
parênteses "que tem que ser protegidos com contrabarra
o que gera isto:

    \(DefaultDepth\s\+\)

este grupo que está dentro dos parênteses é colado
lá na substituição \1 isto cola o grupo acima

2 - O valor '**24**' literal

3 - Referência ao final da linha '$'

4 - Agora entra a substituição

\1 ............. DefaultDepth + espaços
16 ............. Valor que deverá substituir o 24

### Desabilitando terminais
No ubuntu a inicialização dos terminais fica em arquivos /etc/event.d/tty[1-6]

       sed -i.backup '6,7s/^start/stop/g' /etc/event.d/tty[3-6]

### Removendo linhas em branco em excesso

      sed '/./,/^$/!d'

### Removendo aprenas as duas primeiras linhas

    sed '1,2d' file

Se desejar apagar definitivamente use a opção `-i`

### Removendo caracteres hexadecimais

      sed -i 's/%0d//g' arquivo

### Probleminha postado na lista sed-br

``` markdown
Alow pessoal,

Gostaria de uma ajudinha...
Tenho diversos arquivos que com uma saida do tipo:

in=/dir/subdir1/subdir2/subdir3/subdirN/ArquivoN.EXT
onde N podem ser diversos subdiretorios....

gostaria de estar substituindo tudo que vier depois de = até a última barra
(/ARQUIVO1.EXT) pelo diretorio corrente (`pwd`/ArquivoN.EXT).
```

Sempre há um jeitinho mais fácil né?


    sed -i 's/^.*\///g' file ArquivoN.EXT

Isto vai te dar somente o nome: ArquivoN.EXT

    substitua ^ 'começo de linha' seguido de qualquer
    coisa até uma barra \/ (também pode ser assim [/])
    por nada //. Obs: nesta dica aproveitamos uma regex gulosa,
    quando dizemos até uma barra a regex sai comendo tudo
    até achar a última barra :)

Se você quizer colocar o nome resultante entre parênteses
por exemplo pode usar grupos \(grupo1\) protegendo os parênteses

    sed -i  's/^.*[/]\(.*\)/(\1\)/g' file

veja depois da barra [/] o  .* quer dizer
tudo o que vem depois, se quizer manipular isto
coloque em um grupo, que é o que fazemos abaixo:

    sed -i 's/^.*[/]\(.*\)/in=\1/g' file
    in=ArquivoN.EXT

**Solução final**
Desde ontem fiquei pensando neste problema e
me dei conta no quanto poderia-mos aprender com ele, vejam
onde chegamos


    sed "s,^.*[/]\(.*\),`pwd`/\1,g"

Acima mais uma dica de ouro, use aspas duplas se desejar
que o bash faça a expansão das variáveis

Outra dica, para não ter que usar um monte de barras
protegidas trocamos o delimitador do sed de "/" para ","

### Removendo kernels antigos
* fonte: http://ubuntued.info/ganhe-espaco-removendo-kernels-antigos

    dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r |
    \sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge


### trocando caracteres no final de uma string longa
fonte: http://br.groups.yahoo.com/group/shell-script/message/30120

Ola pessoal,
estou tendo dificuldade em gerar um determinado resultado. Eu tenho uma
sequência de registros que terminam com || (dois pipes). Eu preciso
alterar || (dois pipes) por |0|0 (pipe zero pipe zero). Tentei fazer o
seguinte:
O registro está da seguinte forma:

``` markdown
JÚNIOR|1|1|Brasil|1|Solteiro(a)|0|321379299|SSP|2|SP|45109|00234|00797816098|2|B
|VERA LUCIA DE SOUZA SANT"ANA|JANDIR SANT"ANA||
```

(Resposta do Cristian Silva)
Depois que eu vi que ele queria só a última ocorrência - o Jimmy já matou -
mas podia ser assim tb (usando variáveis de memória):

    sed 's/\(.*\)||/\1|0|0/' < arquivo

### manipulando strings complexas
Eu tenho linhas assi:

``` markdown
[wikispaces](wikispaces.md)
```

e desejo pegar somente os nomes tipo sed.md
a solução veio assim

``` sh
cd ~/.vim/wiki
LINUX_CMDS=$(cat ~/.vim/wiki/comandoslinux.md | shuf -n 1)
#echo $LINUX_CMDS | sed 's,^.*(\([^)]*\)),\1,g'
CMD=$(echo $LINUX_CMDS | sed 's,^.*(\([^)]*\)),\1,g')
echo "arquivo $CMD"
awk 'BEGIN { RS="/#+.*$/"; FS="$"} {print NF}' $CMD
```
O objetivo final será pegar somente os comandos linux, por isso
leio o conteúdo de comandoslinux.md, daí vou pegar um nome aletório
provavelmente usando o comando shuf e finalmente exibir uma seção aleatória de um dos manuais durante o login no shell ou possivelmente crie uma função dica de comando que posso chamar através de um nome tipo: cmdtip

Com o awk podemos pegar o número de campos de um arquivo markdown assim:

``` sh
awk 'BEGIN { RS="/#+.*$/"; FS="$"} {print NF}' $LINUX_CMDS
```

Posso então pegar a quantidade de registros e indicar ao awk um valor alatório

``` sh
awk 'BEGIN { RS="/^###.*$/"; FS="$"} {print $122}' awk.md
```


### Referências:
* http://www.zago.eti.br/sed.txt
* http://sed.sourceforge.net/sed1line.txt
* [[http://unixhelp.ed.ac.uk/CGI/man-cgi?sed|man sed]]
* http://pt.wikisource.org/wiki/Dominando_o_SED
* http://aurelio.net/sed/sed-HOWTO/index.html
* http://sed.sourceforge.net/local/docs/emulating_unix.txt
* http://stackoverflow.com/questions/2372719/

`vim: ft=markdown et sw=4 ts=4`
