# Como funciona o awk

``` markdown
File:		 ComandoAwk|Awk.md
Created:	 ter 10 jan 2017 18:23:29 BRT
Last Change: ter 10 jan 2017 20:07:38 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```


Bem, este post veio por causa deste comentário.
De forma simples o awk trata textos e streams assim:

    awk [padrão] ação

Observe que o padrão pode ser omitido, caso queira usar o padrão pode usar expressões regulares
Vamos aos exemplos:

    echo "um dois" | awk '{print $2}'

omitimos o padrão, ou seja pedimos apenas a ação, no caso imprimir a segunda coluna

    echo "um dois" | awk '{print $2, $1}'

Acima pedimos ao awk que invertesse a posição das colunas

    awk -F: '/sergio/ {print $1}' /etc/group

Acima algo novo (o separador de campos padrão do awk é o espaço) para indicar
um separador diferente usamos '-F' seguido do separador. Estamos pegando o campo 1 do
arquivo /etc/group, estamos pedindo que imprima somente as linhas que contém o padrão sergio. /sergio/

Para imprimir somente as linhas pares

    seq 10 | awk '$1 % 2 == 0 {print}'

Como pegar o endereço IP?

    ifconfig eth0 | awk '/inet addr/ {print $2}'

Se desejar limpar mais a saida pode usar o cut
Como pegar usuários com GID acima de 1000

    awk -F: '$4 > 1000 {print}' /etc/passwd

Acima estou dizendo ao awk que o separador de campos é dois pontos e que
se o campo 4 for maior que 1000 o mesmo deve ser impresso

Como pegar a segunda coluna da quinta linha?
Considrando que o arquivo seja separado por espaços, faça:

    awk 'NR==5 {print $2}' arquivo

Algon novo aqui --> NR significa número do registro, para o awk cada linha
é um registro, portanto 5ª linha é igua a NR==5

procura e mostra linhas com o terceiro campo igual a "peter" ou que contenham o string "marie":

``` sh
cat nomedoarquivo | awk '$3 == "peter" || $3 ~ /marie/'
```

### Variáveis do awk
```
NR Contém o número do registro atual
NF contém o número de registros por campo
FS indica o separador de campos
RS indica o separador de registros
OFS indica o separador de campo do arquivo de saida
ORS indica o separador de registros do arquivo de saida
```

indicando o separador de saída

    awk -F: '{OFS="-"}{print $1,$6}' /etc/passwd

Imprimir o nome dos grupos que tiverem como membro o usuário sergio

    awk -F":" '$4 ~ /sergio/ {print $1}' /etc/group

Imprimir cada registro (linha) numerada "NR" usando Número do Registro

    awk -F":" '{ print NR " " $0 }' /etc/passwd

#  Awk: como imprimir os registros que contenham um determinado padrão?
Imagina que você tem um arquivo assim

``` sh
HostName: Empresa1-AD1
TaskName: Veracid
Last Result: 1
Start Time: 07:00:00
Start Date: 18/12/2011
Power Management: No Start On Batteries, Stop On Battery Mode

HostName: Empresa2-AD1
TaskName: Veracid-01
Last Result: 0
Start Time: 08:00:00
Start Date: 18/12/2011
Power Management: No Start On Batteries, Stop On Battery Mode

HostName: Empresa1-AD2
TaskName: Veracid-02
Last Result: 01d
Start Time: 18:00:00
Start Date: 17/11/2011
Power Management: No Start On Batteries, Stop On Battery Mode
```

E deseja imprimir os blocos (Registros) em que o campo
3 "Last Result:" não termine com zero

A solução em awk fica assim

``` sh
awk 'BEGIN {RS="";FS="\n"} {if ($3 ~ /[^0]$/) print $0,"\n"}' teste.txt
```

### um comentário a cada 5 linhas

    ls -l | awk '{if (NR % 5 == 0) print "-- COMMIT --"; print}'

### zerando a primeira coluna

    awk '{$1=""; print}'

