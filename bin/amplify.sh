#!/bin/bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2012 Dez 29 10:25:13
# THIS SCRIPT AIMS: describe here
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================

#ffmpeg -i /home/user/Desktop/lowSound.mkv -vol 2560 -vcodec copy /home/user/Desktop/HighSound.mkv

extension="${filename##*.}"
filename="${filename%.*}"

echo "amplificando o som do arquivo $1 ..."

ffmpeg -i "$1" -vol 2560 -vcodec copy "out2.mkv"


