#!/usr/bin/env bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE: Fri May 01, 2015  01:23PM
# THIS SCRIPT AIMS: describe here
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# source:           http://superuser.com/questions/536547/add-silence-to-the-end-of-an-mp3
# =================================================

# how add silence in a file
# sox <oldfile> <newfile> pad <silence at beginning of file> <silence at end of file>

# testing if user gave the filename
[ "$1" ] || { echo "Usage: $0 filename.mp3" ; exit 1 ; }


# dependences sox - testing if the system has sox installed
NEEDED_COMMANDS="sox"
missing_counter=0
for needed_command in $NEEDED_COMMANDS; do
    if ! hash "$needed_command" >/dev/null 2>&1; then
        printf "Command not found in PATH: %s\n" "$needed_command" >&2
        ((missing_counter++))
    fi
done
if ((missing_counter > 0)); then
    echo "Instale os seguintes programas: $NEEDED_COMMANDS"
    exit 1
fi

oldname=${1}

# the var below gets only the file name, if you wnat to get the
# extension do this: extension="${filename##*.}"

newname=${1%.*}-with-silence.mp3

sox $1 $newname pad 0 1

rm -f $1
mv $newname $oldname



