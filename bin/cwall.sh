#!/bin/bash
# Reference: https://major.io/2015/02/11/rotate-gnome-3s-wallpaper-systemd-user-units-timers/

# how to set this up ##########################################
# mkdir ~/.config/systemd/user/

# vim ~/.config/systemd/user/gnome-background-change.service
# ------------------8<-----------------------------------
# [Unit]
# Description=Rotate GNOME background
#
# [Service]
# Type=oneshot
# Environment=DISPLAY=:0
# ExecStart=/usr/bin/bash /home/[USERNAME]/bin/cwall.sh
#
# [Install]
# WantedBy=basic.target
# ------------------8<-----------------------------------

# vim ~/.config/systemd/user/gnome-background-change.timer
# ------------------8<-----------------------------------
# [Unit]
# Description=Rotate GNOME wallpaper timer
#
# [Timer]
# OnCalendar=*:0/5
# Persistent=true
# Unit=gnome-background-change.service
#
# [Install]
# WantedBy=gnome-background-change.service
# ------------------8<-----------------------------------

# starting service
# systemctl --user enable gnome-background-change.timer
# systemctl --user start gnome-background-change.timer

# checking our work: systemctl --user list-timers
#########################################################

walls_dir=/home/sergio/img/new-wallpapers
selection=$(find $walls_dir -type f -name "*.jpg" -o -name "*.png" | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$selection"


