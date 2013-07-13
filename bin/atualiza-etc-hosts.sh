#!/bin/bash
# Criado em:Qua 15/Dez/2010 hs 15:22
# Last Change: 2010 Dez 15 17:43:19
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: proteger o /etc/hosts colocando proteção contra sites maliciosos
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# source: https://www.ibm.com/developerworks/
# source short url: http://ur1.ca/2lihx

# este script ainda está incompleto

# Only root make this work
if [ "$(id -u)" != "0" ]; then
    echo "  Need be root"
    sleep 2
    exit  1
fi

MD5SUM=`wget -qO -  http://www.mvps.org/winhelp2002/hosts.htm | \
    sed 's/<[^>]*>//g' - | awk '/SHA-1/ {print $1}' | tr 'A-Z' 'a-z'`

MD5SUMOLDFILE=`md5sum hosts.txt | awk '{print $1}'`

if [ "MD5SUM" != "MD5SUMOLDFILE" ] 2>/dev/null ; then
    echo "Downloading the new version..."
    wget -c http://www.mvps.org/winhelp2002/hosts.txt -O /etc/hosts
    sed -i.backup 's/\x0D$//g' /etc/hosts
else
    echo "Your /etc/hosts already updated"
fi

# adiciona o dns do google ao /etc/hosts
[ -z "`grep '8.8.8.8' /etc/hosts 2>>/dev/null`" ] || echo \
    '8.8.8.8 google-public-dns-a.google.com' >> /etc/hosts

# conserta /etc/hosts
[ -z `head -1 /etc/hosts | grep -o $(hostname)` ] && sed \
    -i.backup -r "1s/(.*)/\1 `hostname`/g" /etc/hosts
