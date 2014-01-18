#!/bin/bash

##################################################
# Soundcloud music downloader                    #
# Author: Axel Tripier <axel.tripier@gmail.com>  #
# Original script by: Luka Pusic <luka@pusic.si> #
##################################################

function countpages() { # I/ $1 : Content of the page to check, O/ Total number of pages
    numpages=$(echo "$1" | grep -oE "page=[0-9]*" | sed 's/page=//' | sort -n | tail -n1)

    if [ -z "$numpages" ]; then
        numpages=1
    fi

    echo $numpages
}

function downsong() { # I/ $1 : URL of the song
    url="$1"
    if $curlinstalled; then
        page=$(curl -L -# --user-agent 'Mozilla/5.0' "$url")
    else
        page=$(wget --max-redirect=1000 --trust-server-names --progress=bar -U -O- 'Mozilla/5.0' "$url")
    fi
    id=$(echo "$page" | grep -v "small" | grep -oE "data-sc-track=.[0-9]*" | grep -oE "[0-9]*" | sort | uniq)
    title=$(echo "$page" | grep -A1 "<em itemprop=\"name\">" | tail -n1 | sed 's/\\u0026/\&/g' | recode html..ascii)
    artist=$(echo "$page" | grep byArtist | sed 's/.*itemprop="name">\([^<]*\)<.*/\1/g')
    echo "      [-] Downloading \"$title\" by $artist"
    filename=$(echo "$artist - $title".mp3 | tr '/' '\\')
    songurl=$(curl -s -L --user-agent 'Mozilla/5.0' "https://api.sndcdn.com/i1/tracks/$id/streams?client_id=$clientID" | cut -d '"' -f 4 | sed 's/\\u0026/\&/g')
    if $curlinstalled; then
        curl -f -C - -# -L --user-agent 'Mozilla/5.0' -o "$filename" "$songurl"
    else
        wget -c --progress=bar --max-redirect=1000 --trust-server-names -U -O- 'Mozilla/5.0' -o "$filename" "$songurl" 2>&1
    fi
}

function downallsongs() { # I/ $1 : URL of the songs
    allsongsurl="$1"
    echo "   [i] Grabbing user songs page"
    if $curlinstalled; then
        allsongspage=$(curl -L -# --user-agent 'Mozilla/5.0' "$allsongsurl")
    else
        allsongspage=$(wget --max-redirect=1000 --trust-server-names --progress=bar -U -O- 'Mozilla/5.0' "$allsongsurl")
    fi
    allsongsnumpages=$(countpages "$allsongspage")
    echo "   [i] $allsongsnumpages user songs pages found"
    for (( allsongsnumcurpage=1; allsongsnumcurpage <= $allsongsnumpages; allsongsnumcurpage++ )) ; do
        if [ "$allsongsnumcurpage" != "1" ]; then
            echo "   [i] Grabbing user songs page $allsongsnumcurpage"
            if $curlinstalled; then
                allsongspage=`curl -L -# --user-agent 'Mozilla/5.0' "$allsongsurl?page=$allsongsnumcurpage"`;
            else
                allsongspage=`wget --max-redirect=1000 --trust-server-names --progress=bar -U -O- 'Mozilla/5.0' "$allsongsurl?page=$allsongsnumcurpage"`;
            fi
        fi

        allsongsid=$(echo "$allsongspage" |  grep -oE "data-sc-track=.[0-9]*" | grep -oE "[0-9]*" | sort | uniq)

        if [ -z "$allsongsid" ]; then
            echo "   [!] No songs found on user songs page $allsongsnumcurpage"
            continue
        fi

        allsongscount=$(echo "$allsongsid" | wc -l)
        echo "   [i] Found $allsongscount song(s) on user songs page $allsongsnumcurpage"

        for (( allsongsidcursong=1; allsongsidcursong <= $allsongscount; allsongsidcursong++ ))
        do
            cursongid=$(echo "$allsongsid" | sed -n "$allsongsidcursong"p)
            cursongtitle=$(echo "$allsongspage" | grep -A6 player.*data-sc-track=\"$cursongid\" | grep "<h3>" | sed 's/.*>\([^<]*\)<\/a>.*/\1/g' | sed 's/\\u0026/\&/g' | recode html..ascii)
            cursongartist=$(echo "$allsongspage" | grep -A6 player.*data-sc-track=\"$cursongid\" | grep "byArtist" | sed 's/.*>\([^<]*\)<\/a>.*/\1/g')
            echo "      [-] Downloading \"$cursongtitle\" by $cursongartist"
            cursongfilename=$(echo "$cursongartist - $cursongtitle".mp3 | tr '/' '\\')
            if $curlinstalled; then
                cursongurl=$(curl -s -L --user-agent 'Mozilla/5.0' "https://api.sndcdn.com/i1/tracks/$cursongid/streams?client_id=$clientID" | cut -d '"' -f 4 | sed 's/\\u0026/\&/g')
            else
                cursongurl=$(wget -q --max-redirect=1000 --trust-server-names -U -O- 'Mozilla/5.0' "https://api.sndcdn.com/i1/tracks/$cursongid/streams?client_id=$clientID" | cut -d '"' -f 4 | sed 's/\\u0026/\&/g')
            fi
            if $curlinstalled; then
                curl -f -C - -# -L --user-agent 'Mozilla/5.0' -o "$cursongfilename" "$cursongurl"
            else
                wget -c --progress=bar --max-redirect=1000 --trust-server-names -U 'Mozilla/5.0' -o "$cursongfilename" "$cursongurl" 2>&1
            fi
        done
    done
}

function downset() { # I/ $1 : URL of the set
    url="$1"
    if $curlinstalled; then
        page=$(curl -L -# --user-agent 'Mozilla/5.0' "$url")
    else
        page=$(wget --max-redirect=1000 --trust-server-names --progress=bar -U -O- 'Mozilla/5.0' "$url")
    fi
    settitle=$(echo "$page" | grep -A1 "<em itemprop=\"name\">" | tail -n1 | recode html..ascii)
    songs=$(echo "$page" | grep -oE "data-sc-track=.[0-9]*" | grep -oE "[0-9]*" | sort | uniq)
    echo "      [i] Found set \"$settitle\""

    if [ -z "$songs" ]; then
        echo "      [!] No songs found"
        exit 1
    fi

    songcount=$(echo "$songs" | wc -l)
    echo "      [i] Found $songcount songs"

    for (( numcursong=1; numcursong <= $songcount; numcursong++ ))
    do
        id=$(echo "$songs" | sed -n "$numcursong"p)
        title=$(echo "$page" | grep data-sc-track | grep $id | grep -oE 'rel=.nofollow.>[^<]*' | sed 's/rel="nofollow">//' | sed 's/\\u0026/\&/g' | recode html..ascii)
        if [[ "$title" == "Play" ]] ; then
            title=$(echo "$page" | grep $id | grep id | grep -oE "\"title\":\"[^\"]*" | sed 's/"title":"//' | sed 's/\\u0026/\&/g' | recode html..ascii)
        fi
        artist=$(echo "$page" | grep -A3 $id | grep byArtist | cut -d"\"" -f2)
        echo "         [-] Downloading \"$title\" by $artist ($numcursong/$songcount)"
        filename=$(echo "$artist - $title".mp3 | tr '/' '\\')
        
        if $curlinstalled; then
            songurl=$(curl -s -L --user-agent 'Mozilla/5.0' "https://api.sndcdn.com/i1/tracks/$id/streams?client_id=$clientID" | cut -d '"' -f 4 | sed 's/\\u0026/\&/g')
        else
            songurl=$(wget -q --max-redirect=1000 --trust-server-names -U -O- 'Mozilla/5.0' "https://api.sndcdn.com/i1/tracks/$id/streams?client_id=$clientID" | cut -d '"' -f 4 | sed 's/\\u0026/\&/g')
        fi
        if $curlinstalled; then
            curl -f -C - -# -L --user-agent 'Mozilla/5.0' -o "$filename" "$songurl"
        else
            wget -c --progress=bar --max-redirect=1000 --trust-server-names -U 'Mozilla/5.0' -o "$filename" "$songurl" 2>&1
        fi
    done
}

function downallsets() { # I/ $1 : URL of the sets
    allsetsurl="$1"
    echo "   [i] Grabbing user sets page"
    if $curlinstalled; then
        allsetspage=$(curl -L -# --user-agent 'Mozilla/5.0' "$allsetsurl")
    else
        allsetspage=$(wget --max-redirect=1000 --trust-server-names --progress=bar -U -O- 'Mozilla/5.0' "$allsetsurl")
    fi
    allsetsnumpages=$(countpages "$allsetspage")
    echo "   [i] $allsetsnumpages user sets pages found"
    for (( allsetsnumcurpage=1; allsetsnumcurpage <= $allsetsnumpages; allsetsnumcurpage++ )) ; do
        if [ "$allsetsnumcurpage" != "1" ]; then
            echo "   [i] Grabbing user sets page $allsetsnumcurpage"
            if $curlinstalled; then
                allsetspage=$(curl -L -# --user-agent 'Mozilla/5.0' "$allsetsurl?page=$allsetsnumcurpage")
            else
                allsetspage=$(wget --max-redirect=1000 --trust-server-names --progress=bar -U -O- 'Mozilla/5.0' "$allsetsurl?page=$allsetsnumcurpage")
            fi
        fi

        allsetssets=$(echo "$allsetspage" | grep -A1 "li class=\"set\"" | grep "<h3>" | sed 's/.*href="\([^"]*\)">.*/\1/g')

        if [ -z "$allsetssets" ]; then
            echo "   [!] No sets found on user sets page $allsetsnumcurpage"
            continue
        fi

        allsetssetscount=$(echo "$allsetssets" | wc -l)
        echo "   [i] Found $allsetssetscount set(s) on user sets page $allsetsnumcurpage"

        for (( allsetsnumcurset=1; allsetsnumcurset <= $allsetssetscount; allsetsnumcurset++ ))
        do
            allsetsseturl=$(echo "$allsetssets" | sed -n "$allsetsnumcurset"p)
            echo "      [i] Grabbing set $allsetsnumcurset page"
            downset "http://soundcloud.com$allsetsseturl"
        done
    done
}

function show_help() {
    echo ""
    echo "[i] Usage: `basename $0` [url]"
    echo "    With url like :"
    echo "        http://soundcloud.com/user (Download all of one user's songs)"
    echo "        http://soundcloud.com/user/song-name (Download one single song)"
    echo "        http://soundcloud.com/user/sets (Download all of one user's sets)"
    echo "        http://soundcloud.com/user/sets/set-name (Download one single set)"
    echo ""
    echo "   Downloaded file names like : \"author - title.mp3\""
    echo ""
}

if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
    show_help
    exit 1
fi

# curlinstalled=`command -V curl &>/dev/null`
curlinstalled=false
wgetinstalled=`command -V wget &>/dev/null`

if $curlinstalled; then
  echo "[i] Using" `curl -V` | cut -c-21
elif $wgetinstalled; then
  echo "[i] Using" `wget -V` | cut -c-24
else
  echo "[!] cURL or Wget need to be installed."; exit 1;
fi

command -v recode &>/dev/null || { echo "[!] Recode needs to be installed."; exit 1; }

url=$(echo "$1" | sed 's-.*soundcloud.com/-http://soundcloud.com/-' | cut -d "?" -f 1)
if [[ ! "$url" =~ "http://soundcloud.com/" ]] ; then
    echo "[!] Bad URL!"
    show_help
    exit 1
fi

echo "[i] Using URL $url"

#clientID=$(echo "$page" | grep "clientID" | tr "," "\n" | grep "clientID" | cut -d '"' -f 4)
clientID="b45b1aa10f1ac2941910a7f0d10f8e28"
#echo "[i] Client ID is: $clientID"

if [[ "$(echo "$url" | cut -d "/" -f 4)" == "" ]] ; then
    echo "[!] Bad URL!"
    show_help
    exit 1
elif [[ "$(echo "$url" | cut -d "/" -f 5)" == "" ]] ; then
    echo "[i] Detected download type : All of one user's songs"
    downallsongs "$url/tracks"
elif [[ "$(echo "$url" | cut -d "/" -f 5)" == "sets" ]] && [[ "$(echo "$url" | cut -d "/" -f 6)" == "" ]] ; then
    echo "[i] Detected download type : All of one user's sets"
    downallsets "$url"
elif [[ "$(echo "$url" | cut -d "/" -f 5)" == "sets" ]] ; then
    echo "[i] Detected download type : One single set"
    echo "   [i] Grabbing set page"
    downset "$url"
else
    echo "[i] Detected download type : One single song"
    echo "   [i] Grabbing song page"
    downsong "$url"
fi
