#!/bin/bash
# Criado em:Qui 18/Out/2007 hs 08:01
# Last Change: Qui 18/Out/2007 hs 08:01
# Instituicao:
# Proposito do script:
# Autor:

CONT=0;
LIM=20000;
while [ $CONT -lt $LIM ];
do
mail fernando@mail.fernando.ideiasnet.com.br -s $CONT < mail.txt;
CONT=`expr $CONT + 1`;
echo $CONT;
date
done

