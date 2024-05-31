#!/usr/bin/env bash
# File: /home/sergio/.dotfiles/dwm/scripts/screenshot_region.sh
# Last Change: Fri, 30 Sep 2022 15:03:40

# make sure we have scrot installed
[ ! $(command -v scrot) ] && doas xbps-install -Sy scrot

SD="$XDG_PICTURES_DIR/screenshots"

# make sure we have the screenshots dir
[ ! -d "$SD" ] && mkdir "$SD"

notify-send "Capturing a full screenshot!"

paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
scrot -oz -F '/home/sergio/img/screenshot-full-%d-%b-%Y-%H-%M-%S-$wx$h.png' -e 'sleep 1;sxiv $f'

