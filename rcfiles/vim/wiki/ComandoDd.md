### Introdução
O comando dd pode ser usado para gerar imagens de cd:

	dd if=/dev/cdrom of=imagem.iso

### Gerando um pendrive bootavel

Como root rode o comando //**fdisk -l**// para saber em que partição está o pendrive se ele mostrar /dev/sdb1 anote e desmonte o pendrive, em seguida faça

	dd if=ubuntu.iso of=/dev/sdb bs=1M && sync

  dd bs=4M if=./antergos-2015.09.13-i686.iso of=/dev/sdb && sync

	or

  sudo dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx && sync

Obs: não precisa indicar sdb1 por exemplo basta indicar sdb, e outra coisa tem que desmontar a
unidade antes de rodar o comando

### How to restore USB flash after installing

    dd count=1 bs=512 if=/dev/zero of=/dev/sdx && sync

    dd count=1 bs=512 if=/dev/zero of=/dev/sdb && sync

    Where sdc represents your usbdrive partition
    after that format your usbdrive using gparted

### veja também
o comando cdrecord

Comando mais apropriado para criar uma iso
http://www.commandlinefu.com/commands/view/1397/create-a-cddvd-iso-image-from-disk

Many like to use 'dd' for creating CD/DVD iso images. This is bad. Very bad.
The reason this is, is 'dd' doesn't have any built-in error checking. So,
you don't know if you got all the bits or not. As such, it is not the right
tool for the job. Instead, 'readom' (read optical media) from the wodim package
is what you should be using. It has built-in error checking. Similarly, if you want
to burn your newly creating ISO, stay away from 'dd', and use:
wodim -v -eject /path/to/image.iso

	readom dev=/dev/scd0 f=/path/to/image.iso


Serve também para zerar a senha da bios

	# printf "x2E" | dd bs=1 seek=112 of=/dev/port
	# printf "xFF" | dd bs=1 seek=113 of=/dev/port


Serve também para clonar hds em combinação com o comando [[netcat]]
netcat

O NetCat é um utilitário que lê e escreve através de conexões de rede usando protocolos TCP e UDP.

### converter imagem do nero para iso
This line removes the 300k header from a Nero image file converting it to ISO format

	dd bs=1k if=image.nrg of=image.iso skip=300


### convertendo para minúsculos

	echo "Ação" | dd conv=lcase


### Clonando sistemas via rede


	slave% nc -l -p 9000 | dd of=/dev/hda
	master% dd if=/dev/hda | nc 192.168.0.254 9000



clonando com alguns parâmetros a mais (compressão etc)

	dd if=/dev/hda conv=sync,noerror bs=64k | gzip -c | nc -l -q 0 -p 5000
	nc 192.168.1.1 5000 | gzip -cd | dd of=/dev/hda bs=64k


### Como limpara a MBR
font: http://www.debianfordummies.org/wiki/index.php/Limpando_a_mbr
Para remover a mbr (apenas a mbr) iremos usar o comando abaixo (supondo que seu hd esteja em /dev/hda)

	dd if=/dev/zero of=/dev/hda bs=446 count=1 && sync

Obs: Se precisar restaurar a MBR

Obs2: na máquina cliente, ou seja a que vai receber a imagem você deve usar um live-cd ou coisa do tipo para que o hd fique livre para receber os dados. Você deve estar logado como root para executar estes comandos.


	dd if=/dev/hda of=/dev/fd0/imagem-mbr bs=446 count=1
	dd if=/dev/fd0/imagem-mbr of=/dev/hda


### Veja também
* http://www.cgsecurity.org/wiki/TestDisk
