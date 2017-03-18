### Introdução

### Copiando o mesmo arquivo para três pastas diferentes

    echo dir1 dir2 dir3 | xargs -n 1 cp -v arquivo.txt

 -n 1 – diz ao xargs para usar no máximo um argumento por linha de comando e enviar para o comando cp.
cp – usado para copiar um arquivo.
-v – permite mostrar os detalhes da operação de cópia.

### Consertando permissões
Usando a opção -0 do find e do xargs delimitamos os arquivos, isso
é útil para nomes de arquivos com espaços

find . -type f -print0 | xargs -0 chmod +w


### Apagando thumbnails

 xargs rm -f <(find ~/.thumbnails -type f -ctime +3)


### Para arquivos com espaços no nome
Do manual do próprio xargs

find /tmp -name core -type f -print0 | xargs -0 /bin/rm -f


### Testes !!!!!!!

find -type f | xargs -i iconv -f iso-8859-1 -t utf-8 {} -o {}


### indicando um delimitador

find /media/disk-1/mp3 -iname "*.db" | xargs -d '\n' rm -rf

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

Solução

cat teste.txt | xargs -n5

