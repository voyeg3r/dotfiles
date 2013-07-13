#!/bin/bash
# Criado em:Dom 12/Ago/2007 hs 10:49
# Last Change: Dom 12 Ago 2007 11:11:06 BRT
# Instituicao:
#
# Este script faz a saudação de acordo
# com o horário
#

 hora=`date +%H`

 if [ $hora -gt 06 -a $hora -le 12 ]; then

      saudação="bom dia"

    if [ $hora -gt 12 -a $hora -le 18 ]; then
        saudação="boa tarde"

    fi

elif [ $hora -gt 18 -a $hora -le 23 ]; then

       saudação="boa noite"


else

    if  [$hora -gt 23 -a $hora -le 06 ]; then

       saudação="é madrugada"

    fi

fi


echo "$saudação"

