#!/bin/bash
# =================================================
#          CREATED: Ter 14/Mai/2013 hs 06:16
#      LAST CHANGE: 2013 Mai 14 06:16:31
# THIS SCRIPT AIMS: rename files to lowcase
#           AUTHOR: 2:Sérgio Luiz Araújo Silva
#             SITE: 3:http://vivaotux.blogspot.com
#          TWITTER: @voyeg3r
#            SKYPE: sergioaraujosilva
#            fonte: Dica do Júlio César Neves
# =================================================

# Se o nome do arquivo tiver pelo menos uma
#+ letra maiúscula, troca-a para minúscula

for Arq in *[A-Z]* # Pelo menos 1 minúscula
do
	if [ -f "${Arq,,}" ] # Arq em minúsculas já existe?
		then
		echo ${Arq,,} já existe
	else
		mv “$Arq” “${Arq,,}”
	fi
done


