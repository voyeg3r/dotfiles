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


PICTURES_DIR=$(xdg-user-dir PICTURES)

echo "Diretório de imagens: $PICTURES_DIR"

CURRENT_WALLPAPER=$(gsettings get org.gnome.desktop.background picture-uri | sed 's,file:///,/,g' )

echo "Papel de parede atual: $CURRENT_WALLPAPER"

BACKUP_FOLDER="${PICTURES_DIR}/favorite-wallpapers"
echo "Pasta de backup $BACKUP_FOLDER"

[ ! -d "$BACKUP_FOLDER" ] && mkdir "${BACKUP_FOLDER}/" ; cd "$BACKUP_FOLDER"

echo "estamos em $PWD"

# echo $CURRENT_WALLPAPER | xargs cp -t ~/multimedia/img/favorites
echo $CURRENT_WALLPAPER | xargs cp -f -t .
clear



