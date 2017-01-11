### Referências:
* [[@http://manpages.ubuntu.com/manpages/dapper/man5/nanorc.5.html]]

### Como habilitar a syntax no editor nano
edite o arquivo nanorc

include "/usr/share/nano/c.nanorc"

Nesse caso estamos ativando o suporte a linguagem C. Você pode incluir quantos arquivos quiser. Exemplo:

include "/usr/share/nano/c.nanorc"
include "/usr/share/nano/python.nanorc"
include "/usr/share/nano/sh.nanorc"

### Para abrir numa linha qualquer

nano +10 arquivo.txt

### Para exibir ajuda

Ctrl-g

### Para salvar

Ctrl-o

### Para sair

Ctrl-x

### Rolagem na página

Ctrl-n
Ctrl-p

### Para ir para uma linha qualquer


^w ^t

### Ir para a primeira e ultima linhas


^w ^y
^w ^v


### Para iniciar uma busca

Ctrl-w  para repetir a busca Alt-w

### Referências
* http://ubuntuforums.org/showthread.php?t=62250