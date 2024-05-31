#!/bin/bash
# Criado em:Dom 12/Ago/2007 hs 10:49
# Last Change: dez 02 2019 10:51
# Instituicao:
#
#Analfabeta & Nilo
#
#Conversao de ogg2mp3
#
#######################################

NEEDED_COMMANDS="perl-rename"
missing_counter=0
for needed_command in $NEEDED_COMMANDS; do
    if ! hash "$needed_command" >/dev/null 2>&1; then
        printf "Command not found in PATH: %s\n" "$needed_command" >&2
        ((missing_counter++))
    fi
done
if ((missing_counter > 0)); then
    printf "Minimum %d commands are missing in PATH, aborting" "$missing_counter" >&2
    exit 1
fi

alias rename="perl-rename"

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
