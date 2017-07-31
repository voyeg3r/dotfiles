### Introdução
filtrar strings em textos

### filtrar um arquivo pelo outro

   grep -f file1.txt file2.txt

### pegar ocorrência exata

    grep -w '172.17.4.1' file.txt

# listando apenas opções de um comando

    man aria2c | grep -Ew -- '-{1,2}[a-zA-Z][^ ] ' -

# teste de exepressão regular para pegar opções
-{1,2}[][a-zA-Z][^ ]*
 -{1,2}[^ ][a-zA-Z-]*(\=[a-zA-Z-]*|[ ][A-Z])?

### Como dizer ao grep para tratar "-L" como string

grep -- '-L' <(man gcc)

### testar quais scripts tem o famigerado final de linha DOS ^M

grep -ril '[\x0d]' /scripts

# outra forma
grep -rl $'\r' /scripts

Obs: ainda não testei porque estou no rwindows

### Apenas listar arquivos que contém um padrão
A opção 'l' do grep faz com que ao invés de listar as linhas encontradas o grep
liste apenas os arquivos que correpondem ao padrão.

 grep -ril pattern .

Usando esta dica podemos fazer uma busca com o grep e em seguida

vim `!!`

### listar linhas do arquivo 1 que não estão no arquivo 2

grep -Fxv -f file1 file2

### listar somente trechos que correspondem ao padrão buscado
Neste caso não imprime a linha que contém o padrão, por exemplo, mostrar palavras entre aspas
se você tiver um arquivo assim:

"word with quotes" other without, more text "new word", "more"
mais palavras com "aspas" para teste de "uso do grep" com a
opção "-o" que apenas retorna o padrão, no caso vou usar ...

pode retirar as palavras com aspas assim

grep -o '"[^"]*"' teste.txt

# para pegar a primeira ocorrência entre parênteses (incluindo os parênteses)
cat texto | grep -o '[(][^)]*[)]' | head -1

### filtrar comandos no histórico
O comando abaixo filtra comandos que começam com a palavra man dentro do histórico.

history | grep ' [0-9]* man'


### Imprimir texto na vertical

echo "vertical text" | grep -o '.'

### Processar listagens de arquivos
Se houverem muitos arquivos fora do padrão unix, ou seja, com espaços no nome
e desejar-mos copiar estes arquivo poderia-mos fazer algo assim

grep -lZ "pattern" * | xargs -0 cp -t /target-dir
grep -Hrli 'foo' * | xargs vim

### filtrando caracteres de controle
* fonte: http://unstableme.blogspot.com/2009/10/grep-and-print-control-characters-in.html

$ grep --version
GNU grep 2.5.3
# I can grep for any control characters like this:
$ grep '[[:cntrl:]]' /tmp/file.txt
$ grep '[[:cntrl:]]' /tmp/file.txt | less

Se você sabe exatamente o que buscar pode fazer assim por exemplo ^B (hex \x02)

$ grep ^B /tmp/file.txt
# * ^B to be typed as ctrl V and ctrl B


Para encontrar caracteres não imprimiveis há um outro jeito, usando
classes POSIX

$ grep '[^[:print:]]' /tmp/file.txt

Para imprimir caracteres não imprimiveis usando o comando cat faça


$ cat -v -e -t /tmp/s

### remover linhas em branco

    grep -v '^$' input.txt > output.txt

    grep . inpute.txt > output


Você pode fazer um teste interativo assim

    cat <<-EOF | grep .
    linhas com algo

    linha com texto

    linha
    EOF

### contador do grep
A opção "-c" do grep apenas exibe a contagem

    file -i * | grep -ic 'text/plain'

 O comando grep é mais frequentemente usado para localizar
 a ocorrência de um determinado texto em um ou mais
 arquivos. Mas podemos também usá-lo para determinar
 o número de vezes em que um texto ocorre.

Por exemplo, para determinar o número de linhas em que
a palavra "be" ocorre no arquivo
AsPalavrasMaisComunsdaLinguaInglesa.txt:

  $ grep -c be AsPalavrasMaisComunsdaLinguaInglesa.txt
  346

Apenas com a diretiva "-c" o grep irá contar como acerto
mesmo locais em que "be" seja parte de uma outra palavra,
como por exemplo "become".

Para contar apenas as ocorrências de "be" como uma palavra,
acrescentamos a diretiva "-w":

  $ grep -wc be AsPalavrasMaisComunsdaLinguaInglesa.txt
  97

