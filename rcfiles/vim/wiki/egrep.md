
set | egrep '^(LANG|LC)'

### Processos de mais de um usuário
Para se obter uma lista completa dos processos executados em um
sistema por mais de um usuário, através de um único comando, pode-se utilizar:

ps -fauxw | egrep 'usuario1|usuario2'

### Buscar expressão regular ignorando arquivos binários

find . -type f -print0 | xargs -0 egrep -i "somepattern"


### buscar uma palavra recursivamente em um diretório

find -iname "*.srt" -print0 | xargs -0 grep -i 'dumped' *
