#! /bin/sh
# With icon indicating the state of the mic
# Last Change: Wed, 05 Oct 2022 13:09:31
# source: https://nikhilwanpal.in/blog/mute-mic-with-keyboard-shortcut-on-ubuntu-or-linux-mint/

state=`amixer set Capture toggle | gawk 'match($0, /Front Left.*\[(.*)\]/, a) {print a[1]}'`
if [ $state = "off" ]; then
    icon="mic-mute"
else
    icon="mic-on"
fi
notify-send --hint=int:transient:1 -i $icon -r 9987 "Mic switched: $state"

