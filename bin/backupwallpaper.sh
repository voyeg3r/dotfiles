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


# images dir
IMG_DIR=$(awk -F'"' '/XDG_PICTURES_DIR/ {print $2}' ~/.config/user-dirs.dirs)
# IMG_DIR=$(awk -F'/' '/XDG_PICTURES_DIR/ {print substr($0, index($0,$2))}' ~/.config/user-dirs.dirs)

clear
echo "Dietório das imagens: $IMG_DIR"

# Backup folder
BACKUP_DIR="${IMG_DIR}/favorite-wallpapers"
echo "Diretório de backup $BACKUP_DIR"
echo $BACKUP_DIR


CURRENT_WALLPAPER=$(gsettings get org.gnome.desktop.background picture-uri | sed 's,file:///,/,g' )
echo "Papel de parede atual: $CURRENT_WALLPAPER"

echo Tentando criar ou entrar no diretório: $BACKUP_DIR"
[ ! -d "$BACKUP_DIR"  ] || mkdir "$BACKUP_DIR" && cd $BACKUP_DIR

#echo "Diretório atual: $PWD"
#sleep 2
#
# echo "verificando se $CURRENT_WALLPAPER existe"
# [ ! -f "$CURRENT_WALLPAPER" ] && echo "$CURRENT_WALLPAPER" ||  xargs cp -t "$BACKUP_DIR"
#
# echo voltado à pasta mãe
# cd -
# echo "estou na pasta: $PWD"
# sleep 1

