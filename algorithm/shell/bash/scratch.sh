#!/usr/bin/env bash
# File: /home/sergio/.dotfiles/bin/scratch.sh
# Last Change: Thu, 28 Apr 2022 13:35
# source: https://gitlab.com/jped/scripts/-/blob/main/scratch

# dependency: xdotool

case "$1" in

	scratchpad)
        entry="kitty -T scratchpad"
        # entry="st -t scratchpad"
        ;;
	FM)
        entry="kitty -T FM -e ranger"
        # entry="st -t FM -e ranger"
        ;;
    Mail)
        entry="kitty -T Mail -e neomutt"
        # entry="kitty -t Mail -e neomutt"
esac

xdotool search --onlyvisible --name "$1" windowunmap \
    || xdotool search --name "$1" windowmap \
    || $entry &

