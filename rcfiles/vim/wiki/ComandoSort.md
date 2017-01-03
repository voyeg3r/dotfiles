=Introdução=

O comando sort ordena um arquivo assim:

sort arquivo.txt -o arquivo.txt

No caso estou indicando que o arquivo que receberá as alterações será
o próprio

Obs: Caso queira ordenar números use a opção 'n' do sort
==Ordenar numericamente (-n) usando o campo 2==

alunos:~/scripts$ sort -n -t ":" -k 2 sorttest
a:1:3.2
d:1:0.2
b:2:0.3
c:9:1.2


==Ordenando e retirando linhas duplicadas==

cat *.txt | sort | uniq > arquivao.txt

Outra opção é usar a opção '-u'

cat *.txt | sort -u > arquivao.txt



O comando sort, também oferece inúmeras facilidades interessantes.
Tomemos o arquivo abaixo como exemplo: arq1

  1:2:3:4:5:6
  1:1:3:4:5:6
  1:4:3:4:5:6
  1:2:3:4:5:6
  1:0:3:4:5:6
  1:2:3:4:5:6
  1:7:3:4:5:6
  1:2:3:4:5:6
  1:0:3:4:5:6
  1:9:3:4:5:6


O comando abaixo


  sort -t: +1 -n arq1

irá gerar a seguinte saída

    |
    v
  1:0:3:4:5:6
  1:0:3:4:5:6
  1:1:3:4:5:6
  1:2:3:4:5:6
  1:2:3:4:5:6
  1:2:3:4:5:6
  1:2:3:4:5:6
  1:4:3:4:5:6
  1:7:3:4:5:6


Observar que o segundo campo, indicado pela seta, está ordenado
numericamente em ordem crescente. Os campos deste arquivo são
separados por ":". O tipo de separador é indicado pela flag "-t:". Em
seguida à flag "-t" poderíamos indicar qualquer tipo de separador. O
campo a ser ordenado é indicado pela flag "+1". Para o comando sort a
contagem dos campos inicia-se por 0, desta forma, o valor "+1" irá
indicar na realidade o segundo campo do arquivo. A ordenação também
pode ser feita numericamente, do maior para o menor valor:

   sort -t: +1 -nr arq1

    |
    v
  1:9:3:4:5:6
  1:7:3:4:5:6
  1:4:3:4:5:6
  1:2:3:4:5:6
  1:2:3:4:5:6
  1:2:3:4:5:6
  1:2:3:4:5:6
  1:1:3:4:5:6
  1:0:3:4:5:6
  1:0:3:4:5:6


==mostrar uma linha aleatória de um arquivo==

sort -R /etc/passwd | head -1

==randomize lines in some file==

sort -R SOMEFILE


==Mostrar opções avançadas do sort==

alias sorth='sort --help|sed -n "/^ *-[^-]/s/^ *\(-[^ ]* -[^ ]*\) *\(.*\)/\1:\2/p"|column -ts":"'

==Referências==
* http://www.dicas-l.com.br/dicas-l/19970623.php
* [[http://www.commandlinefu.com/commands/view/5814/view-advanced-sort-options-quick-reference-help-alias|show sort options]]