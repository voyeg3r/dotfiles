#!/bin/bash

SAVEIF=$IFS
IFS=$(echo -en "\n\b")

for file in $(ls *wav)
do
  name=${file%%.wav}
  lame -V0 -h -b 160 --vbr-new $name.wav $name.mp3
done


IFS=$SAVEIFS
