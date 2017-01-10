### exibir os últimos 10 comandos

history 10

### exibir todas as ocorrências do find no histórico

history | grep find

### limpar o histórico de comandos

history -c

### para executar a saida de um comando

  apt-cache search openoffice.org | grep -i pt-br | awk '{print $1}'
  apt-get install -y $(!!)

### buscando um padrão no histórico

history | awk '$2 ~ /find/ {print $0}'

No aqk $2 indica o segundo campo, lembre-se que o primeiro campo
é o númeor do comando dentro do histórico, o til ativa a busca
por expressões regulares pela palavra 'find' e finalmente instruimos ao
awk que imprima na tala todo o campo correspondente.
### subsituição de padrões no histórico
Digamos que você deu um ping assim:

ping -c 2 www.google.com

Se desejar dar um ping para o yahoo basta fazer:

^google^yahoo

### Os 10 comandos mais usados

history | awk '{print $2}' | sort | uniq -c | sort -rn | head

# mais completo
history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head




