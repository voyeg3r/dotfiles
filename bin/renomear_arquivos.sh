#!/bin/bash
# Criado em:Dom 12/Ago/2007 hs 10:49
# Last Change: Dom 12 Ago 2007 11:11:06 BRT
# Instituicao:
# ##########################################
# Author: Fábio Berbert de Paula
# fabio@vivaolinux.com.br
#
# Favor me mandar as fotos de sua irmã e/ou 
# prima (peladas?)
# ##########################################

if [ "$#" != 2 ] 
then
   echo ""
   echo "Use: $0 <dir> <extensao>"
   echo "Exemplo: $0 /musicas mp3"
   echo ""
   exit
fi

DIR="$1"
EXT="$2"
echo ""
echo "-------------------------------------------------"
echo "Renomeando arquivos do diretório $DIR ..."
echo ""
CONT="0"
ls *.${EXT} | while read ARQ
do
   NOVO=`echo $ARQ | tr ' ' '_' | tr [:upper:] [:lower:]`
   if [ "$NOVO" != "$ARQ" ]
   then
      echo "$ARQ -> $NOVO"
      mv "$ARQ" "$NOVO"
      CONT=`expr $CONT + 1`
   fi
done

echo ""
echo " Trabalho feito! $CONT arquivo(s) renomeado(s)."
echo "-------------------------------------------------"
