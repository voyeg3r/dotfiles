#!/usr/bin/bash
# File: /home/sergio/.dotfiles/bin/scratchpad.sh
# Last Change: Sat, 23 Apr 2022 12:21
# source: https://wiki.archlinux.org/title/Bspwm

if [ -z $1 ]; then
	echo "Usage: $0 <name of hidden scratchpad window>"
	exit 1
fi

pids=$(xdotool search --class ${1})
for pid in $pids; do
	echo "Toggle $pid"
	bspc node $pid --flag hidden -f
done

