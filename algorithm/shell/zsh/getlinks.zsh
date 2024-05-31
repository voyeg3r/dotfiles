#!/usr/bin/env zsh
#      Created: 2018-06-14 13:47
#  Last Change: mar 30 2019 11:05
#          vim: ft=sh:fdm=syntax:nu:
# This aims to: get tv-series transcripts
#        Autor: Sergio Araujo
#         site: http://vivaotux.blogspot.com
#       github: @voyeg3r
#       e-mail: <voyeg3r ✉ gmail.com>

read 'tvshow? What tv-series do you want to get? '

# Now we are ready to go ahead
for i in $(echo {01..11}); {
    for j in $(echo {01..24}); {
        episode=s${i}e${j}

        site="https://www.springfieldspringfield.co.uk/view_episode_scripts.php?tv-show=${tvshow}&episode="$episode

        var=$(curl -s --head -w %{http_code} "$site" -o /dev/null)
        if [[ "$var" != '404' ]]; then
            echo "Baixando temporada $i episódio $j"
            w3m -dump $site -O -UTF-8 > ${episode}.txt
        fi
    }
}

# tags: curl, w3m, tools, transcripts, english
