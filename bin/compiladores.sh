#!/bin/bash
# Criado em:Qui 08/Jan/2009 hs 12:50
# Last Change: 2012 Out 07 08:23:52
# vim:ft=sh:fdm=syntax:nu:
# Instituicao:
# Proposito do script: instalar ferramentas para programadores
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com


# ferramentas para programadores
#echo "   Instalando ferramentas para programação"
apt-get -y install git-core  curl ctags build-essential dpkg-dev debhelper devscripts fakeroot
apt-get -y install dh-make bzip2 kernel-package linux-headers-`uname -r`
apt-get -y install bin86 libqt3-headers libqt3-mt-dev libncurses5-dev subversion beep
apt-get -y install exuberant-ctags camorama dh-make wget module-assistant hdparm smartmontools mtools