### Mostrar linhas anteriores ou posteriores
Use as opções -A ou -B do grep. O "-A" mostra linhas após "after" e o "-B" mostra linhas anteriores "before"

    grep -in -A 2 "postfix" /etc/passwd

34:postfix:x:114:123::/var/spool/postfix:/bin/false
35-nx:x:115:65534::/usr/NX/home/nx:/usr/NX/bin/nxserver
36-clamav:x:116:125::/var/lib/clamav:/bin/false

### Opção de contexto
Para exibir as linhas anteriores e posteriores a um padrão

    grep --context=5 'pattern' file


### Para usar expressões regulares extendidas
Use a opção -E do grep
### filtrando uma palavra em um tipo de arquivo específico

    grep -r --include="*.[ch]" pattern .
    find . -name "*.[ch]" | xargs grep "TODO"

### Intercessão entre dois arquivos


``` markdown
Tenho dois arquivos txt:
arq1:
30
72
183
427
1298
1315
2008
2794
5825
....

arq2:
22 Joao da Silva 12/2008 22/01/77
30 Zezinho das Couves 07/2004 15/09/68
427 Maria do Zé 03/2002 22/03/81
428 Jubencio da Zinha 10/2007 28/06/64
....
```

    for i in $(car arq1.txt); do
       grep "^$i" arq2.txt
    done

outro modo de fazer

    grep -f <(cat arq1.txt | xargs -i echo ^{}) arq2.txt


### Mostrar linhas próximas a um padrão

    > Uma dúvida amigos tenho o seguinte:
    >
    > aaaaaaa pedro01 bbbbbbbb ccccccc
    > ccccccc dd ddddddd hhhhhhh
    >
    > aaaaaaa rodrigo bbbbbbbb ccccccc
    > ccccccc dd ddddddd hhhhhhh
    >
    > aaaaaaa pedro01 bbbbbbbb ccccccc
    > ccccccc dd ddddddd hhhhhhh
    >
    > eu preciso que sempre q ele encontrar
    > pedro que ele me mostre além do pedro a linha
    > abaixo dele, mas só se encontrar pedro
    > agradeço toda a ajuda.



    grep 'pedro' -A1 texto

    Filtra ocorrência de palavras em arquivos


     grep -rn --color "\<vim\>" ~/

### Contar ocorrências repetidas

 ``` markdown
  Tenho um arquivo que tem a seguinte saida:

  29 18 02 15 10 39
  08 38 60 41 15 09
  06 08 04 01 25 28
  26 25 42 60 05 24
  44 40 58 29 03 20
  04 54 55 36 16 31

  Gostaria de saber se esta é uma boa saida para contar as dezenas que se
  repetem por coluna:

  Supondo que eu digitasse a dezena 29:

  cat arq.txt | cut -d " " -f1|grep 29 | uniq -c

 Seria o mesmo que:

 $ grep -co 29 arq.txt ??

 $ grep -co 29 arq.txt
 2

 ```

### contar ocorrências de um nome em um diretório

     grep -icr "sergio" .wiki | awk -F":" '{total=total + $2} END {print total}'

### Mais exemplos

     cat -v -e -t dump                       # show non-printing characters too
     grep BOB tmpfile                        # search 'tmpfile' for 'BOB' anywhere in a line
     grep -i -w blkptr *                     # case insensitive search all files in the current directory for the word blkptr
     grep run[- ]time *.txt                  # find 'run time' or 'run-time' in all txt files
     grep smug files                         # search files for lines with 'smug'
     grep '^smug' files                      # 'smug' at the start of a line
     grep 'smug$' files                      # 'smug' at the end of a line
     grep '^smug$' files                     # lines containing only 'smug'
     grep '\^s' files                        # lines containing '^s', "\" escapes the ^
     grep '[Ss]mug' files                    # search for 'Smug' or 'smug'
     grep 'B[oO][bB]' files                  # search for BOB, Bob, BOb or BoB
     grep '^$' files                         # search for blank lines
     grep '[0-9][0-9]' file                  # search for pairs of numeric digits
     grep '^From: ' /var/spool/mail/$USER    # list your mail
     grep '[a-zA-Z]'                         # any line with at least one letter
     grep '[^a-zA-Z0-9]                      # anything not a letter or number
     grep '[0-9]\{3\}-[0-9]\{4\}'            # 999-9999, like phone numbers
     grep '^.$'                              # lines with exactly one character
     grep '"smug"'                           # 'smug' within double quotes
     grep '"*smug"*'                         # 'smug', with or without quotes
     grep '^\.'                              # any line that starts with a Period "."
     grep '^\.[a-z][a-z]'                    # line start with "." and 2 lc letters
