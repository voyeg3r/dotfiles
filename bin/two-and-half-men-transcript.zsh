#!/usr/bin/env zsh
# Criado:  : sáb set 24 16:11:12 BRT 2016
# Last Change: sáb 24 set 2016 16:13:10 BRT
#
# Propósito do script: Pegar as transcrições do Two and a Half Men
# site das transcrições: http://www.springfieldspringfield.co.uk/episode_scripts.php?tv-show=two-and-a-half-men
#
# o primeiro range é feito pelo laço for
# que cria uma pasta para cada temporada
# o segundo laço é feito no comando do curl
# que pega cada episódio
#
# Issues: falta um comando que limpe o resto to texto
# mas o script está perfeitamente utilizável
#
# Dependências: perl-rename, lynx, curl, sed, zsh

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
