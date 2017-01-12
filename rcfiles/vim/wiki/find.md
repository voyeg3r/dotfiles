### Introdução

``` markdown
File:		 find.md
Created:	 qua 11 jan 2017 14:42:46 BRT
Last Change: qua 11 jan 2017 14:42:49 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

O comando find é extremamente poderoso veja algumas construções do mesmo

### procurando arquivos ocultos

``` sh
find -iname \.\*
```

### limpando a pasta /tmp

``` sh
find /tmp -type f -atime +1 -delete
```

### busca arquivos no path

``` sh
find ${PATH//:/ } -iname "*admin*" -executable -type f
find ${PATH//:/ } -executable -type f -printf "%f\n" #exibe só o nome
```

### Editar o arquivo mais recentemente criado

``` sh
vim `find -type f -cmin -10 | head -n1`
```

### doc ou odt?

``` sh
find ~/ -iregex ".*\(doc\|odt\)"
```

### localizando arquivos de hoje

``` sh
find . -type f -ctime -1
```

Uma variação possível - Mostrando de forma detalhada

``` sh
find . -type f -ctime -1 -ls
```


### localizando arquivos modificados em um intervalo de tempo

``` sh
find ./ -mtime +6 -mtime -8 -print
```

### combinando o find com o xargs

``` sh
find . -type f -maxdepth 1 -name '*.ext' -print0 |  xargs -0 comando
```

### copiando estrutura de pastas (somente pastas)

``` sh
(cd /home/user/source/; find -type d -print0) | xargs -0 mkdir -p
```

### Atribuindo propriedade
isto tem que ser feito como root

``` sh
find ~ ! -user fulano -print0 | xargs -0 chown fulano:fulano
```

Outra opção seria

``` markdown
chown -R fulano.fulano
```


### melhorar desempenho do firefox

``` sh
find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
```

### deletar diretórios vazios

``` sh
find . -type d -empty -delete
```

``` sh
find <top_level_dir> -depth -type d -empty -exec rmdir -v {} \;
```


### adicionando extensão a arquivos
Eu tinha um monte de arquivos sem extensão e queria colocar
no final txt, segue a solução.

``` sh
find ./ -maxdepth 1 -type f -print0 | xargs -0 -i mv ./{} ./{}.txt
```


### Procurando por um padrão no $PATH


``` sh
find ${PATH//:/ } -iname "*pattern*"
```


### Apagando somente arquivos de um tipo

``` sh
find ./clipart -type f -iregex '.*\.[^svg]$' | xargs -rm f
```

Se a intenção é apagar apenas

``` sh
find . -name '*' -print0 | xargs -0 rm
```

### localizando arquivos duplicados usando [[md5sum]]

``` sh
find -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 33 | cut -c 35-
```

outra opção

``` sh
find "$@" -type f -print0 | xargs -0 -n1 md5sum | sort --key=1,32 | uniq -w 32 -d --all-repeated=separate
```

1) Find all files.
2) Pipe the filenames to xargs.
3) Which will run md5sum on each filename and pipe the output to sort.
4) Which will sort the output based on the first 32 characters (the checksum) and pipe the output to uniq.
5) Which will find the unique checksums by only looking at the first 32 characters. The options to the uniq command cause it to print each duplicate (and only duplicates) on a separate line.

### usando alternativas

``` sh
find -iname *.doc -o -iname *.odt
find -atime +5 \( -name "*.o" -o -name "*.tmp" \)
```


### find + tar

``` sh
find /home/zago/guiaz -mtime -1 -type f -print | tar jcvf meusarq.tar.bz2 -T -
```


### Localizando arquivos maiores que 3G


``` sh
find . -type f -size +3G | xargs -I% du -sh %
```


### find + rsync

``` sh
rsync -avz -e ssh --files-from=<(find -mtime +30 -mtime -60) origem destino
find . -name "whatever.*" -print0 | rsync -av --files-from=- --from0 ./ .
```


### copiar arquivos

``` sh
find /originalPath/ -iname \*.mp3 -print0 | xargs -0 -i cp ./{} /destinationPath/
```

# ou

``` sh
find . -name '*.mp3' -print0 | xargs -i -0 cp {} </path>
```

outro exemplo

``` sh
find . -name "*.pdf" -print0 | xargs -0 cp -ft downloads/
```

Observe também a opção -u do comando cp que faz com que o cp
copie apenas se o arquivo copiado for mais novo, ou seja, se
no destino houver o mesmo arquivo que está sendo copiado, a cópia
só será efetivada se o arquivo de origem for mais novo.


O comando abaixo exibe arquivos modificados a mais de 7 dias (somente o nome e data)

``` sh
find ~/ -mtime +7 -printf "%f %AD\n"
```

Arquivos criados a menos de dez minutos e "-and -a" com extensão txt

``` sh
find ~/ -cmin -10 -a -iname *.txt
find ~/ -size +500M

find ~ -size +10000 -a -iname *.pdf
```

### arquivos com exatamente 1000 caracteres

``` sh
find . -size 1000c
```

### Arquivos entre 599 e 701 caracteres

``` sh
find . -size +599c -and -size -701c
```

### Buscando em dois diretórios htdocs e cfi-bin

``` sh
find htdocs cgi-bin -name "*.cgi" -type f -exec chmod 755 {} ;
```

### Contar quantos txt há em minha pasta pessoal "~/" (combinando com o comando wc)

``` sh
find ~/ -iname *.txt | wc -l
```

### Mostra todos os arquivos pdf que não sejam maiores que 2000 bytes
tudo que estiver após a exclamação será negado.

``` sh
find ~/ -iname *.pdf ! -size +2000
```

### Invertendo a lógica do comando acima no primeiro caso tirando a exclamação, no segundo invertendo o sinal de + para menos, veja:

``` sh
find ~/ -iname *.pdf -size +2000
```

ou

``` sh
find ~/ -iname *.pdf ! -size -2000
```

### Procura pdf's de tamanho maiores que 2000 bytes e mostra somente o nome sem o caminho "basename"

``` sh
find ~/ -iname *.pdf -a -size +2000 -exec basename {} ;
```

### Procurar por arquivos de um usuário especifico

``` sh
find / -user sergio
find . -user root
```

### Busca com opções. No caso arquivos html ou htm

``` sh
find ~/ ( -name *.htm -o -name *.html ) -atime +5
find ~/ -iregex '.*html?' -atime +5
```

### **Observações importantes** mudar permissão somente em diretórios "-d"

``` sh
find . -type d -exec chmod 755 {} ;
```

    Note: `chmod -R 755 ./*`   também aplica a modificação mas também pega arquivos

### Usando o find com o xargs
Usando o parâmetro -exec ele executa cada vez que acha o arquivo, repassando via pipe "|" para o comando xargs o find faz primeiro as buscas tornando-se mais rápido.

``` sh
find   ~/ -type f  -print  |  xargs  rm -rf
```

``` sh
find /originalPath/ -iname *.mp3 -print0 | xargs -0 -i cp ./{} /destinationPath/
```

### Procure no diretório atual "." arquivos "f"
imprima a lista "-print" filtre com o egrep ignorando maiúsculas e minúsculas "i" a "expressao".

``` sh
find . -type f -print | xargs egrep -i "expressao"
```

### Procurando todos os mp3 e exibindo o espaço ocupado por eles

``` sh
find . -name \*.mp3 -print0|xargs -0 du -ch
```

### Encontrando arquivos que não contenham extensão .c ou .o

``` sh
find ~/docs -type f | egrep -v '.[oc]'
```

**Qual a diferenca entre os comandos abaixo?**

``` sh
find . -user queiroz -exec ls {} ;
find . -user queiroz -print | xargs ls
```

A diferenca e que no primeiro find o comando ls e executado uma vez para cada
arquivo encontrado. Se forem encontrados 1000 arquivos o comando ls sera
executado 1000 vezes.

Ja no segundo exemplo, com a saida do find redirecionada para o comando xargs,
o comando ls sera executado sobre um grupo de arquivos de cada vez e nao uma
vez para cada arquivo. O que ira determinar o numero de vezes que o comando
xargs executara o comando ls e justamente o tamanho da linha de comandos. O
comando xargs ira dividir a saida gerada pelo comando find em blocos
compativeis com a capacidade do sistema de maneira a que nao ocorra um erro
quando da execucao, em nosso caso, do comando ls.

Em outras palavras, suponhamos que o comando find descubra 2000 arquivos sobre
os quais o comando xargs devera executar o comando ls. O limite maximo de
arquivo sobre os quais o comando ls pode atuare de 500. O comando xargs
automaticamente realizara a divisao desta entrada em quatro blocos de 500
arquivos.

Concluindo, o comando xargs e bem mais eficiente do que a diretiva -exec do
comando find, por exigir menos recursos computacionais para executar a mesma
tarefa. uma vez sobre todos os arquivos encontrados.

Veja o comando abaixo (ainda não testado) procure em /tmp arquivos com tempo de acesso superior a sete dias "-atime +7" e "and" usuário corrente $USER, redirecione através do xargs para o comando de remoção "rm", sem fazer perguntas -f

``` sh
find /tmp -atime +7 -type f -a -user $USER | xargs rm -rf
find /tmp -atime +7 -type f | xargs rm -f
```

### Procura todos os arquivos suid e setgid executables:

``` sh
find / ( -perm -4000 -o -perm -2000 ) -type f -exec ls -ldb {} ;
```

### Redirecionando o erro padrão  "2>/dev/null"
para desviar as mensagens
de erro por acesso não root

``` sh
find / -type f -name dummy 2>/dev/null
```

#### Parâmetros
 ``` sh
 -ctime
 -mtime
 -atime
 -cmin
 -amin
 -mmin
 -user
 -nouser
 -uid
 -gruop
 -gid
 -and  ou  -a
 -or ou -o
 -size
 -name
 -iname
 ```

### Usando ''printf''
O argumento -printf pode receber vários parâmetros

``` sh
find ~/ -iname *.txt -printf %f\n   "\n faz quebra de linha"
```

``` sh
These are used the most:
%p    imprime o nome do arquivo com o caminho
%m    permissions of file, displayed in octal.
%f    imprime o nome do arquivo sem o caminho
%g    name of the group the file belongs to.
%G    gid
%U    uid
%h    display name of directory file is in, filename isn't included.
%u    username of the owner of the file
%c    imrprime -ctime
%a    tempo de acesso
%m    imprime modo de permissão (formato octal)

 %A(caractere)  - devolve o "atime" (tempo de acesso)
%AD   imprime a data tipo dia/mes/ano (data de acesso)
%AH   imprime a hora
%AT   /hh/mm/ss
%A+   data e tempo separados pro "+"
%Ax   mm/dd/aaaa
```

``` sh
find ~/ -iname *.txt -printf "%f %Ax %AT \n"
```

** O comando acima exibe arquivos assim:**

``` sh
nome        data         hora
serii.txt   04-01-2007   12:42:07

%C(caractere)  "ctime"
%T(caractere)  "mtime"
```



### Um último exemplo

``` sh
find . -iname *.txt -printf "%p %m %AA %Ad de %AB de %AY %AX\n"
```

isto retorna algo como:

``` sh
/caminho/leia-me.txt 644 sexta 23 de junho de 2006 10:30:53
```


### Para imprimir o nome do arquivo com o modo de permissão octal use

``` sh
find ~ -iname *.txt -printf "%p %m\n"
```

### acrescentando o parâmetro %a retorna o ultimo acesso de acordo com "-ctime"

``` sh
find ~ -iname *.txt -printf "%p %a %m\n"
```

### printf com os parâmetros "%p %m %Ax\n"  retorna algo como

``` sh
/caminho/leia-me.txt 644 23/06/06
```

### printf com os parâmetros "%p %m %g %u %Ax\n"  retorna algo como

``` sh
/caminho/leia-me.txt usuario grupo 644 23/06/06
```

``` sh
-printf "%f %u %g %m %Ax %AX\n"  veja detalhes abaixo
%f nome sem o caminho
%u usuário
%g grupo
%m modo de permissão
%Ax dada de acesso no modo dd/mm/aa
%AX hora de acesso do tipo 18:15:23
\n quebra de linha
```

### Usando Expressões regulares

``` sh
$ find . -regex './ch0[1-2]_0[1-3].*'
./ch01_01.html
./ch01_02.html
./ch02_01.html
./ch02_02.html
./ch02_03.html
```

### How do I search for files, then do something with the result?

* Find all .conf files, then search through them to see if they contain any IP
  addresses, then print the filename, line number and the line containing the
  address

``` sh
find /etc -name *.conf -exec grep -Hn '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' {} ;
```

### Fazendo um backup

``` sh
tar -zcvf ultimamod.tar.gz `find . -mtime -1 -type f -print`
```

### Outros exemplos

Localizar todos os arquivos do tipo txt gerados nos últimos 20 minutos, menos
os cookies do navegador, que são cosntantemente gerados e não devem ser
buscados

``` sh
find ~/ -iname *.txt -cmin -20 | grep -v "cookies"
```

Usando expressões regulares

 ``` sh
  find . -regex './ch0[1-2]_0[1-3].*'
 ./ch01_01.html
 ./ch01_02.html
 ./ch02_01.html
 ./ch02_02.html
 ./ch02_03.html
 ```

### Limpando miniaturas de imagens no nautilus

``` sh
find ~/.thumbnails -type f -atime +7 -exec rm {} ;
```



manual do find "man find"

``` sh
find ~/ -iname "*.odt" -ctime -3
```

### procura arquivos odt criados nos últimos 3 dias

``` sh
find ~/ -iname "*.odt" -o -iname "*.pdf"
```

# procura arquivos odt ou pdf


``` sh
find . -regex './ch0[1-2]_0[1-3].*'
```

# procura arquivos usando expressões regulares

``` sh
find ~/ -type f -print0 | xargs -0 chmod 755
```

# usando o print0 conseguimos pegar arquivos com nomes que contenham espaços


``` sh
find /originalPath/ -name *.mp3 -print0 | xargs -0 -i cp ./{} /destinationPath/

find ./ -maxdepth 1 -iname "*.doc" -print0 | xargs -0 -i cp ./{} /home/germana/Desktop/
```


Contar o tamanho do nome de arquivos
fonte: http://br.groups.yahoo.com/group/shell-script/message/25733

vc pode utilizar o find + expressões regulares para procurar um padrão
com mais de 32 caracteres quaisquer

padrão: .{32,} (minimo 32, maximo otimido)
tipo: posix-extended

usando maxdepth 1 para procurar no diretorio informado:

``` sh
$ find . -maxdepth 1 -regextype posix-extended -regex '.{32,}'
 ./ColaboracaoDetalharActionTest.java
 ./RepositorioDeUsuariosCadun.java
 ./ColaboracaoDetalharAction.java
 ./Formulario_flexibiliação_novo07VR.pdf
```

detalhe que o find considera ./ como parte do nome do arquivo, mas ai
basta procurar por .{34,}

Para gerar a lista com todos os arquivos com nome maior que 32 caracteres
você pode fazer algo assim:

``` sh
$ \ls -1 | egrep .{32}
```

Nesse caso ele vai pegar qualquer nome listado pelo comando "ls" e o grep
vai filtrar apenas os que tem 32 caracteres ou mais.

### Referências
* http://ubuntuforums.org/showthread.php?t=330093
* http://www.dicas-l.com.br/dicas-l/20050226.php → Artigo do Júlio César Neves
+ http://www.zago.eti.br/find.html
+ http://www.tldp.org/LDP/abs/html/index.html
+ http://www.absoluta.org/
+ http://www.linux.ie/newusers/beginners-linux-guide/find.php
+ http://www.oreilly.de/catalog/unixcd/chapter/c02_077.htm
+ http://www.mattwalsh.com/twiki/bin/view/Main/UsingTheFindCommand

