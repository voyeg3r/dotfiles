#!/usr/bin/env bash
# command line url-shorten
# by using ur1.ca
# $USER, Aug 2009

if [ -z $1 ];then
   echo "insira a url a ser abreviada":
   read URL
   LONG=$URL
else
   LONG=$1
fi

UR1='http://ur1.ca/'

/usr/bin/env curl -s $UR1 -d"longurl=$LONG"| sed -e '/Your ur1/!d;s: *::g;s:<[^>]*>::g;s:^.*Yourur1is\:h:h:;'
