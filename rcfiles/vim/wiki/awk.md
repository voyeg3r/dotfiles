# Introdução
O awk trabalha sempre dessa forma:

    awk padrão ação

O padrão é um termo buscado, pode ser imprimir as linhas que contém
a palavra sérgio do arquivo de grupos:

   awk -F: '/sergio/ {print $1}' /etc/group

O awk considera o espaço como separador de campos padrão,
devido à extrutura do arquivo "/etc/group" modificamos o
separador de campos usando:

  -F:

O que está entre barras "/" é o padrão a ser buscado
e o "$1" diz ao awk para imprimir o primeiro campo.

Caso não seja informado nenhum padrão o awk imprime a linha inteira,
a menos que peçamos para imprimir um campo, veja:

  awk -F: '{print $1}' /etc/group

No comando acima não foi informado nenhum padrão, apenas
foi informado ao awk qual o separador de campos e qual
campo quería-mos como saída.

Obs: Sempre que trabalhar com o awk use aspas simples
pois o cifrão "$" representa para o awk indicador de campos
(começado em 1, se for zero é a linha toda), mas se não forem
usadas aspas simples o shell tentará interpretar primeiro
buscando alí uma variável que na verdade não existe.


### Variáveis do awk

    NR     Contém o número do registro atual (linha)
    NF     contém o número de campos por registro (coluna)
    FS     indica o separador de campos
    RS     indica o separador de registros
    OFS    indica o separador de campo do arquivo de saida
    ORS    indica o separador de registros do arquivo de saida
    FNR    refers to the record number (typically the line number)

### How to determine the line number of the last occurrence of a string in a file

    awk '/Fedora/ { ln = FNR } END { print ln }'

### Delete first line

    cat -n /etc/passwd | awk 'NR != 1 {print $0}'

### convert DOS file to Unix file

    To use awk to convert a Windows file to Unix, enter:

        awk '{ sub("\r$", ""); print }' winfile.txt > unixfile.txt

    To convert a Unix file to Windows, enter:

        awk 'sub("$", "\r")' unixfile.txt > winfile.txt


    Usei este recurso para manipular meus contatos do telefone que
    estavam no formato vcf mas que usavam terminador de linha do windows

    após converter usando o comando acima imprimi somente os contatos
    que tinham telefone usando este comando

    awk 'BEGIN {RS="\n\n"; FS="\n";} /TEL/ {print $0}' unix.vcf

    finalmente eu queria apagar os registros que continham um padrão
    usei a negação com exclamação, usei também o operador && para
    incluir outro critério, os registros tem que ter telefone, ou seja,
    na minha agenda do telefone só interessa registro com número.

    awk 'BEGIN {RS="\n\n"; FS="\n"} !/Câmara dos Deputados/ && /TEL/ {print $0}' unix.vcf

    Sabendo que sempre se pode melhorar podemos omitir o print já que
    é a ação padrão do awk

    awk 'BEGIN {RS="\n\n"; FS="\n"} !/Câmara dos Deputados/ && /TEL/' unix.vcf

### deleting blank lines - apagando linhas em branco

    awk 'NF' filename

    awk 'NF > 0' filename
    
### delete hidden files and folders 

	ls -la | awk '$NF ~ /^\.[^.]+/  {print $NF}' | xargs rm -rf

	ls -la ............. long list (all files and folders)
	$NF ................ last field (file or folder name)
	~   ................ Regular Expression match
	/^\.[^.]+/ ......... dot followed by not dot at least once +

If the last field $NF match pattern show it and send 
it to xargs which will perform the task.



### adding a new line after each second line

    awk ' {print;} NR % 2 == 0 { print ""; }' file.txt

### Using awk to filter out students in a list

``` sh
cat ip.txt

    John Doe Marketing Junior B
    Betty Metty Engineering Junior A
    James Names Nursing Sophomore B
    Bob Nob History Freshman B
    Hope Nope Engineering C

    awk '$5=="A"{print $1, $2}' file

Output

Betty Metty

Edit, filter engineering :

    awk '$5=="A" && $3=="Engineering"{print $1, $2}' file
```


### How to print third column to last column?
+ https://stackoverflow.com/a/1602063/2571881

    echo one two three four five | awk '{ print substr($0, index($0,$3)) }'

### how use shell vars on awk
Como usar variáveis do bash/shell no awk

I am figuring out the Ipython shell support. Its seems awk doesn't work i.e following command

    ls -l | awk '{print $1}'

Two dollar signs give you a literal dollar sign, so try:

    ls -l | awk '{print $$1}'

### which OS I am using

    OS=`awk -F= '/DISTRIB_ID/ {print tolower($2)}' /etc/lsb-release`
    echo "Seu sistema é ${OS}"

### criando hard links com o find plus awk plus ln

for i in `ls -l ~/ubuntuone/e-books/ | awk '$9 ~ /vim/ {print $9}'`
	do
			ln ~/ubuntuone/e-books/${i}
	done

