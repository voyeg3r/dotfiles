# Arquivo: dicas do grub

```
Criado: Ter 20/Mai/2014 hs 08:44
Last Change: ter 10 jan 2017 13:47:02 BRT
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: voyeg3r
email: <voyeg3r  gmail.com>
```

Reference: http://www.edivaldobrito.com.br/recuperando-o-boot-grub-ubuntu-depois-de-instalar-o-windows/

Start your livecd linux

  sudo fdisk -l

  once you know where is mounted your system, something like this

   /dev/sda


   sudo mount /dev/sda /mnt

   sudo grub-install --root-directory=/mnt

   restart your system

