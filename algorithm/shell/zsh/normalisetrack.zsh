#!/usr/bin/env zsh
#         vim: ft=sh:fdm=syntax:nu:
#      Criado: 09-30-2015
# Last Change: 2018 mai 29 09:45
# Instituicao: instituicao
#   This aims: normalise audio tracks
#       Autor: Sergio Luiz Araujo Silva
#        site: http://vivaotux.blogspot.com

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

oldfile="${1}"
extension="${1:e}"
changedfile="${1:r}-normalized.${extension}"

value=$(sox "$oldfile" -n stat -v 2>&1 )

sox -v ${value} "$oldfile" "${changedfile}" 2>/dev/null
rm -f "$1" && mv "${changedfile}" "${oldfile}"


