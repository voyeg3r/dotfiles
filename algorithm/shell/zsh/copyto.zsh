#!/usr/bin/env zsh
# =================================================
#             File: copyto.zsh
#          Created: 2018 mai 26 09:13
#      Last Change: 2018 mai 26 09:32
# This script aims: play audio and ask to copy to folder
#           Author: sérgio luiz araújo silva
#             Site: http://vivaotux.blogspot.com
#          twitter: @voyeg3r
#            skype: sergioaraujosilva
#        Reference: https://stackoverflow.com/a/16508612/2571881
# =================================================

cd ~/.local/share/Anki2/User\ 1/collection.media
destination="/home/sergio/tmp/realflashcards"

for file in $(ls -- *.mp3); do
    mpg123 $file
    read "response?Do you want to copy $file? [Y/n] "
    response=${response:l} #tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        echo "Copying $file to $destination"
        cp -f $file $destination
    fi
done

