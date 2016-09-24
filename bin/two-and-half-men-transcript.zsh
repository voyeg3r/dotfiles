#!/usr/bin/env zsh

for i in `echo {01..12}`; do

mkdir season-$i && cd season-$i

curl http://www.springfieldspringfield.co.uk/view_episode_scripts.php\?tv-show\=two-and-a-half-men\&episode\=s${i}e\[01-24\] -o "two-and-a-half-men_#01.txt"
sed -i 's/\x0D$//g' *
for i in *; do
lynx -dump -display_charset=UTF-8 ./$i > $i-dumped
done
rm -f *.txt
perl-rename 's/-dumped$//g' *
sed -i '1,/scrolling/d' *
sed -i 's/<[^>]*>//g' *
sed -i.backup '/href/,/$/d'

cd ..

done
