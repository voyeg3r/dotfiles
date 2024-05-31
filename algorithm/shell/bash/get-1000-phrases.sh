#!/usr/bin/env bash
# =================================================
# CREATED:          Sáb 29/Dez/2012 hs 10:25
# LAST CHANGE:      2018 mai 18 10:30
# THIS SCRIPT AIMS: describe here
# AUTHOR:           Sérgio Luiz Araújo Silva
# SITE:             http://vivaotux.blogspot.com
# TWITTER:          @voyeg3r
# SKYPE:            sergioaraujosilva
# =================================================

# o comando abaixo pega o texto

# lynx -dump -display_charset UTF-8 http://www.englishspeak.com/pt/english-phrases.cfm\?newCategoryShowed\=17\&sortBy\=28 | sed 's/\[[^]]*\]//g' | sed -ne '/Esconder/,/[Hh]ome/p' | sed '/Sentanças mais comuns/d' | awk 'NF > 0'

# url dos arquivos de audio mp3: http://www.englishspeak.com/instantspeak/English/phrases/mp3/

# duplicar a segunda linha: ............... cat text-001.txt | sed '2~2p'
# fazer a terceira linha lowcase: ......... sed '3~3s/\(.*\)/\L\1/'
# juntar três linhas consecutivas: ........ sed 'N;N;s/\n/ /g'

# cat text-001.txt | sed '2~2p' | sed '3~3s/\(.*\)/\L\1/' | sed '3~3s/[[:punct:]]//g' | sed '3~3s, ,,g ; 3~3s,$,.mp3,g ; 3~3s,.*,[sound:&],g' | sed 'N;N;s/\n/ /g'

# endereço 1: http://www.englishspeak.com/pt/english-phrases.cfm?newCategoryShowed=1&sortBy=28
# endereço 2: http://www.englishspeak.com/pt/english-phrases.cfm?newCategoryShowed=2&sortBy=28

# AUDIO="http://www.englishspeak.com/instantspeak/English/phrases/mp3/"
# URL='http://www.englishspeak.com/pt/english-phrases.cfm\?newCategoryShowed\='
# COMPLEMENT='\&sortBy\=28'

echo site: http://www.englishspeak.com/pt/english-phrases.cfm > link.txt

clear

for ((i=1;i<=18;i++)){

     AUDIO="http://www.englishspeak.com/instantspeak/English/phrases/mp3/"
     URL='http://www.englishspeak.com/pt/english-phrases.cfm?newCategoryShowed='
     COMPLEMENT='&sortBy=28'

     NUMBER=$(printf "%03d\n" $i)

     ADDRESS="${URL}${i}${COMPLEMENT}"

     mkdir folder-$NUMBER && cd $_

      echo "Baixando $ADDRESS"
      #lynx -dump -display_charset UTF-8 $ADDRESS | sed 's/\[[^]]*\]//g' | sed -ne '/Esconder/,/[Hh]ome/p' | sed '/Sentanças mais comuns/d' | awk 'NF > 0' > text-${NUMBER}.txt

      wget -O - -o /dev/null $ADDRESS | sed 's/<[^>]*>//g' | sed 's,\s\+, ,g' | sed '1,/\s\+(Normal)/d' | sed '/populateDrop/,$d' | sed '/^$/d' | awk 'NF > 0' > text-${NUMBER}.txt

       #echo removendo as cinco primeiras linhas
       #sed -i '1,5d' text-${NUMBER}.txt
       #sed -i 's/^\s\+//g' text-${NUMBER}.txt

       cat text-${NUMBER}.txt | sed '2~2p' | sed '3~3s/\(.*\)/\L\1/' | sed '3~3s/[[:punct:]]//g ; 3~3s/ //g ; 3~3s/$/.mp3/g ; 3~3s/.*/[sound:&]/g' | sed '1~3s/$/;/g' | sed 'N;N;s/\n/ /g' > deck.csv

       cat text-${NUMBER}.txt | sed -n '1~2!p' | tr -d '[:punct:]' | sed 's, ,,g' | sed 's,$,.mp3,' | tr '[:upper:]' '[:lower:]' > download.txt

       sed -i "s,^,$AUDIO,g" download.txt

       mkdir mp3 && cd $_

       echo "Baixando os audios..."

       wget -c -i ../download.txt

       cd ..

      cd ..

      clear
 }

 # mv folder-001 Expressões-comuns
 # mv folder-002 Cumprimentos
 # mv folder-003 Viagens-e-direções
 # mv folder-004 Numeros-e-dinheiro
 # mv folder-005 Localização
 # mv folder-006 Telefone-inernet-correio
 # mv folder-007 Data-e-hora
 # mv folder-008 No-hotel
 # mv folder-009 Hora-da-refeição
 # mv folder-010 Fazendo-amigos
 # mv folder-011 Se-divertindo
 # mv folder-012 Nas-compras
 # mv folder-013 Dificuldades-na-comunicação
 # mv folder-014 Emergência-e-saude
 # mv folder-015 Expressões-e-termos-culturais
 # mv folder-016 Questões-gerais
 # mv folder-017 No-trabalho
 # mv folder-018 O-tempo
