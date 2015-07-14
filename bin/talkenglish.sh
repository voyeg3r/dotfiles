#!/usr/bin/env bash
# script para baixar dialogos em ingles
# são 34 diálogos com transcrição

link=`echo 'xpsa.decnavdanetsil/gninetsil/moc.hsilgneklat.www//:ptth' | rev`
mp3link=`echo '=DILA?xpsa.netsilnossel/gninetsil/moc.hsilgneklat.www//:ptth' | rev`

echo "Criando e enrando na pasta `echo moc.hsilgneklat | rev` ..."
mkdir `echo moc.hsilgneklat | rev` && cd $_

counter="300"

for i in `echo {01..34}`; do
    foldname="Advanced_Listening_Lesson_#$i"
    echo "-----------------------------------------------------"
    mkdir $foldname

    echo "Entrando na pasta $foldname ..."
    cd $foldname
    let counter++
    mp3file=`lynx -dump "${mp3link}${counter}" | grep '\.mp3' | awk '{print $2}'`
    echo "${mp3link}${counter}"
    echo baixando $mp3file
    sleep 1
    wget -c "$mp3file"
    lynx -dump "${mp3link}${counter}" | sed -n '/Show/,/You should/p' | sed '$d' > transcription.txt
    sed -i '1s/.*//g' transcription.txt
    echo "-------------------------------------------------------"
    echo "Saindo da pasta $PWD ..."
    cd ..
done

