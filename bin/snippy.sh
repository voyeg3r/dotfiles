#!/bin/bash
# read the abbreviation
xdotool key ctrl+shift+Left
xdotool key ctrl+x
sleep 0.2s # to work reliably in Firefox
SELECTION=`xsel -b`
# read snippet file
xsel -b -i < ~/.snippy/${SELECTION}
# paste snippet
xdotool key ctrl+v
xdotool key BackSpace # delete the last blank line, so we stay inline
