### Introdução
O comando abaixo mostra a quantidade de memória livre em
seu sistema

free -m

A opção –t mostra o total na parte inferior do resultado (soma da memória física com o swap):

free -mt

### medindo o percentual de memória física livre

free -m | awk '/Mem/ {print ($3 / $2)*100}'


