##Descrição de um comando

whatis find
find (1)             - search for files in a directory hierarchy


##para listar a descrição de todos os comandos

for i in `ls /usr/bin`; do
  whatis $i
done
