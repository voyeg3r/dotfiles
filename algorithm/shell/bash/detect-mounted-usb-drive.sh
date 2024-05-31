#!/bin/bash
# https://stackoverflow.com/a/62721042/2571881
# purpuse: detecting when a usb drive is connected
# tags: [usb, admin, drive, mount, utils]

if [[ "$(udisksctl dump|awk -F':\n' -vRS= '/[ \t]*HintAuto:[ \t]*true/&&/\.Filesystem:/{print "found"}')" != "" ]]; then
    icon=" "
else
    icon=""
fi

printf "%s%s\\n" "$icon"

