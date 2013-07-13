#!/bin/bash
# Script to se GNU/Linux date remotely
# Author: Sergio Luiz Araujo Silva
# Site: http://vivaotux.blogspot.com/
# twitter: twitter.com/@voyeg3r
# Created: 2011-10-07 08:38:00
# Last Change: 2011-10-07 08:38:00
#
# Need be root, has lynx in system and network
#
# com algumas modificações coloque em /etc/network/if-up.d/acertahora.sh

clear
echo
echo " Progrma para acertar a hora do sistema"

# testa se está logado como root
if [ "$(id -u)" != "0" ]; then
	echo " Rode este programa como root"
	sleep 2
	exit 1
fi

PROGRAM=`which lynx`

if [ -z "$PROGRAM" ]; then
   clear
   echo " Instale primeiro o programa lynx"
   read -p " pressione uma tecla para sair"
   exit
fi

# site utilizado para pegar a hora
SERVER="http://pcdsh01.on.br/HoraLegalBrasileira.asp"

# neste ponto a variável ainda está num formato inadequado
VAR=`$PROGRAM -dump $SERVER | awk 'NR==7 {print $1,$2}'`

# agora manipulo com o sed para colocar no formato adequado
HORAREMOTA=`echo $VAR | sed -r 's,([0-9]+)[^0-9]([0-9]+)[^0-9]([0-9]{4})\s+(.*),\3-\2-\1 \4,g'`
echo " Hora do servidor remoto: $HORAREMOTA"
echo " Hora do servidor local `date`"

# to set date by string put betwen quotation marks
echo " `date -s "$HORAREMOTA"`"
echo

