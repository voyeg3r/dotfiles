### Introdução

seq 1 100 | paste -sd+ | bc

### somando os numeros de 1 a 100

seq -s+ 100 | bc

### Calculos com números quebrados

echo 'scale=2; 5/2' | bc


===Usando Here strings===
Neste caso não temos que usar echo


bc <<< 'scale=2; 2 / 5'


### Decimal para hexadecimal


echo "obase=16; ibase=10; 56" | bc


### Somando valores com o 'paste' e o 'bc'
Fonte: http://br.groups.yahoo.com/group/shell-script - Mensagem 19183
arquivo valores.txt contem

  #cat valores.txt
  23
  21
  90
  32

o comando deve me retornar a soma de todos estes numeros, alguem pode
me dar um help?

$ paste -sd+ valores.txt | bc
 166

A opção -s transforma coluna em linha, a opçao -d indica o
delimitador e bc é uma calculadora. Veja só o paste:

 $ paste -sd+ valores.txt
 23+21+90+32

### Função para converter de decimal para binário

function decToBin { echo "ibase=10; obase=2; $1" | bc; }

### Comparando valores
Fonte: [[@http://br.groups.yahoo.com/group/shell-script/message/30666|lista brasileira de shell script]]

if (( ! $(echo 2.0 == 1.006 | bc -l) )); then
echo isso é falso
fi
