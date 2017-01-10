this is only a test^[]
# Introdução

    paste pares.txt impares.txt

### Transformar 3 linhas em uma

2,5,1,1
3
5
3,7,1,1
2
8

#### resulta em
paste -d"," - - - < file
2,5,1,1,3,5
3,7,1,1,2,8

### Colar dois trechos do mesmo arquivo lado a lado

    joao
    jose
    felipe

    um
    dois
    tres

#### Solução

    paste -d' ' <(sed '/^$/,$d' lixo) <(sed '1,/^$/d' lixo)

Na solução acima pegamos de uma linha vazia '^$' até o final $
e da linha '1' até uma linha vazia '^$'
### juntar linhas de 5 em 5

### Pessoal,

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

### Eu precisava gerar a saida neste formato, em 5 colunas:

    0 r5 751625160 601300096 391584768
    1 r5 1401393800 1121115008 621056
    12 r5 1401393800 1121115008 68344320
    45 r5 1401393800 1121115008 1235456
    223 r5 2522508840 2242230016 388346880
    Como poderei fazer?
    Obrigado,
    Alessandro Almeida.

### solução

    paste -d" " - - - - - < teste.txt


