#!/bin/bash
# Script Tradutor de palavras Ingles/Portugues baseado no babylon
# chmod +x ./tradcon.sh
# Por Jean Michel

if [ -z $1 ]; then
	echo -e "\n"
	echo "$0 PALAVRA"
	echo -e "ex: $0 kernel\n"
	exit
fi
word=$1
echo -e "palavra: $word \n"
echo -e "Pesquisando...\n"
lynx  -dump -nolist "http://info.babylon.com/cgi-bin/info.cgi?word=$word&lang=5&type=hp&layout=combo.html&n=10&list="  > /tmp/.transl
grep "Babylon" -A 15 /tmp/.transl
rm /tmp/.transl
echo -e "\n"


##################################################################
