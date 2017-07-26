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

cd $HOME/.vim/wiki                                                  [9:04:44
echo "Estou na pasta $PWD"

LINUX_CMDS=$(cat ~/.vim/wiki/comandoslinux.md | shuf -n 1)

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


awk 'BEGIN { RS="/#+.*$/"; FS="$"} {print NF}' $CMD
sleep 1



