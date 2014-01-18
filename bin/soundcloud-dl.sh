#!/bin/bash
#soundcloud music downloader by http://360percents.com
#development: https://github.com/lukapusic/soundcloud-dl/
#Author: Luka Pusic <luka@pusic.si>

echo "[i] soundcloud.com music downloader by http://360percents.com (cURL/Wget version)";

if [ -z "$1" ]; then
  echo "";echo "[i] Usage: `basename $0` http://soundcloud.com/link_with_tracks_on_page";echo "";exit
fi

curlinstalled=`command -V curl &>/dev/null`
wgetinstalled=`command -V wget &>/dev/null`

if $curlinstalled; then
  echo "[i] Using" `curl -V` | cut -c-21
  pages=`curl -L -s --user-agent 'Mozilla/5.0' "$1" | tr '"' "\n" | grep "tracks?" | grep "page=" | awk -F= '{print $NF}' | sort -nu | tail -n 1`
elif $wgetinstalled; then
  echo "[i] Using" `wget -V` | cut -c-24
  pages=`wget --max-redirect=1000 --trust-server-names -q -O- -U 'Mozilla/5.0' "$1" | tr '"' "\n" | grep "tracks?" | grep "page=" | awk -F= '{print $NF}' | sort -nu | tail -n 1`
else
  echo "[!] cURL or Wget need to be installed."; exit 1;
fi

if [ -z "$pages" ]; then
  pages=1
fi

echo "[i] Found $pages pages of songs!"
for (( page=1; page <= $pages; page++ ))
do
if [ "$pages" = "1" ]; then
  if $curlinstalled; then
    this=`curl -L -s --user-agent 'Mozilla/5.0' $1`;
  else
    this=`wget --max-redirect=1000 --trust-server-names -q -O- -U 'Mozilla/5.0' $1`;
  fi
else
  if $curlinstalled; then
    this=`curl -L -s --user-agent 'Mozilla/5.0' $1?page=$page`;
  else
    this=`wget --max-redirect=1000 --trust-server-names -q -O- -U 'Mozilla/5.0' $1?page=$page`;
  fi
fi
songs=`echo "$this" | grep 'streamUrl' | tr '"' "\n" | sed 's/\\u0026amp;/\&/' | grep 'http://media.soundcloud.com/stream/' | sed 's/\\\\//'`;
songcount=`echo "$songs" | wc -l`
titles=`echo "$this" | grep 'title":"' | tr ',' "\n" | grep 'title' | cut -d '"' -f 4`

if [ -z "$songs" ]; then
  echo "[!] No songs found at $1/tracks?page=$page." && exit
fi

echo "[+] Downloading $songcount songs from page $page..."

for (( songid=1; songid <= $songcount; songid++ ))
do
  title=`echo "$titles" | sed -n "$songid"p`
  echo -e "[-] Downloading $title..."
  url=`echo "$songs" | sed -n "$songid"p`
  if $curlinstalled; then
    curl -C - -s -L --user-agent 'Mozilla/5.0' -o "`echo -e "$title.mp3"`" $url;
  else
    wget -c -q --max-redirect=1000 --user-agent 'Mozilla/5.0' -O "`echo -e "$title.mp3"`" $url;
  fi
done
done
