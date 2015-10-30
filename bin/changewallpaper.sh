#!/bin/bash
# source: http://stackoverflow.com/questions/10374520/gsettings-with-cron
# TODO: At night only dark wallpapers.

# to run this script automacticly you can do this: crontab -e
# */5 * * * * /home/user/bin/changewallpaper.sh

# Tip: Don't forget create one blank line at bottom in crontab file

# Wallpaper's directory.
# dir="${HOME}/pictures/new-wallpapers/
#
# # export DBUS_SESSION_BUS_ADDRESS environment variable
# PID=$(pgrep gnome-session)
# export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
#
# # Random wallpaper.
# wallpaper=`find "${dir}" -type f | shuf -n1`
#
# #Determines how the image set by wallpaper_filename is rendered. Possible values are "none", "wallpaper", "centered", "scaled", "stretched", "zoom", "spanned".
#
# #gsettings set org.gnome.desktop.background picture-options "spanned"
# gsettings set org.gnome.desktop.background picture-options "stretched"
# gsettings set org.gnome.desktop.background picture-uri "file://${wallpaper}"

# new reference: https://major.io/2015/02/11/rotate-gnome-3s-wallpaper-systemd-user-units-timers/


walls_dir=$HOME/Pictures/Wallpapers
selection=$(find $walls_dir -type f -name "*.jpg" -o -name "*.png" | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$selection"
