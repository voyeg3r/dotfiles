### Introdução
Para gerar sequência de números pares

seq 2 2 10

O comando acima diz:
	comece em 2, de dois em dois, até 10
### contagem regressiva de 10 até zero

seq 10 -1 0

### somando os numeros de 1 a 100

seq -s+ 100 | bc
echo $[$(seq -s+ 1000)]


fonte: http://br.groups.yahoo.com/group/shell-script/message/27193

 tenho um arquivo assim:

 1
 2
 3
 4
 5
 6
 7
 8
 9
 10

 quero que ele saia assim:

 1-2
 3-4
 5-6
 7-9
 9-10

Teste essa solução
$ seq 10 | paste -d\- - -

ou

$ paste -d\- - - arquivo > novo.arquivo

### gerando listas com três dígitos

seq -w 100


Para gerar um arquivo contendo linhas de 1) a 45)

seq -f '%.0f)' 1 45 > arquivo.txt