### Substituição de um padrão - usando a função sub

    echo "isto aquilo" | awk '{ sub(/aquilo/, "aquele"); print }'

### Substituindo o terminador de linha
**Convert Windows/DOS newlines (CRLF) to Unix newlines (LF) from Unix.**

    awk '{ sub(/\r$/,""); print }'

**Convert Unix newlines (LF) to Windows/DOS newlines (CRLF) from Unix.**

    awk '{ sub(/$/,"\r"); print }'

**Substitute “foo” with “bar” only on lines that contain “baz”.**

    awk '/baz/ { gsub(/foo/, "bar") }; { print }'

### imprimir um intervalo

    awk '/start_pattern/,/stop_pattern/' file.txt

### colocando em maiúsculas

    echo "um dois" | awk '{print $1, toupper($2)}'

# Concatenando linhas
**Concatenate every 4 lines of input with a comma.**

    awk 'ORS=NR%4?",":"\n"'

O comando acima resolve questões como esta:
[esta: ](@http://br.groups.yahoo.com/group/sed-br/message/4369)

``` sh
Senhores,
Ainda não consegui achar uma solução, tem um arquivo que ele assim:

dn: uid=xx,ou=Usuarios,dc=bbbb,dc=com,dc=br
cn: fulano de tal
homePhone: 053922
mail: fulano@...
dn: uid=yy,ou=Usuarios,dc=bbb,dc=com,dc=br
cn: beltrano de tal
homePhone: 053923
mail: beltrano@...

Isso se repete, sempre, dn:, cn: homePhone: e mail:, gostaria de deixar
ele dessa forma:

dn: uid=xx,ou=Usuarios,dc=bbbb,dc=com,dc=br;cn: fulano de tal;homePhone:
053922

em coluna para cada 4 linhas do arquivo. Alguém tem alguma idéia de como
fazer isso?
```

### Calculadora com awk

``` sh
# coloque no seu ~/.bashrc
calc(){ awk "BEGIN{ print $* }" ;}
```

### Exibindo os maiores arquivos
Insira estas linhas no bashrc

``` sh
biggest () {
du | sort -r -n | awk '{split("k m g",v); s=1; while($1>1024){$1/=1024; s++} print int($1)" "v[s]"\t"$2}'
}
```

em seguida pode abrir outro terminal e fazer

    biggest | head -20

### retirar ultimo diretório de uma lista

    echo /teste/teste1/teste2/teste3 | awk -F"/" '{print $NF}'

    -F"/" = especifica / como divisor de campo
    $NF = último campo

### Ordenando strings por tamanho

    awk '{ print length($0),$0 | "sort -n"}'  file

### Imprimindo linhas maiores que

    awk 'length>72' file

### Somando listas

    ls -la | awk 'BEGIN{count=0}; {count++; print $5} END{ print "Total:", count}'

outro exemplo

    awk '{sum+=$2} END {print sum}' arquivo

### Trocar de posição os campos 1 e 2 de um arquivo e imprimir a linha

      { temp = $1 ; $1 = $2 ; $2 = temp ; print }

  Um outro jeito mais inteligente!

      '{print $2,$1}'

### imprimindo linhas impares

    cat -n /etc/passwd | awk '$1 % 2 == 1 {print}'

### Combinando com ls

    ls -l | awk ’$6 == "Nov" { sum += $5 }
    END { print sum }’


### Localizando processos por usuário

     ps aux | awk '!/root|nobody/ { if ($4>2) {print $2,$11}}'

### Pegar coluna de linha especifica

``` sh
#exemplo da coluna 2 na linha 5
awk 'NR == 5 {print $2}'
```

### imprimir primeira coluna da linha 2

    awk 'NR==2 {print $1}' arquivo

### somando números em um arquivo

    awk '{s+=$0} END {print s}' /tmp/file.txt

# somando os 10 primeiros números


``` sh
$ seq 10 | awk '{ i+=$1 } END { print i }'
55
```

### Opção com o paste + bc para somar numeros em um arquivo

    paste -sd+ /tmp/file.txt | bc



### Imprimindo linhas de um intervalo
[fonte:](http://br.groups.yahoo.com/group/shell-script/message/31705)

    awk 'NR >= 27 && NR <= 99' file.txt > /tmp/file3


``` sh
Srs.,

Boa tarde!

Gostaria de uma ajuda para solucionar este desafio(pra min..rs).
Desejo capturar um intervalo de linhas separadas por chaves.

ex:

#arquivo teste
primeira_linha
teste{
linha1
linha2
linha3
}
ultima_linha

Gostaria de saber qual comando posso utilizar para que seja possivel jogar o que
esta entre chaves para alguma variavel:

linha1
linha2
linha3

desde já agradeço atenção!

att,
Cleberson.
```

### solução

    cat teste.txt | awk '/teste{/,/}/' | grep -v '{\|}'


### Pegando o número ip

``` sh
ifconfig eth0 | awk '/inet add/ {print $3}'
awk '/inet addr/ {print $2}' <(ifconfig eth0)
```

No caso acima pedimos para listar o endereço atualmente
atribuido à interface de rede eth0 (lembre-se que em alguns sistemas
a interface padrão pode ser eth1). Em seguida a saída
que deveria ser mostrada na tela é redirecionada para o awk.
O awk por sua vez procura pelo padrão "inet end" e imprime o
terceiro campo retornando somente o ip.

### Pegando o endereço do roteador

    awk 'NR==2 {print $1}' /proc/net/arp

A explicação: Mostre o campo 1 '$1' do registro 2 'NR==2' do arquivo /proc/net/arp

### imprimindo o primeiro e o último campos
* http://br.groups.yahoo.com/group/shell-script/message/31590

Tenho uma coluna que contém nomes, exemplo:

``` markdown
Ciclano Fulano da Silva Soares
José dos Anzóis Pereira
Juca da Silva
Mateus Marcus Lucas e João
Benedita Maria da Silva
Santa Maria

estou precisando formatá-los pegando apenas o primeiro e o último nome, o único
problema é que eles não tem o mesmo tamanho... como devo fazer? alguem pode me
ajudar?


JJ.Santanna
```

    awk '{print $1,$NF}' teste.txt


## Remoção de linhas duplicadas com awk

``` sh
awk '!a[$0]++' file
```



#### Explicação

    BEGIN ..... preprocessamento do awk, nesta seção alteramos coisas como...
    RS ........ Separador de registros o padrão é "\n"
    FS ........ Separador de campos o padrão é espaço



Com a mudança acima é como se cada bloco estivesse numa horizontal e a
separação dos mesmos passou a ser uma linha em branco No final jogamos um if no
qual  testamos através de expressões regulares se o campo $3 não termina com
zero,



    if ($3 ~ /[^0]$/)


e finalmente mandamos imprimir

    o registro todo $0

    print $0,"\n"



A impressão de uma quebra de linha "\n"
é para no caso de a saida gerar vários
registos que eles fiquem separados como no início.

## Concatenando linhas com o awk
[Pergunta da lista sed-br](http://br.groups.yahoo.com/group/sed-br/message/4369)

``` markdown
Senhores,
Ainda não consegui achar uma solução, tem um arquivo que ele assim:

dn: uid=xx,ou=Usuarios,dc=bbbb,dc=com,dc=br
cn: fulano de tal
homePhone: 053922
mail: fulano@...
dn: uid=yy,ou=Usuarios,dc=bbb,dc=com,dc=br
cn: beltrano de tal
homePhone: 053923
mail: beltrano@...

Isso se repete, sempre, dn:, cn: homePhone: e mail:, gostaria de deixar
ele dessa forma:

dn: uid=xx,ou=Usuarios,dc=bbbb,dc=com,dc=br;cn: fulano de tal;homePhone:
053922

em coluna para cada 4 linhas do arquivo. Alguém tem alguma idéia de como
fazer isso?
```


### A solução ...

``` sh
awk 'ORS=NR%4?",":"\n"' file
```

``` markdown
# a atribuição do "separador de registro de saída" ORS tem um opcional
# que pode ser virgula ou quebra de linha "\n", para ser quebra de linha necessita
# que o valor seja um número que dividido por 4 dê resto zero, na prática
# o awk vai concatenar de 4 em quatro linhas colocando uma virgula entre "linhas"
```

##  Probleminha com awk
Imagine que você tem este arquivo:

``` markdown
-5232,-92338,84545,34
-2233,25644,23233,2
6211,-1212,4343,43
-2434,621171,9121,-33
```

E deseja mostrar apenas os valores negativos

### solução
``` sh
awk 'BEGIN {RS=",|\n"}; /^-/ {print}' file.txt
```

Indicamos duas alternativas para o Separador de Registros, vírgula ou quebra de
linha ", | \n" assim ele considera cada valor como sendo uma linha, em seguida
usamos uma expressão regular para pegar o começo de linha com o sinal de menos.


## Como saber quais hosts ativos em uma rede?

``` sh
nmap -sP 192.168.254.1-254 | awk '/^Host/ {print $2" ativo"}'
```

Para contar quantos computadores você tem na rede faça:
``` sh
nmap -sP 192.168.254.1-254 | awk '/^Host/ {print $2" ativo"}' | wc -l
```


##Awk: Impressão em intervalos predefinidos
``` sh
awk '{print} NR % 4 ==0 { print "----" }' arquivo
1
2
3
4
----
5
6
7
8
----
9
10
11
12
---
```

## Calculando sua fatura com o awk
Eu tenho uma fatura assim:

    Obs: os espaços do segundo campo foram trocados por "_"

    12/01/2007 INSINUANTE_LJ_187(12/12) 187,91
    04/09/2007 RABELO_SOM_E_IMAGEM(04/12) 51,75
    03/11/2007 EXTRA_1375_PARANGABA(03/04) 41,75
    03/11/2007 EXTRA_1375_PARANGABA(03/04) 11,75
    13/11/2007 INTUICAO(02/02) 34,50
    21/11/2007 ADAUTO_PECAS(02/06) 200,00
    17/12/2007 ANUIDADE(12/12) 7,00
    26/12/2007 VIACAO_ITAPEMIRIM(01/03) 259,34

``` sh
awk '{ total = total + $3} END {print total} ' fatura.txt

794
```

## AWK: Adicionando linhas em branco a cada 10 linhas
Link original [aqui.](http://groups.google.com/group/comp.lang.awk/browse_thread/thread/e3207ec89dc7543f/bac7bbe0fd192884?#bac7bbe0fd192884)

Testei o comando abaixo com êxito, cumprindo a função de
colocar um espaço a cada 10 linhas.

``` sh
awk '{ print } NR % 10 == 0 { print "" }' input
```


### somando campos de arquivos csv

    awk -F ',' '{ x = x + $4 } END { print x }' test.csv

procura e mostra linhas com o terceiro campo igual a "peter" ou que contenham o string "marie":

    cat nomedoarquivo | awk '$3 == "peter" || $3 ~ /marie/'

### Imprimir o tamanho de uma linha

      awk '/root/ {print NR " - " lenght}' /etc/passwd

### imprimir linhas menores que

    awk 'length<30' /etc/passwd

### Imprimir uma linha específica
a ação padrão do awk é imprimir portanto não precisa fazer 'nr=1234 {print}' basta fazer o teste
comparando o número do registro (linha)

     awk 'NR==1234' arquivo

### Imprimir o nome dos usuários acima de um determinado GID

      awk -F":" '{if ($4 >= 1000) print $1}' /etc/passwd

### Imprimir nome de usuário o id

    awk -F":" '{ print "username: " $1 "\t\tuid:" $3" }' /etc/passwd

### Programa que imprime o tamanho da maior linha

     awk '{ if (length($0) > max) max=length($0) }  END { print max }' texto.txt

### Imprimir linhas maiores que 80 caracteres

      length($0) > 80

### visualizando logs do squid

    tail -f /var/log/squid/access.log | awk '{print "Host: "$3 "site: "$7}'

# Imprimindo um trecho de arquivo no awk

    awk '/start_pattern/,/stop_pattern/' file.txt

### Mostrar usuários com ID acima de 1000

    awk -F":" '$3 > 1000 {print $0}' /etc/passwd

### Modificando o separador de registros e de campos

Se você tem o arquivo...

``` markdown
1
2
3
4
5
teste
6
7
8
9
10
teste
11
12
13
14
15
teste
16
17
18
19
20
teste
```

... e quer definir como delimitador de registros a palavra "teste"
e o delimitador de campos para quebra de linha faça:

    awk 'BEGIN { FS="\n"; RS="teste"} {if (NR=="2") print }' teste.txt


### Imprimir valores negativos
Como imprimir somente os valores negativos usando o awk?
Queremos imprimir somente os valores negativos do seguinte arquivo

``` sh
-5232,-92338,84545,34
-2233,25644,23233,2
6211,-1212,4343,43
-2434,621171,9121,-33
```

    awk  'BEGIN {RS=",|\n"}/^-/ {print}' file.txt

Indicamos duas alternativas para o Separador de Registros, vírgula ou quebra de linha ", | \n" assim ele considera cada valor
como sendo uma linha, em seguida usamos uma expressão regular para pegar o começo de linha com o sinal de menos

### Remover linhas em branco

      awk 'NF>0' texto.txt

### Modificar campo 2 mediante uma condição

    awk '{print $1,($2<0.1) ? 0.0 : $2}' file1.txt


### Imprimir somente usuários com UID igual a 1.000 ou maior

    awk -F: '$3 > 999 {print $0}' /etc/passwd


### Imprimir a última linha

    awk 'END {print $0}' /etc/passwd


### contar o número de linhas em um arquivo

     awk 'END { print NR }' <arquivo>


### Problemas da lista shell script

Olá pessoal... tenho o seguinte arquivo:

    cat file.txt

``` sh
bdacp tty1 Thu Nov 13 12:16 - down (00:31)
bdacp tty3 Thu Nov 13 12:53 - down (00:13)
bdacp tty3 Thu Nov 13 13:09 - down (02:34)
reboot system boot 2.4.31 Thu Nov 13 12:15 (00:32)
reboot system boot 2.4.31 Thu Nov 13 12:48 (00:18)
reboot system boot 2.4.31 Thu Nov 13 13:07 (02:35)
teste pts/0 Thu Nov 13 12:53 - 12:53 (00:00)
teste tty2 Thu Nov 13 12:51 - 12:55 (00:04)
teste tty2 Thu Nov 13 13:09 - 13:31 (00:22)
usuario pts/0 Thu Nov 13 12:49 - 12:50 (00:00)
usuario tty1 Thu Nov 13 12:49 - 13:04 (00:14)
usuario tty1 Thu Nov 13 13:09 - 13:23 (00:14)
```

e preciso dessas informações

``` markdown
bdacp 12:16 - down (00:31)
bdacp 12:53 - down (00:13)
bdacp 13:09 - down (02:34)
reboot 12:15 (00:32)
reboot 12:48 (00:18)
reboot 13:07 (02:35)
teste 12:53 - 12:53 (00:00)
teste 12:51 - 12:55 (00:04)
teste 13:09 - 13:31 (00:22)
usuario 12:49 - 12:50 (00:00)
usuario 12:49 - 13:04 (00:14)
usuario 13:09 - 13:23 (00:14)
```

solução

      awk '{$1, $6, $8, $9}' arquivo


### print the total number of lines that contain "Beth"

     awk '/Beth/{n++}; END {print n+0}' file

### sequencia de fibonacci em awk

    seq 50| awk 'BEGIN {a=1; b=1} {print a; c=a+b; a=b; b=c}'

### Awk - replace blank spaces with single space
Fonte: http://unstableme.blogspot.com/2009/11/awk-replace-blank-spaces-with-single.html

Input file 'file.txt' contains fields separated with uneven spaces (or tabs)


$ cat file.txt
6767            1212   9090 12
657676 1212  21212                      21232
76767           12121 909090    121212
12      9090            1212                            21


Required: Replace one or more space with single space or single tab or comma.
The solutions using awk:


    $ awk -v OFS="," '$1=$1' file.txt
Output:

``` markdown
6767,1212,9090,12
657676,1212,21212,21232
76767,12121,909090,121212
12,9090,1212,21
```


    $ awk -v OFS="\t" '$1=$1' file.txt
Output:

``` markdown
6767    1212    9090    12
657676  1212    21212   21232
76767   12121   909090  121212
12      9090    1212    21
```



    $ awk -v OFS=" " '$1=$1' file.txt
Output:

``` markdown
6767 1212 9090 12
657676 1212 21212 21232
76767 12121 909090 121212
12 9090 1212 21
```

# Recebendo variáveis do shell


    read_val=0301; awk -v var=${read_val} '{sub(/0019/,var); print}' infile


``` markdown
echo "Enter ID: "
read ID
awk -v ID=$ID 'NR==14{ print ID}{print}' "file"
```

# assim dá pra usar o argv para passar alguns parâmetros no script

    awk 'BEGIN {print ARGV[5]}' 1 2 3 4 5 6 7

    awk 'BEGIN {print ARGV[5] "\n" ARGV[3]}' 1 2 3 4 5 6 7

    awk -v sq=`pwd` 'BEGIN {print "você está em " sq}'

### extraindo dados de um arquivo
Você tem um arquivo assim:

``` markdown
a.txt
{some data}
success!!

b.txt
{some data}
success!!

c.txt
{some data}
error!!
```

deseja a seguinte saida:

``` markdown
a.txt: success
b.txt: success
c.txt: error
```


com awk dá pra fazer assim:

    awk 'BEGIN {RS="\n\n"} {gsub("!!","",$NF);print $1": "$NF}' teste.txt

# um jeito bem mais simples

    awk '{print $1": "$4}' RS="\n\n" results.txt


### juntando linhas a cada 5 linhas
* fonte: http://br.groups.yahoo.com/group/shell-script/message/31367

Pessoal,

tenho uma comando que gera a seguinte saida, onde a unica padronagem é uma
sequencia de 5 linhas:

``` markdown
0
r5
751625160
601300096
391584768
1
r5
1401393800
1121115008
621056
12
r5
1401393800
1121115008
68344320
45
r5
1401393800
1121115008
1235456
223
r5
2522508840
2242230016
388346880
```

Eu precisava gerar a saida neste formato, em 5 colunas:

``` markdown
0 r5 751625160 601300096 391584768
1 r5 1401393800 1121115008 621056
12 r5 1401393800 1121115008 68344320
45 r5 1401393800 1121115008 1235456
223 r5 2522508840 2242230016 388346880
Como poderei fazer?
Obrigado,
Alessandro Almeida.
```

solução

    awk '{printf("%s%s", $0, (NR%5 ? " " : "\n"))}'


### Referências
* http://br.geocities.com/cesarakg/awk-1.html
* http://student.northpark.edu/pemente/awk/awk1line.txt
* http://www.zago.eti.br/script/awk.html
* http://teknowlogic.org/soft/linux-tips/awk-oneliners/
* http://www.rberaldo.com.br/blog/2009/05/07/tutorial-awk/
* http://www.vivaolinux.com.br/dica/Awk-Uma-poderosa-ferramenta-de-analise/
* http://stackoverflow.com/questions/2332252/extracting-data-from-a-file
* http://goo.gl/zwJ5
