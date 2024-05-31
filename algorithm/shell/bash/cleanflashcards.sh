#!/usr/bin/env bash

cp output.csv{,-backup}


for link in `cat audios.txt`; do
		echo $(basename $link) >> mp3-files.txt
done

sed -i -r '/iframe/d' output.csv
sed -i -r '/^[0-9]+ –/d' output.csv
sed -i -r 's/<(\/)?(strong|em|br|((p|span|a)[^>]*))(\/)?>//g' output.csv
sed -i -r 's|(<[/]?)(u)(>)|\1b\3|g' output.csv
sed -i -r '/^(\s+|\t)?\(/d' output.csv
sed -i -r '/CLIQUE AQUI/,$d' output.csv
sed -i -r '/^<b><\/b>/,/^$/d' output.csv
#sed -i -r '/(<b>|^$)/!d' output.csv
sed -i -r 's,\xE2\x80\xA8,</br>,g' output.csv
sed -i -r '/.*\.mp3/s/%E2%80%99/_/g' audios.txt
sed -i -e '1r mp3-files.txt' output.csv
#sed -i -r 's,http.*/[0-9]+-,,g' output.csv
sed -i -r '/^$/{N;/^\n$/d;}' output.csv
sed -i 's,\xe2\x80\x99,_,' output.csv
sed -i -r '/.*\.mp3/s/%E2%80%99/_/g' output.csv
sed -i -r '/.*mp3/s/[0-9]+-//g' output.csv

# non-breaking space
# sed -i -r '/^(\xc2\xa0)?[0-9]+/d' output.csv

# gawk -i inplace -v RS='\n\n\n' 1 output.csv
