#!/usr/bin/env bash
#     Filename: scapture.sh
#      Created: Sat, 18 Sep 2021 - 07:04
#  Last Change: Sat, 18 Sep 2021 - 18:34
#          vim: ft=sh:fdm=syntax:nu:

# capture screenshots using escrot
# https://www.reddit.com/r/linuxquestions/comments/j50320/

NEEDED_COMMANDS="escrotum"
missing_counter=0
for needed_command in $NEEDED_COMMANDS; do
    if ! hash "$needed_command" >/dev/null 2>&1; then
        printf "Command not found in PATH: %s\n" "$needed_command" >&2
        ((missing_counter++))
    fi
done
if ((missing_counter > 0)); then
    printf "Minimum %d commands are missing in PATH, aborting" "$missing_counter" >&2
    exit 1
fi

sleep 0.3
escrotum -s -e 'mv $f /home/sergio/img/screenshots/screenshot.png && echo -n $f | xclip -selection clipboard'
