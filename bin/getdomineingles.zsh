#!/usr/bin/env zsh
# Created: qua out  5 08:03:59 BRT 2016
# Last Change: qua 05 out 2016 13:46:57 BRT
# purpose: Download Tim's podcasts
#

# alias wget='wget -O - -o /dev/null'

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

# feed address: http://www.domineingles.com.br/tag/podcast/feed/
#

FEEDLINK="http://www.domineingles.com.br/tag/podcast/feed/"

touch links.txt

wget -O - -o /dev/null $FEEDLINK | grep -o 'http://www.domineingles[^< ]*' | sed '/\?p=/d' | grep -v 'comments' | grep -v 'feed' | sed '1d' > links.txt

clear

for i in `cat links.txt`; do

setopt nonomatch
URL=$i

AUDIO=$(wget  -O - -o /dev/null $URL | grep -o 'https:.*mp3')
FOLDERNAME=${AUDIO:t:r}

echo começando script ...
echo
[ -d $FOLDERNAME ] && cd $FOLDERNAME  || mkdir $FOLDERNAME && cd $_
echo "===================================================="
echo      entrando no diretório $FOLDERNAME  ...
echo "===================================================="
echo
echo estamos na pasta: $PWD
echo ...

# lesson title
wget -O - -o /dev/null  $URL | awk 'BEGIN{IGNORECASE=1;FS="<title>|</title>";RS=EOF} {print $2}' | sed 's/&.*$//g' | sed '/^$/d' | sed 's/^\s\+//g' > lesson-title.txt

var=$(cat lesson-title.txt)

# echo ...
# echo "Título da lição"
# cat lesson-title.txt
# mv lesson-title.txt $(cat lesson-title.txt | sed 's/^[^[]*\[\([^]]*\)\]/\1/g' | sed 's/ /-/g' | sed 's/\#//g').txt


# echo $URL > lesson-link.txt
echo
echo lesson address: $URL
echo ...

# download mp3
wget -c --show-progress $AUDIO

LESSONTITLE="${AUDIO:t:r}.txt"

echo criando o arquivo $LESSONTITLE

touch ${LESSONTITLE}

echo audio file: $(ls *.mp3)

# dumping the podcast phrases
lynx -dump $URL | sed -n '/FRASES NO/, /\[/p' | sed '/^$/,/$/d' | sed '/./{G;}' |   sed '/^\s\+\[.*/d' | sed '1s/.*/\n&/g' > $LESSONTITLE

sed -i "1i link: ${URL}" $LESSONTITLE
sed -i "2i $var" $LESSONTITLE

echo lesson phrases:
cat ${LESSONTITLE}

echo


cd ..

done

