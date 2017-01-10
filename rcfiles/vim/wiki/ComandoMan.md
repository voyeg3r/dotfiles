### criando um txt de um manual

    man cp | col -b > man-cp.txt


### listar todas as opções de um comando qualquer

man find | sed  -e '/-\{1,2\}/!d' -e 's/.*\(-\{1,2\}\)\([^ ]*\).*/\1\2/' | grep ^"$2" | sort -u

### Criar um pdf de um manual

man -t find | ps2pdf - > find.pdf

### comandos do comando man

  q ........ sair do man
  / ........ inicia uma busca
  n ........ repete a busca (next)
  N ........ repete a busca (previous)
  gg ....... vai para a linha 1
  G ........ vai para a última linha
  ma ....... cria uma marca 'a'
  `a ....... pula para marca 'a'

### Acessando o man em um ponto específico

man <COMMAND> | less +'/pattern'


Por exemplo, quero ver o man do find e buscar "printf"


man <COMMAND> | less +'/printf'


### obtendo uma lista completa de comandos

man -k . | grep "(1)" | less
man -k .