### Imprimindo o segundo e o último campos em arquivos com delimitadores distintos
AWK multiple delimiter

  Tomando por exemplo o arquivo 'teste.txt" com o seguinte
  conteúdo e queremos exibir o segundo campo e o último

    /logs/tc0001/tomcat/tomcat7.1/conf/catalina.properties:app.env.server.name = demo.example.com
    /logs/tc0001/tomcat/tomcat7.2/conf/catalina.properties:app.env.server.name = quest.example.com
    /logs/tc0001/tomcat/tomcat7.5/conf/catalina.properties:app.env.server.name = www.example.com

a solução é indicar dois delimitadores de campo:
+ https://stackoverflow.com/a/12204350/2571881

		``` sh
		awk -F'[/=]' '{print $3, $NF}' teste.txt
		```

### somando uma coluna de números

	awk '{s+=$1}END{print s}' <file>

### imprimir ultimo campo
Lembrando que para o awk linha é registro e coluna é campo

  awk '{print $NF}' file

  Observer que NF = number field, ou seja, número do campo

### buscar ocorrência exata com awk

    awk '$2=="172.17.4.1" {print $1}' file.txt

### numerar linhas

     awk '{print FNR "\t" $0}' files*

### imprimir numero da linha de um padrão

    awk '/enable bash completion/ {print NR}' /etc/bash.bashrc

### imprimindo o primeiro e o último campos
* http://br.groups.yahoo.com/group/shell-script/message/31590

``` markdown
Tenho uma coluna que contém nomes, exemplo:

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


### Pegando o número ip
   pegando a interface conectada
   awk '/UG/ {print $NF}' <(/sbin/route -n)

   ifconfig eth0 | awk '/inet add/ {print $3}'
   awk '/inet addr/ {print $2}' <(ifconfig eth0)

No caso acima pedimos para listar o endereço atualmente
atribuido à interface de rede eth0 (lembre-se que em alguns sistemas
a interface padrão pode ser eth1). Em seguida a saída
que deveria ser mostrada na tela é redirecionada para o awk.
O awk por sua vez procura pelo padrão "inet end" e imprime o
terceiro campo retornando somente o ip.

### Pegando o endereço do roteador

    awk 'NR==2 {print $1}' /proc/net/arp

A explicação: Mostre o campo 1 '$1' do registro 2 'NR==2' do arquivo /proc/net/arp

### Removendo linhas duplicadas

    awk '!($0 in a) {a[$0];print}' file

    awk '!a[$0]++' file

### Imprimindo linhas de um intervalo

    awk 'NR >= 27 && NR <= 99' file.txt > /tmp/file3

fonte: http://br.groups.yahoo.com/group/shell-script/message/31705

``` markdown
Srs.,

Boa tarde!

Gostaria de uma ajuda para solucionar este desafio(pra min..rs).
Desejo capturar um intervalo de linhas separadas por chaves.

ex:

# arquivo teste
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

### Imprimir linhas em intervalos específicos (neste caso a cada 3 linhas)

    awk 'NR%3==1' file

um comentário a cada 5 linhas

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

### Concatenando linhas
**Concatenate every 4 lines of input with a comma.**

    awk 'ORS=NR%4?",":"\n"'

