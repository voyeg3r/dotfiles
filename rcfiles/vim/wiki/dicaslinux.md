# Arquivo: dicas linux

```
File:		 DicasLinux.md
Created:	 Qui 09/Mai/2013 hs 09:38
Last Change: ter 10 jan 2017 07:52:45 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```
### Consertando o /etc/hosts

    [ "`awk 'NR==1 {print $NF}' /etc/hosts`" = "`hostname`" ] && echo '/etc/hosts já está ok!' || \
    sed -i.backup -r "1s/(.*)/\1 `hostname`/g" /etc/hosts

### Colocando a iso do crunchbang em um pendrive

source: http://crunchbang.org/forums/viewtopic.php?id=23267

WARNING, the following instructions will destroy any existing data on your USB stick.

Determine what device your USB is.  With your USB plugged in run:

	sudo ls -l /dev/disk/by-id/*usb*

This should produce output along the lines of:

    lrwxrwxrwx 1 root root  9 2010-03-15 22:54 /dev/disk/by-id/usb-_USB_DISK_2.0_077508380189-0:0 -> ../../sdb
    lrwxrwxrwx 1 root root 10 2010-03-15 22:54 /dev/disk/by-id/usb-_USB_DISK_2.0_077508380189-0:0-part1 -> ../../sdb1

Now cd to where your *.iso is

	cd ~/downloads

ets say the iso is named mini.iso and your USB device is sdb

Example

	sudo dd if=mini.iso of=/dev/sdb bs=4M; sync


