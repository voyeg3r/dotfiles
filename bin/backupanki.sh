#!/bin/bash
# =================================================
# CREATED: Dom 12/Mai/2013 hs 13:25
# LAST CHANGE: 2013 Mai 26 05:50:56
# THIS SCRIPT AIMS: make backup of my anki deck of cards
# AUTHOR: Sérgio Luiz Araújo Silva
# SITE: ttp://vivaotux.blogspot.com
# TWITTER: @voyeg3r
# SKYPE: sergioaraujosilva
# =================================================

clear
if [ -n "`ps aux | awk '/\/usr\/bin\/anki/ {print $NF}'`" ] ; then
	echo "Abortando o backup, o Anki está em execução"
	sleep 5 && exit 1
fi

MOUNTPOINT=`mount | awk '/SAMSUNG/ {print $3}'`
echo "ponto de montagem $MOUNTPOINT"

echo "Entrando na pasta dos backups..."
cd "$HOME/Anki/Usuário 1/backups/"

ARQUIVOS=(`ls`)
echo "O arquivo ARQUIVOS[${#ARQUIVOS[*]}-1] será mantido"
unset ARQUIVOS[${#ARQUIVOS[*]}-1]

for i in "${ARQUIVOS[@]}"; do
 echo removendo arquivo "$i" && rm -f "$i"
done

#while [ `ls | wc -l` -gt 1 ] ; do
#	echo "Removendo o arquivos..."
#	ls -t | head -n 1 | xargs rm -f;
#done

if	[ -n "$MOUNTPOINT" ]; then
	echo "Fazendo o backup da pasta do Anki..."
	rsync -av --update --delete ~/Anki/ "$MOUNTPOINT/docs/conf/Anki/"
fi

