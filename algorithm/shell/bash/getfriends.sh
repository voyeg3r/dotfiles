#!/usr/bin/env bash
#     Filename: getfriends.sh
#      Created: 2019-10-10 13:47
#  Last Change: out 10 2019 16:03
#          vim: ft=sh:fdm=syntax:nu:
#  Instituicao: none
# This aims to: get friends transcripts
#        Autor: Sergio Araujo
#         site: http://vivaotux.blogspot.com
#       github: @voyeg3r
#       e-mail: <voyeg3r ✉ gmail.com>
#      Licence: GPL (see http://www.gnu.org/licenses/gpl.txt)

mainurl='https://www.springfieldspringfield.co.uk/view_episode_scripts.php?tv-show=friends&episode='

clear
echo "--------------------------------------------------------"
echo "Baixando transcrições para todos os episódios de Friends"
echo "--------------------------------------------------------"

for i in {01..10}; do
    season=s${i}
    echo

    for j in {01..24}; do
        episode=e${j}

        echo "Baixando temporada $i episódio $j"
        lynx --dump "${mainurl}${season}${episode}" > "friends-${season}${episode}.txt"

        if [ "$i" == 10 ] && [ "$j" == 18 ]; then
            exit
        fi
    done
done
