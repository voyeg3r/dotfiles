###<span class="searchhilitepage">netcat</span> [ [[http://sergioaraujo.pbworks.com/netcat|remove highlighting]] ]
O <span class="searchhilitepage">[[http://sergioaraujo.pbworks.com/NetCat|NetCat]]</span> é um utilitário que lê e escreve através de conexões de rede usando protocolos TCP e UDP.


### Clonando sistemas via rede

slave% nc -l -p 9000 | dd of=/dev/hda
master% dd if=/dev/hda | nc 192.168.0.254 9000
clonando com alguns parâmetros a mais (compressão etc)
dd if=/dev/hda conv=sync,noerror bs=64k | gzip -c | nc -l -q 0 -p 5000
nc 192.168.1.1 5000 | gzip -cd | dd of=/dev/hda bs=64k




Obs: Se precisar restaurar a MBR
Obs2: na máquina cliente, ou seja a que vai receber a imagem você deve usar um live-cd ou coisa do tipo para que o hd fique livre para receber os dados. Você deve estar logado como root para executar estes comandos.

dd if=/dev/hda of=/dev/fd0/imagem-mbr bs=446 count=1
dd if=/dev/fd0/imagem-mbr of=/dev/hda