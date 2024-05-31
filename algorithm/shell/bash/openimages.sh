#!/usr/bin/bash
# Last Change: Sun, 15 Oct 2023 - 14:26:34
# tags: [rofi, script, dmenu]

(
cd ~/img
chosen=$(ls ~/img | rofi -dmenu)

if [ $? -ne 0 ]; then
  break
fi

sxiv "$chosen"
)
