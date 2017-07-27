### removendo espaços no nome

    rename 'y/ /_/' *

    for i in *mp3*; do
        mv "$i" `echo $i | sed 's/ //g'`
    done

### modificando a extensão

 rename 's/\.html$/.htm/' *.html
 rename .oldextension .newextension *.oldextension


### Se tirver hifem no começo pode dar erro
Esta solução para arquivos com hifen no começo

    find . -print0 | xargs -0 rename 's/-//g'


### removendo espaços no nome

  rename "s/ *//g" *.jpg
  rename 's/ /_/g' *.htm


### Adicionando extensão

  rename 's/$/.txt/g' *


usando o find e o xargs

     find . -iname \*.html -print0 | xargs -0 rename 's/\.html$/.htm/'

Usando o find podemos fazer um comando recursivo, contudo
há um problema com arquivos que tenham "espaços no nome" isso
causaria um erro, por isso usamos '-print0' para imprimir um
delimitador para cada arquivo, o xargs por sua vez tem uma opção
que pega o delimitador enviado pelo find e entrega o resultado
para o rename.

O rename usa expressões regulares '\.' é um ponto literal
e '$' é final de linha.

