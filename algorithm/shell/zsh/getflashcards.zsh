#!/usr/bin/env zsh
#    Filename: getflashcards.zsh
#     Created: sex 21 jun 2019 13:01:36 -03
# Last Change: jun 30 2019 10:01
#     Purpose: get Mairo's flashcards
#      Author: Sergio Araujo
#     Twitter: @voyeg3r
#     Licence: GPL (see http://www.gnu.org/licenses/gpl.txt)
#
#     aqui pegamos o conteúdo entre as tags e exibimos só o conteúdo
#     curl -L link |\n grep -oP '(?<=<p><strong><em>).*(?=</em></p>$)'
#

# Este bloco testa se os comandos necessários estáo instalados
NEEDED_COMMANDS=(curl perl detox)
missing_counter=0
for cmd in $NEEDED_COMMANDS; do
    if ! (( $+commands[$cmd] )); then
        echo "Command $cmd is missing!" >&2
        ((missing_counter++))
    fi
done
if ((missing_counter > 0)); then
    echo "At least one command is missing!" >&2
    exit 1
fi

read "url?Plese give me the url: "

echo "Baixando as frases ..."
curl -L $url | grep -oP '(?<=<strong><em>).*' | perl -pe 's/<\/?(em|p|strong)>//g' | perl -pe 's/<br>/|/g' > cards.csv


for i in $(curl -L $url | grep -oP 'https.*mp3'); do
    echo $(echo $url | awk -F'/' '{print $10}')
    wget -c $i
done

detox *
