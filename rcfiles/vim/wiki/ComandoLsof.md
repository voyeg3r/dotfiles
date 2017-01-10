this is only a test^[]
this is only a test^[]
### Introdução
O comando lsof é utilizado para mostrar os arquivos que
estão abertos no sistema. Sozinho o comando lsof mostra todos os arquivos abertos,
### Listar todos os programas que usam internet atualmente

lsof -P -i -n | cut -f 1 -d " "| uniq | tail -n +2

### listar quais processo estão usando cdrom

lsof -n | grep /media/cdrom

### listar atividade de um usuário por pastas

sudo lsof -u someuser -a +D /etc

### kill all processes using a directory/file/etc

This command will kill all processes using a directory. It's quick and dirty.
One may also use a -9 with kill in case regular kill doesn't work. This is
useful if one needs to umount a directory.

lsof | grep /somemount/ | awk '{print $2}'| xargs kill

### List all files opened by a particular command

lsof -c dhcpd

### listar acessos em uma porta específica

lsof -i:80 -n -P
lsof -P | grep ':3000'

==detectando processos associados ao ssh=

lsof -i:ssh | awk '/^ssh/ {print $2}'

kill -9 `awk '/^ssh/ {print $2}' <(lsof -i:ssh)`

### referencias
* http://danielmiessler.com/study/lsof/
