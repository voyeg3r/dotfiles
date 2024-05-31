#!/usr/bin/env bash
# File: /home/sergio/.dotfiles/dwm/scripts/screenshot_region.sh
# Last Change: Wed, 21 Sep 2022 12:55:34

# make sure we have scrot installed
[ ! $(command -v scrot) ] && doas xbps-install -Sy scrot

SD="$XDG_PICTURES_DIR/screenshots"

# make sure we have the screenshots dir
[ ! -d "$SD" ] && mkdir "$SD"

notify-send "Select a region to capture the screenshot!"

scrot -ozs -F '/home/sergio/img/screenshot-region-%d-%b-%Y-%H-%M-%S-$wx$h.png' -e 'sleep 1;sxiv $f'

