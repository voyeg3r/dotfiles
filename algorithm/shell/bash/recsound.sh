#!/usr/bin/env bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE: Ter Abr 21, 2015  08:13
# THIS SCRIPT AIMS: record sound via command line
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================

# source: http://mocha.freeshell.org/audio.html

if [ -n "$1" ]; then
    OUTFILE="${@// /_}"
else
    OUTFILE=$(date +%d-%b-%y_%H%M-%Z)
fi

#FILENAME=`awk '{print tolower($0)}' <<< "$OUTFILE"`
OUTFILE=${OUTFILE,,}

arecord -v -f cd -t raw | lame -r -h -V 0 -b 128 -B 224 - ${OUTFILE}

