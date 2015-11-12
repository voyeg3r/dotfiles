#!/bin/bash
# Criado em:Dom 12/Ago/2007 hs 10:49
# Last Change: Sáb 07 Nov 2015 09:02:48 BRT
# Instituicao:
#
#Analfabeta & Nilo
#
#Conversao de ogg2mp3
#
#######################################

#Removendo Espacos
rename 'y/\ /_/' `ls *.ogg`

#Maiusculas para Minusculas
rename 'y/A-Z/a-z/' `ls *.ogg`

for archivo in `ls *.ogg`
do
 #Conversao de arquivo *.ogg a *.wav
 oggdec $archivo;

 #Variavel auxiliar com nome base do arquivo
 aux="$(basename "$archivo" .ogg)"

 #Descomente a seguinte linha se deseja igualar o tamanho dos
 #arquivos
 #normalize -m "$aux.wav"

 #Verificamos que se o usuario introduziu a qualidade desejada,
 #bitrate
 #No caso de nao fornece-lo, utilizara um padrao.
 if [ -z "$1" ]
 then
  echo "O valor de bitrate nao foi fornecido. Padrao: 160kbps."
  lame -b 160 "$aux.wav" "$aux.mp3"
 else
  lame -b $1 "$aux.wav" "$aux.mp3"
 fi

 #Verificamos a possibilidade de erros
 #Se nao ha erros, remove-se os arquivos *.wav
 if [ $? -eq 0 ]
 then
  rm -f "$aux.wav"
 fi
done
