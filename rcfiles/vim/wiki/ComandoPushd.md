### descrição
Coloca o diretório atual em uma pilha de modo que você pode voltar a este
mesmo diretório com o comando [[popd]]
### como usar
Digamos que você entre em

/var/cache/apt/archives

para colocar o diretório atual na pilha basta

pushd .

agora você pode ir para qualquer lugar e voltar ao
diretório colocado na pilha com o comando

popd

