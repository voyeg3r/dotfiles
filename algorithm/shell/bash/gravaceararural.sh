#!/usr/bin/env bash
# Last Change: Sun, 31 Jul 2022 09:28:07
# usar o streamripper para gravar a radio Ceará Rural
# tags: [mp3, radio, audio]
# source: https://alvinalexander.com/linux-unix/how-to-streamripper-recordings-online-radio-streams-linux-raspberry-pi/

estacao="ceararural"
data=$(date "+%a-%d-%m-%Y-%H:%M")
url="http://stm3.xcast.com.br:8560/stream"
output_filename=${estacao}-${data}.mp3

output_dir=/home/sergio/music/podcasts/ceara-rural

user_agent="Mozilla/5.0 (platform; rv:geckoversion) Gecko/geckotrail appname/appversion Mozilla/5.0 (platform; rv:geckoversion) Gecko/geckotrail Firefox/firefoxversion appname/appversion"

# tempo em segundos
duration=7200
# duration=120

(
cd $output_dir || exit 1
streamripper  "$url"  -d "$output_dir" -q -s -l "$duration" -u "$user_agent" -a "$output_filename" -o always
)
