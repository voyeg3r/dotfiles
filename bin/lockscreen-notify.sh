#!/bin/sh
# File: /home/sergio/.dotfiles/bin/lockscreen-notify.sh
# Last Change: Wed, 22 Nov 2023 - 15:19:36
# References:
# https://dev.to/ccoveille/lock-screen-notifier-4o1h
# https://stackoverflow.com/a/8743103/2571881
# tags: [screensaver, dunst, dunstify,  notification, xautolock, x11]

set -e

# gets mouse x coordinate
mousex (){
  echo "$(xdotool getmouselocation --shell | awk -F= 'NR==1 {print $2}')"
}

pos=$( mousex )

for p in $(seq 0 2 100); do

  dunstify --icon screensaver \
    -h int:value:"$p" \
    -h 'string:hlcolor:#ff4444' \
    -h string:x-dunst-stack-tag:progress-lock \
    --timeout=500 "about to lock screen ..." "move or use corners"
      sleep 0.05

      if [ "$pos" != "$(mousex )" ] ; then
        dunstctl close
        exit 1
      fi

    done
