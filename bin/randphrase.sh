#!/usr/bin/env bash
#     Filename: getphrase.sh
#      Created: 2019-05-24 07:33
#  Last Change: mar 14, 2020 - 09:30
#      Author: SÃ©rgio AraÃºjo - voyeg3r at gmail

# I am thinking of getting English expressions of
# https://randomwordgenerator.com/phrase.php
# and translate them using this app:
# https://www.ostechnix.com/use-google-translate-commandline-linux/ (trans)
# https://github.com/soimort/translate-shell

# PRINT A RANDOM PARAGRAPH FROM A GIVEN FILE
# I have a file called phrases were I collect phrases in English
# that I am learning and I had the crazy idea of getting on random phrase

# This script will get a random phrase (the criteria is: paragraphs separated by blank lines)

# Note: based on the output the script gives you, you can use:
# trans -b -p :en "$(randphrase.sh| awk 'NR==3 {print $0}')"

# in case of voidlinux
# sudo xbps-install -S translate-shell

NEEDED_COMMANDS="trans"
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


# target file
file=~/.dotfiles/wiki/phrases.md

# count registers
COUNT=$(awk 'BEGIN {RS="";FS="\n"} {print NR}' $file | tail -1)


# print a random number: shuf -i 1-10 -n 1
# from the third phrase (the first two are explanatory of the file)
# the last line contains tags, nor a real phrase so I have to get
# from the third paragraph to the end minus one
RANDPHRASE=$(shuf -i 3-$((COUNT -1)) -n 1)

clear
echo "phrase number: $RANDPHRASE of $((COUNT -3))"
echo

trans -b -p :en "$(awk -v number=$RANDPHRASE 'BEGIN {RS="";FS="\n"} NR==number {print $1}' $file)"

sleep 2
awk -v number=$RANDPHRASE 'BEGIN {RS="";FS="\n"} NR==number {print $2}' $file | sed 's/^\s\+//'
echo
