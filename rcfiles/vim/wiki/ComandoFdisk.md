### Introdução
===Exibe os discos disponíveis===
Execute como root

fdisk -l

Exibe informações sobre sistemas de arquivos ntfs

ntfsresize -v -i /dev/sda2

Força a correção de erros

ntfsresize -f -v -i /dev/sda2

testa se pode redimensionar (diminuindo de 40 para 30GB)

ntfsresize -v -f -b -n -s 30G /dev/sda2

faz o redimensionamento

ntfsresize -v -f -b -s 30G /dev/sda2


### Referências
* http://www.everlinux.com/blog/2009/03/10/redimencionando-um-ntfs-com-bad-blocks