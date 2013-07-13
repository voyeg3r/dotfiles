#!/bin/bash
# http://stackoverflow.com/questions/10374520/gsettings-with-cron

# TODO: At night only dark wallpapers.
#   Hora=$(date +%H)
#   case $Hora in
#              0? | 1[01]) dir=/caminho/para/folder/manha ;;
#              1[2-7] )  dir=/caminho/para/folder/tarde ;;
#               * ) dir=/caminho/para/folder/noite ;;
#   esac

# Wallpaper's directory.
dir="${HOME}/img/wallpapers/"

# Weird, but necessary thing to run with cron.
sessionfile=`find "${HOME}/.dbus/session-bus/" -type f`
export `grep "DBUS_SESSION_BUS_ADDRESS" "${sessionfile}" | sed '/^#/d'`

# Random wallpaper.
wallpaper=`find "${dir}" -type f | shuf -n1`

echo "trying change wallpaper to $wallpaper"

# Change wallpaper.
# http://bit.ly/HYEU9H
#gsettings set org.gnome.desktop.background picture-options "spanned"
gsettings set org.gnome.desktop.background picture-options "stretched"
gsettings set org.gnome.desktop.background picture-uri "file://${wallpaper}"
