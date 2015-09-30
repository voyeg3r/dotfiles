#!/usr/bin/env bash
# Criado em: 09-30-2015

# Last Change: Qua 30 Set 2015 17:13:39 BRT
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: instituicao
# Proposito do script: normalise audio tracks
# Autor: Sergio Luiz Araujo Silva
# site: http://vivaotux.blogspot.com

# how it works: https://www.learnosity.com/blog/2009/11/normalising-audio-with-sox/
# sox before.wav -n stat -v
#
# This will return a number like: 4.234
#
# You can then call sox again using this number:
#
# sox -v 4.234 before.wav after.wav
#
# And if you're feeling particularly good you can put the whole command on a single line as follows:
#
# sox -v `sox before.wav -n stat -v 2>&1` before.wav after.wav

filename="$1"
extension="${filename##*.}"
filename="${filename%.*}"

sox -v  `sox "$1" -n stat -v 2>&1` "$1" ${filename}-changed.${extension}
rm -f "$1" && mv "${filename}-changed.${extension}" "${filename}.${extension}"