O comando acima resolve questões como esta:
[[@http://br.groups.yahoo.com/group/sed-br/message/4369]]

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

### Calculadora com awk

# coloque no seu ~/.bashrc

    calc(){ awk "BEGIN{ print $* }" ;}


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

    ``` sh
    awk '{ print length($0),$0 | "sort -n"}'  file
    ```

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

     ``` sh
     ps aux | awk '!/root|nobody/ { if ($4>2) {print $2,$11}}'
     ```

### Pegar coluna de linha especifica

# exemplo da coluna 2 na linha 5

    awk 'NR == 5 {print $2}'

imprimir primeira coluna da linha 2

    awk 'NR==2 {print $1}' arquivo

### somando números em um arquivo

    awk '{s+=$0} END {print s}' /tmp/file.txt

### somando os 10 primeiros números

    seq 10 | awk '{ i+=$1 } END { print i }'
    55

### Opção com o paste + bc para somar numeros em um arquivo

    paste -sd+ /tmp/file.txt | bc

    awk '{ sum += $1 } END { print sum }' file

### Calculando sua fatura do com o awk
``` markdown
Eu tenho uma fatura assim:

12/01/2007 INSINUANTE_LJ_187(12/12)    187,91
04/09/2007 RABELO_SOM_E_IMAGEM(04/12)  51,75
03/11/2007 EXTRA_1375_PARANGABA(03/04) 41,75
03/11/2007 EXTRA_1375_PARANGABA(03/04) 11,75
13/11/2007 INTUICAO(02/02)             34,50
21/11/2007 ADAUTO_PECAS(02/06)         200,00
17/12/2007 ANUIDADE(12/12)             7,00
26/12/2007 VIACAO_ITAPEMIRIM(01/03)    259,34
```

    awk '{ total = total + $3} END {print total} ' fatura.txt


``` markdown
A variável total recebe o valor dela + o acumulado
do terceiro campo do arquivo "fatura.txt", mas
só é impresso a soma no final graças ao uso do
END

Resultado:
```

    794

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

    awk '{ l = length($0); a = (a > l) ? a : l } END {print a}' test.txt

### Imprimir linhas maiores que 80 caracteres

    length($0) > 80

### visualizando logs do squid

    tail -f /var/log/squid/access.log | awk '{print "Host: "$3 "site: "$7}'

### Imprimindo um trecho de arquivo no awk

    awk '/start_pattern/,/stop_pattern/' file.txt

### Mostrar usuários com ID acima de 1000

    awk -F":" '$3 > 1000 {print $0}' /etc/passwd

### Modificando o separador de registros e de campos

Se você tem o arquivo...

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


... e quer definir como delimitador de registros a palavra "teste"
e o delimitador de campos para quebra de linha faça:

awk 'BEGIN { FS="\n"; RS="teste"} {if (NR=="2") print }' teste.txt

   OBS: estando no linux verifique o terminador de linha
        se o formato for do windows o terminador de linha é
        diferente e pode gerar erros no awk assim como no vim

          faça a veriricação assim:

            cat -vet target-file


### Imprimir valores negativos
Como imprimir somente os valores negativos usando o awk?
Queremos imprimir somente os valores negativos do seguinte arquivo

-5232,-92338,84545,34
-2233,25644,23233,2
6211,-1212,4343,43
-2434,621171,9121,-33



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


e preciso dessas informações

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
6767,1212,9090,12
657676,1212,21212,21232
76767,12121,909090,121212
12,9090,1212,21



$ awk -v OFS="\t" '$1=$1' file.txt
Output:
6767    1212    9090    12
657676  1212    21212   21232
76767   12121   909090  121212
12      9090    1212    21



$ awk -v OFS=" " '$1=$1' file.txt
Output:
6767 1212 9090 12
657676 1212 21212 21232
76767 12121 909090 121212
12 9090 1212 21

### Recebendo variáveis do shell
+ https://stackoverflow.com/a/19075707/2571881


    read_val=0301; awk -v var=${read_val} '{sub(/0019/,var); print}' infile


    echo "Enter ID: "
    read ID
    awk -v ID=$ID 'NR==14{ print ID}{print}' "file"

# assim dá pra usar o argv para passar alguns parâmetros no script

    awk 'BEGIN {print ARGV[5]}' 1 2 3 4 5 6 7

    awk 'BEGIN {print ARGV[5] "\n" ARGV[3]}' 1 2 3 4 5 6 7

    awk -v sq=`pwd` 'BEGIN {print "você está em " sq}'

### extraindo dados de um arquivo
Você tem um arquivo assim:


    a.txt
    {some data}
    success!!

    b.txt
    {some data}
    success!!

    c.txt
    {some data}
    error!!

    deseja a seguinte saida:

    a.txt: success
    b.txt: success
    c.txt: error


    com awk dá pra fazer assim:

    ``` sh
    awk 'BEGIN {RS="\n\n"} {gsub("!!","",$NF);print $1": "$NF}' teste.txt
    ```

# um jeito bem mais simples
awk '{print $1": "$4}' RS="\n\n" results.txt

### imprimindo a saida do ifconfig

 sudo ifconfig | awk 'BEGIN {RS="";FS="\n"} {if (NR=="1" || NR=="3") print}'

 Pegando o registro 1 e 3 imprimimos eth0 e wlan0


Abaixo imprimimos o mac address da placa eth0 e wlan0

 ifconfig | awk '/ether/ {print $2}'


### juntando linhas a cada 5 linhas
* fonte: http://br.groups.yahoo.com/group/shell-script/message/31367

Pessoal,

tenho uma comando que gera a seguinte saida, onde a unica padronagem é uma
sequencia de 5 linhas:

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

Eu precisava gerar a saida neste formato, em 5 colunas:

0 r5 751625160 601300096 391584768
1 r5 1401393800 1121115008 621056
12 r5 1401393800 1121115008 68344320
45 r5 1401393800 1121115008 1235456
223 r5 2522508840 2242230016 388346880
Como poderei fazer?
Obrigado,
Alessandro Almeida.

solução

awk '{printf("%s%s", $0, (NR%5 ? " " : "\n"))}'


### Referências
* http://br.geocities.com/cesarakg/awk-1.html
* http://student.northpark.edu/pemente/awk/awk1line.txt
* http://www.zago.eti.br/script/awk.html
* http://teknowlogic.org/soft/linux-tips/awk-oneliners/
* http://www.rberaldo.com.br/blog/2009/05/07/tutorial-awk/
* http://www.vivaolinux.com.br/dica/Awk-Uma-poderosa-ferramenta-de-analise/
* http://stackoverflow.com/questions/2332252/
* http://goo.gl/zwJ5
