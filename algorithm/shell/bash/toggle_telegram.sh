#!/bin/bash
# last change: Sun, 31 Jul 2022 08:08:21

# toggle telegram on bspwm
    id=$(xdo id -N TelegramDesktop);
    if [[ -z "$id" ]]; then
        telegram-desktop;
    else
        while read -r instance
        do
            bspc node "$instance" --flag hidden -f;
        done <<< "$id";
    fi

