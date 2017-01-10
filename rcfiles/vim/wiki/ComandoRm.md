### como remover pastas
Para remover pastas deve-se usar a opção -r que indica recursividade, ou seja
a pasta e tudo que houver nas mesma.

    rm -rf pasta

### apagar arquivos que não correspondem a determinadas extensões

    rm !(*.foo|*.bar|*.baz)

### Apagar arquivos com espaço no nome (com confirmação)

    ls -Q * | xargs -p rm

A opção "-Q" do ls coloca todos os nomes entre aspas e a opção "-p"
do xargs exibe um prompt de confirmação
### remover aquivos terminados com 'ps'

    ls | grep -v ps$ | xargs rm
