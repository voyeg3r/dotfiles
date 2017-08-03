### Introdução
O comando cat serve para visualizar conteudos de textos e também para
concatenar arquivos divididos como comando [[split]]

  cat /etc/group

Podemos criar um arquivo com o cat assim:

  cat > nomedoarquivo
  digite algumas
  linhas no arquivo e control-c
  para finalizar a edição

### Removing blank lines at the begining of file

    cat file | (read; read; cat)

Se also how to perform this task with [tail](tail.md)

### Here documents

cat <<-EOT
  List and/or delete all stale links in directory trees.
  usage : $0 [-d] [-oD logfile] [-l] [-h] [starting directories]
   -d    delete stale links
   -l    list stale links (default)
   -o    write stale links found into logfile
   -D    delete stale links listed in logfile
   -h    display this message
EOT

Outro exemplo

cat <<-EOF >> /etc/profile

http_proxy="http://${PROXY}"
ftp_proxy="http://${PROXY}"
export http_proxy ftp_proxy
EOF

### Here strings

if grep -q "sergio" <<< $USER; then
   echo "sergio logado"
fi

### Se pretende concatenar os arquivos:

  arquivo1.txt arquivo2.txt arquivo3.txt

Pode fazer:

  cat arquivo{1..3}.txt  > arquivao.txt

### saber qual sua distro

cat /etc/issue


### Remover linhas duplicadas

    cat -n file_name | sort -uk2 | sort -nk1 | cut -f2-


### Ler os logs do squid

 cat /var/log/squid/access.log | awk '{pint $3" "$8" "$7}' | less

### detectando erros em scripts
Por vezes os erros são por conta de espaços ou tabulações inconsistentes como no python ou terminadores de linha do windows
no linux, para ver isto use:

cat -vet file

### Suprimir linhas vazias
fonte: http://www.caiomoritz.com/2009/02/14/suprimindo-quebras-de-linha-sucessivas/

cat -s < linhas.txt

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
