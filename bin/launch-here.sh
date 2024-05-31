#!/bin/sh
# File: /home/sergio/.dotfiles/bin/launch-here.sh
#  Last Change: Sat, 23 Apr 2022 10:17

# source: https://www.reddit.com/r/bspwm/comments/eorrhu/launching_an_application_in_the_desktop_youre_in/
# To use it just save it into a file and run it with the application you want to launch as argument.
# Open a command in current desktop

# ./launch-here.sh $(for i in $(echo $PATH | tr ":" "\n"); do ls -1 $i; done | dmenu)

usage() {
	echo "No command specified."
}

if [ $# = 0 ]; then
	usage
	exit 1
fi

# Creates a single-shot rule that opens next application in current desktop
bspc rule -a \* -o desktop=$(bspc query -D -d) && $@
