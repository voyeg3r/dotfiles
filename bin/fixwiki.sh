#!/usr/bin/env bash
# =================================================
# Creation Date:    <+type creation's date+>
# Last Change:      ter 29 nov 2016 12:25:15 BRT
# this script aims: <+describe here+>
# author:           sérgio luiz araújo silva
# site:             http://vivaotux.blogspot.com
# twitter:          @voyeg3r
# skype:            sergioaraujosilva
# =================================================

WIKIFOLDER=$HOME/.dotfiles/rcfiles/vim/wiki
cd $WIKIFOLDER

echo "Estou na pasta $PWD"

LINUX_CMDS=$(cat ~/.vim/wiki/comandoslinux.md | (read; read; cat) | shuf -n 1)

echo "Comando $LINUX_CMDS"
sleep 1

#echo $LINUX_CMDS | sed 's,^.*(\([^)]*\)),\1,g'
CMD=$(echo $LINUX_CMDS | sed 's,^.*(\([^)]*\)),\1,g')

echo "Comando processado pelo SED"
echo "$CMD"
sleep 1

echo "--------------------------------------------------"
echo "arquivo $CMD"
echo "--------------------------------------------------"

if [ ! -f "$CMD" ]; then

   echo 'Arquivo inexistete!!!!'

   read -r -p "Deseja remove-lo? [Y/n]: " response
   response=${response,,} # tolower
   if [[ $response =~ ^(yes|y| ) ]]  || [[ -z $response ]]; then
       sed -i "/$CMD/d" comandoslinux.md
   fi
   echo "saindo do programa ..."
   sleep 1
   exit 1
fi

NF=$(awk 'BEGIN { RS="/#+.*$/"; FS="$"} {print NF}' $CMD)
sleep 1

echo "Número de seções no arquivo: $NF"

# pra pegar a variável do shell e passar pro awk temos que coloca-la
# primeiro entre aspas duplas e depois entre aspas simples, pois
# se colocarmos primeiro entre aspas simples o awk já interpreta como
# variável interna
# há uma referência neste
# link: https://stackoverflow.com/questions/19075671/how-to-use-shell-variables-in-an-awk-script

# The best way:  awk -v var="$variable"




