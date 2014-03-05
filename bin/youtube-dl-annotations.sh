#!/bin/bash

VID_ID=`echo $1 | cut -f 2 -d "="`
ID=`echo $1 | awk -F= '{print $2}'`

ANN="/tmp/annotations$VID_ID.xml"
echo $VID_ID
ANN_URL="http://www.youtube.com/annotations_invideo?features=0&legacy=1&video_id=${VID_ID}"

wget "$ANN_URL" -O $ANN

LC_NUMERIC=C LC_COLLATE=C

function parseXML() {
  # remove all linebreaks
  sed ':a;N;$!ba;s/\n/ /g' ${ANN} > ${ANN}.sed
  # replace anchoredRegion tags with rects
  sed 's/anchoredRegion/rectRegion/g' ${ANN}.sed > ${ANN}.sed2
  mv ${ANN}.sed2 ${ANN}.sed
  cat ${ANN}.sed | xmlstarlet sel -t -m 'document/annotations/annotation' -v 'TEXT' -o '#' -m 'segment/movingRegion/rectRegion' -v '@t' -o '#' -b -n
}

function reformatTime() {
  H=$(echo $1 | cut -d ':' -f 1)
  M=$(echo $1 | cut -d ':' -f 2)
  S=$(echo $1 | cut -d ':' -f 3)
  printf '%02d:%02d:%02.3f' ${H} ${M} ${S} |tr '.' ','
}

SRT="/tmp/$(basename ${ANN} .xml).srt"
IFS=$'\n'
I=0

[ -f ${ANN} ] || { usage; exit 1; }
[ -f ${SRT} ] && rm ${SRT}

for LINE in $(parseXML); do
  (( I++ ))
  C=$(echo ${LINE} | cut -d '#' -f 1)
  B=$(echo ${LINE} | cut -d '#' -f 2)
  E=$(echo ${LINE} | cut -d '#' -f 3)
  echo -e "${I}\n$(reformatTime ${B}) --> $(reformatTime ${E})\n${C}\n" >> ${SRT}
done

rm ${ANN}.sed

FILENAME=`youtube-dl -t --get-filename $1`
cp $SRT ${FILENAME%.*}.srt

youtube-dl -t $1
