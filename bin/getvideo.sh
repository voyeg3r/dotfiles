#!/usr/bin/env zsh
# vim:ft=sh:fdm=syntax:nu:
# Created: Qua 30/Mar/2011 hs 09:20
# Last Change: ter 27 dez 2016 11:09:06 BRT
# This script aims to: download youtube video and creates playlist file
# Author: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# references: https://www.cyberciti.biz/tips/unix-linux-bash-shell-script-wrapper-examples.html

_youtubedl="/usr/bin/youtube-dl"
params=($@)

echo "programa: $_youtubedl"
echo "url: $params[-1]"
echo "parametros: $params"

url="$params[-1]"

[[ ! -f links.txt ]] && touch links.txt

filename=$(youtube-dl --get-filename ${url})
echo "filename: $filenme"

echo "$filename $url" >> links.txt
sort -u links.txt -o links.txt


$_youtubedl $params
