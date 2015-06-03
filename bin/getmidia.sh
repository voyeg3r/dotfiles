#!/usr/bin/env bash

# lista geral de tópicos usei o rev para inverter o link, fica mais
# difícil alguém achar numa eventual busca
link='lmth.snoitasrevnoc-hsilgne-lacitcarp/gninetsil/gro.bewadnega.www//:ptth'
topics=$(lynx -dump $(echo $link | rev) | grep topics | awk '{print $2}')


# filename=$(basename "$fullfile")
# extension="${filename##*.}"
# filename="${filename%.*}"

mkdir englishlessons && cd $_

for i in $topics; do
   # lista de tópicos como greatings
   echo "--------------------------------------------------------"
   topico="$(basename $i)"
   folder=${topico%.*}
   mkdir $folder && cd $folder
   echo "entrando na pasta `pwd` ..."
   subjects=`lynx -dump $i | awk '/.htm/ {print $2}'`
   number=`lynx -dump $i | awk '/.htm/ {print $2}' | wc -l`

   echo "esse assunto tem $number subtopicos"

   for j in $subjects; do
       fulsubjectpath="$(basename $j)"
       subfolder=${fulsubjectpath%.*}
       mkdir $subfolder && cd $subfolder
       lynx -dump $j > dialogs.txt
       wget -c -r -l1 -H -nd -A mp3 -e robots=off $j
       cd ..
   done

   cd ..
done

find -iname "*.txt" | xargs sed -i '1,9d'
