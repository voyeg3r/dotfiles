### Introdução
O comando chroot permite usar uma raiz diferente para o seu
sistema, esta funcionalidade nos possibilita coisas como:

* recuperar senha de root
* criar uma raiz falsa para um site web

### Recuperando a senha de root com o chroot
Carregue um lice-cd qualquer, torne-se root com

sudo su -

exiba as partições para saber onde está a raiz

fdisk -l

e monte a partição raiz do sistema
que está instalado no hd:

mount /dev/hda1 /mnt/linux

agora dê um chroot no diretório montado

chroot /mnt/linux

finalmente mude a senha de root

passwd

Reinicie seu sistema

shutdown -r 0

[[media type="youtube" key="tI2ozlgSJUE" height="385" width="480"]]

