# ferramenta de segurança de redes

``` sh
#!/bin/bash
# https://scottlinux.com/2012/01/13/install-aircrack-ng-on-debian-linux/
# ferramenta em python para hackear redes wi-fi
# http://code.google.com/p/fern-wifi-cracker/

apt-get install build-essential libssl-dev subversion checkinstall reaver
apt-get install python-scapy
apt-get install python-qt4
apt-get install macchanger
svn co http://svn.aircrack-ng.org/trunk aircrack-ng
cd aircrack-ng
make
checkinstall --fstrans=no
airodump-ng-oui-update
airodump-ng-oui-update

wget -c http://fern-wifi-cracker.googlecode.com/files/Fern-Wifi-Cracker_1.6_all.deb
dpkg -i Fern-Wifi-Cracker_1.6_all.deb
```
