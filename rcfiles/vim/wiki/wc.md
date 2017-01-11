### Introdução
Usando o wc direto em um arquivo temos (linhas, palavras e caracteres)

wc wc.tex
98     760    4269 wc.tex

Em geral este comando é usado em combinação com o ls

ls | wc -l

### Não use o wc para contar saidas do grep
Para contar quantidade de linhas que contém um padrão faça:

grep -c "palavra" file

Outra opção seria usar a opção -o do grep

grep -o "palavra" file | wc -l

### Show the longest line in a file

   wc -L file.txt

### Referências
* http://www.linuxjournal.com/node/1327/print
