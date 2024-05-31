#!/usr/bin/env zsh
# crop big images to print using A4 paper

# width=$(identify $1 | awk -F'[ x]' '{print $3}')
identify $1
echo
width=$(( $(identify $1 | awk -F'[ x]' '{print $3}')/3 ))
height=$(( $(identify $1 | awk -F'[ x]' '{print $4}') / 3 ))

echo "width --> $width"
echo "height --> $height"

echo usando o programa imagemagick "convert" para realizar esta tarefa...
echo isso pode levar um tempinho

#echo o comando executado é: convert -colorspace CMYK -crop ${width}x${height} ${1} ${1:r}'%03d'.tif
# convert -colorspace CMYK -crop $(($width/3))x$(($height/3)) $1 ${1:r}'%03d'.tif

echo executando: convert  -crop ${width}x${height} $1 ${1:r}'%03d'.png ...
convert -crop ${width}x${height} $1 ${1:r}'%03d'.png

