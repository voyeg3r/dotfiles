#!/bin/bash
# Last Change: Mon, 03 Oct 2022 15:19:44
# source: https://github.com/ericmurphyxyz/dotfiles/blob/master/.local/bin/changebrightness

# NOTE: use -> $0 [up/down]
# The icons are svg and are in the dunst folder
# DEPENDENCIES: brillo

function send_notification() {
	brightness=$(printf "%.0f\n" $(brillo -G))
	dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "brightness-$1" "Brightness: $brightness%" -t 2000
}

case $1 in
up)
	brillo -s intel_backlight -A 5 -q
	send_notification $1
	;;
down)
	brillo -s intel_backlight -U 5 -q
	send_notification $1
	;;
esac

