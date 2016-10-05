#!/usr/bin/env zsh
# =================================================
# CREATED:          qua set 21 13:40:53 BRT 2016
# Last Change: qua 05 out 2016 08:36:17 BRT
# THIS SCRIPT AIMS: get mairo's vergara flashcards
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================
#
# OBS:
# ==========Do not forget creating your own ~/.wgetrc===
#
#    ### Sample Wget initialization file .wgetrc by http://www.askapache.com
#    ## Local settings (for a user to set in his $HOME/.wgetrc).  It is
#    ## *highly* undesirable to put these settings in the global file, since
#    ## they are potentially dangerous to "normal" users.
#    ##
#    ## Even when setting up your own ~/.wgetrc, you should know what you
#    ## are doing before doing so.
#    header = Accept-Language: en-us,en;q=0.5
#    header = Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
#    header = Connection: keep-alive
#    user_agent = Mozilla/5.0 (Windows NT 5.1; rv:10.0.2) Gecko/20100101 Firefox/10.0.2
#    referer = http://www.askapache.com/
#    robots = off
#
#   Dependences to run this script:
#   zsh perl-rename wget sed grep awk

setopt nonomatch
URL=$1

echo "$URL" > lesson-url.txt

# OBS: Maybe the biggest problem I came across was this stupid
# unseprable char: \xc2\xa  --> see more on this post:
# http://askubuntu.com/questions/357248/how-to-remove-special-m-bm-character-with-sed

# URL="http://www.mairovergara.com/come-handy-o-que-significa-esta-expressao/"


# download dos textos
# wget -O - -o /dev/null http://www.mairovergara.com/come-handy-o-que-significa-esta-expressao/ | grep strong | sed 's/<[^>]*>//g' | sed 's/([^)]*)//g' | sed '/Download da Lição/,$d' | sed '/^$/d' | sed '1~2p' > text.txt

# wget -O - -o /dev/null "$URL" | grep strong | sed 's/<[^>]*>//g' | sed 's/([^)]*)//g' | sed '/Download da Lição/,$d' | sed '/^$/d' | sed '1~2s,.*,&\n[sound:&mp3];,g' | sed '2~2s, ,-,g' | awk '{print}; NR%3==0 {print ""}' | awk 'BEGIN {RS=""}; {$1=$1;print}' | sed 's,\.\s\+,.,g' > deck.csv

# old url: "http://www.mairovergara.com/rip-off-phrasal-verb-significado/"

wget -O - -o /dev/null "$URL"  | grep strong | sed 's/<[^>]*>//g' | sed 's/([^)]*)//g' | sed -re '/Download da Lição/,$d' | sed '/Abaixo temos exemplos/d' | sed '/no sentido/d' | sed '/com o sentido/d' | sed '/exemplos abaixo/d' |  sed '/^[0-9][^:]*:/d' | sed 's,&#8220;,,g' |  sed "s/&#8217;/'/g" | sed 's,&#8221;,",g' |  sed 's/\xc2\xa0/ /g' > deck.csv

cat deck.csv > tempdeck.csv


#  cat tempdeck.csv | sed '/^$/d' | sed '1~2s,.*,&[sound:&mp3];,g' | awk '{print}; NR%2==0 {print ""}' | awk 'BEGIN {RS=""}; {$1=$1;print}'
#  preciso de um awk para remover espaços de substrings


cat deck.csv | sed '/^$/d' | sed '/http.*/d' | sed '1~2s/.*/&\n[sound:&mp3];/g' | sed '2~3s/ /-/g' | sed '2~3s/,//g' | sed '2~3s/\!\(\mp3\)/.\1/g'| sed '2~3s/\?mp3/.mp3/g' | awk '{print}; NR%3==0 {print ""}' | awk 'BEGIN {RS=""}; {$1=$1;print}' | sed 's/\.\s\+/./g' | sed 's/\! /!/g' > deck.csv


# cat deck.csv | sed -i "s/\&\#8217;/'/g" deck.csv > tempdeck.csv

# wget -O - -o /dev/null http://www.mairovergara.com/come-handy-o-que-significa-esta-expressao/ | grep strong | sed 's/<[^>]*>//g' | sed 's/([^)]*)//g' | sed '/Download da Lição/,$d' | sed '/^$/d' | sed '1~2s,.*,&\n[sound:&mp3];,g' | awk '{print}; NR%3==0 {print ""}' | awk 'BEGIN {RS=""}; {$1=$1;print}' | sed 's,\.\s\+,.,g' > deck.csv


# cat text.txt | sed '1~2s,.*,&[sound:&mp3],g' > text.txt


# download dos audios
# wget -O - -o /dev/null http://www.mairovergara.com/come-handy-o-que-significa-esta-expressao/ | grep -o 'http://[^ >]*\.mp3' > links.txt
wget -O - -o /dev/null "$URL" | grep -o 'http://[^ >]*\.mp3' | sort -u  > links-dos-audios.txt
# wget -O - -o /dev/null http://www.mairovergara.com/come-handy-o-que-significa-esta-expressao/ | grep -o 'http://[^ >]*\.mp3?_=1[^.<]' > links.txt

# donwload dos audios
echo "criando diretório mp3..."
mkdir mp3
cd mp3
wget -i ../links-dos-audios.txt
echo "Diretório atual: $PWD"

perl-rename 's/^\d+-//g' *

# for i in *.mp3.*; do
#   rm -f $i
# done
# remover dígitos no começo dos arquivos mp3

# copiar audios para a pasta do anki
for i in *.mp3; cp $i ~/docs/Anki/sergio/collection.media/
cd ..

# documentation
# wget -O - -o /dev/null ............ baixa a página para o terminal sem fazer download
# grep strong ....................... pega as frases
# sed 's/<[^>]*>//g' ................ remove tags html
# sed 's/([^)]*)//g' ................ remove observações
# sed '/Download da Lição/,$d' ...... apaga até o final da página
# sed '/^$/d' ....................... apaga linhas vazias
# sed '1~2s/ /-/g' .................. troca espaços por traços nas linhas impares


