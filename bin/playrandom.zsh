#!/usr/bin/env zsh
#
# atribuindo valores a um array
# src_files=(**/*.mp3)
#
# Acessando valores em um array
# echo $arr[1]
#
# So to see how many elements are in the arr array, we can do the following:
# echo ${#arr}
#
# random array element
# FILES=( .../files/* )
# feh $FILES[$RANDOM%$#FILES+1]
#
# file=$src_files[RANDOM%$#src_files+1]

# performs a recursive search for mp3 files
src_files=(**/*.mp3)

clear
while true; do
    clear
    echo
    selection=$src_files[RANDOM%$#src_files+1]
    #selection=$(find -type f -iname "*.mp3" | shuf -n 1)

    echo "\tPLAYING\t ${selection:t}"
    mpg123 -q $selection

    echo "\n\tPress ENTER to continue\n\n\t[X/x] to EXIT\n\n\t[R/r] to REPEAT " && read -r response

    if [[ "${response:l}" = x ]]; then
        exit 1
    fi


    if [[ "${response:l}" = c ]]; then
        cp -f $selection ~/tmp/flashcards
    fi

    if [[ "${response:l}" = r ]]; then
        clear
        echo
        echo "\tREPEATING ${selection:t}"
        mpg123 -q "$selection"
        #echo -n "\tRepeat? [Y/n] " && read -r response
        #echo -n "\tRepeat sound [R/r]? " && read -r response
        echo "\n\tPress ENTER to continue\n\n\t[X/x] to EXIT\n\n\t[R/r] to REPEAT " && read -r response
        response="n"
    fi


done
