#!/bin/bash
# Criado em:Dom 19/Abr/2009 hs 11:53
# Last Change: 2012 Out 07 08:24:59
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: atualizar a iso do ubuntu
# Autor: Sérgio Luiz Araújo Silva
# site: vivatux

#Script for updating individual ISO image at cdimage.ubuntu.com (daily/current versions).
#Orginal script written by Henrik Omma, slightly adjusted by Bert Verhaeghe, then a bit by Victor Van Hee

# Change this next line to the directory where your previously downloaded iso image sits.
DIR="/home/sergio/docs/isos/ubuntu/daily/"

# Choose only one of the iso files below and uncomment it
# ISO="jaunty-desktop-amd64.iso"
# ISO="jaunty-desktop-i386.iso"
# ISO="jaunty-alternate-amd64.iso"
ISO="jaunty-alternate-i386.iso"

# Uncomment the first line below for the Live CD, or the second one for the Alternate CD
ISOPATH="cdimage.ubuntu.com/cdimage/daily-live/current"
# ISOPATH="cdimage.ubuntu.com/cdimage/daily/current"

cd $DIR

echo "iniciando a checagem de integridade"
sleep 1
echo "isto leva alguns segundos, portanto seja pasciente..."
md5sum $ISO | sed -e "s/  / */" > $ISO.md5.local
# ^ create identical formatted md5sum file from local copy
echo ""
echo "########################################"
echo "# diff'ing MD5SUMs : local <-> server  #"
echo "########################################"

wget -q http://$ISOPATH/MD5SUMS
grep $ISO MD5SUMS > $ISO.md5.server
rm MD5SUMS
diff -q $ISO.md5.local $ISO.md5.server

if [ ! $? -eq "0" ]; then
        echo ""
        echo "!!! MD5SUMs differ !!!"
        echo "...Performing rsync..."
        echo "###################"
        echo "# rsync iso image #"
        echo "###################"
        rsync -avzhhP rsync://$ISOPATH/$ISO .
else
        echo ""
        echo "MD5SUMs identical -- no need to Rsync"
        echo ""
        exit 0
fi
echo ""
echo "########################################"
echo "# diff'ing MD5SUMs : local <-> server  #"
echo "########################################"

md5sum $ISO | sed -e "s/  / */" > $ISO.md5.local
diff -q $ISO.md5.local $ISO.md5.server

if [ ! $? -eq "0" ]; then
        echo ""
        echo "!!! MD5SUMs differ !!!"
        echo "!!! Rsync failed!  !!!"
else
        echo ""
        echo "MD5SUMs identical"
        echo "SUCCESS!"
fi
echo ""
