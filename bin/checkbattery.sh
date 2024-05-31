#!/bin/bash
# File: /home/sergio/.dotfiles/bin/checkbattery.sh
# Last Change: Fri, 17 Feb 2023 - 20:05:00
# vim:nolist softtabstop=4 shiftwidth=4 tabstop=4 expandtab ft=sh:

#
# References:
# https://www.2daygeek.com/linux-low-full-charging-discharging-battery-notification/
# https://www.youtube.com/watch?v=3wTt6fStYCI

# battery_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state:/ {print $2}')
# battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ "$1" == "status" ]]; then
    dunstify -i "battery-status" -r 1245 --urgency=LOW  "Battery Status" "Status: ${battery_status}%"
    exit 1
fi

if [[ "$1" == "capacity" ]]; then
    dunstify -i "battery-level" -r 1245 --urgency=LOW  "Battery Level" "Capacity: ${battery_level}%"
    exit 1
fi

if [ "$battery_level" -ge 95 ]; then
    if [[ "$battery_status" == "Charging" ]]; then
        dunstify -i "battery-charging" -r 1245 --urgency=LOW  "Battery Full" "Level: ${battery_level}%"
        #paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    fi
elif [ "$battery_level" -le 20 ]; then
    if [[ "$battery_status" == "Discharging" ]]; then
        dunstify -i "alert" -r 1245 --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
        # paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
    fi
    if [[ "$battery_status" == "Charging" ]]; then
       dunstctl close
    fi
fi

