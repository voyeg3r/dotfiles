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

# A opção (read; read; cat) remove as primeiras duas linhas
# opção similar com sed: sed -n '/^\[/p' comandoslinux.md
# LINUX_CMDS=$(cat ~/.vim/wiki/comandoslinux.md | (read; read; cat) | shuf -n 1)
LINUX_CMDS=$(sed -n '/^\[/p' ~/.vim/wiki/comandoslinux.md | sed 's,^.*(\([^)]*\)),\1,g' )


for CMD in $LINUX_CMDS; do
    echo "processando o comando --> $CMD"
    if [ ! -f "$CMD" ]; then
       echo 'Arquivo inexistete!!!!'
       read -r -p "Deseja remove-lo do índice? [Y/n]: " response
       response=${response,,} # tolower
       if [[ $response =~ ^(yes|y| ) ]]  || [[ -z $response ]]; then
           sed -i "/$CMD/d" comandoslinux.md
       fi
       echo "saindo da função ..."
       sleep 1
    fi
done

# NF=$(awk 'BEGIN { RS="/#+.*$/"; FS="$"} {print NF}' $CMD)
# sleep 1
#
# echo "Número de seções no arquivo: $NF"

# pra pegar a variável do shell e passar pro awk temos que coloca-la
# primeiro entre aspas duplas e depois entre aspas simples, pois
# se colocarmos primeiro entre aspas simples o awk já interpreta como
# variável interna
# há uma referência neste
# link: https://stackoverflow.com/questions/19075671/how-to-use-shell-variables-in-an-awk-script

# The best way:  awk -v var="$variable"




