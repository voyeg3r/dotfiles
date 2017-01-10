### Para fechar um programa usando o comando kill fazemos assim:

ps aux | grep firefox

O comando acima retornará (filtrando através do [[grep]]) os processos, ou seja
programas que tenham o nome firefox, pegue o número fornecido e use como abaixo

kill -9  1945

Um modo mais prático é usar o comando [[pkill]]

pkill firefox

ou

pkill firefox-bin

### Matando todos os processos de um usuário específico
fonte: http://www.ataliba.eti.br/node/1771

su - username -c 'kill -9 -1'

O comando "su - username" toma a identidade do usuário indicado
a opção "-c" executa um comando "kill -9 -1" mata todos os processos possíveis

