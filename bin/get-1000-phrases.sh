#!/usr/bin/env bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2012 Dez 29 10:25:13
# THIS SCRIPT AIMS: describe here
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================

URL="http://www.englishspeak.com/pt/english-phrases.cfm\?newCategoryShowed\="
COMPLEMENT="\&sortBy\=28"


# o comando abaixo pega o texto

# lynx -dump -display_charset UTF-8 http://www.englishspeak.com/pt/english-phrases.cfm\?newCategoryShowed\=17\&sortBy\=28 | sed 's/\[[^]]*\]//g' | sed -ne '/Esconder/,/[Hh]ome/p' | sed '/Sentanças mais comuns/d' | awk 'NF > 0'

clear

for ((i=1;i<=19;i++)){
    echo Criando a pasta $(printf "%03d\n" $i) ...
    echo Entrando na pasta ...
    mkdir folder-$(printf "%03d\n" $i) && cd $_
    echo Obtendo o arquivo $(printf "%03d\n" $i) ...
    lynx -dump -display_charset UTF-8 ${URL}${i}${COMPLEMENT} | sed 's/\[[^]]*\]//g' | sed -ne '/Esconder/,/[Hh]ome/p' | sed '/Sentanças mais comuns/d' | awk 'NF > 0' > text-$(printf "%03d\n" $i).txt

     cd ..
}



