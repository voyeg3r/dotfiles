#!/usr/bin/env bash
# =================================================
#          CREATED: Sáb 15/Jun/2013 hs 18:30
#      LAST CHANGE: 2013 Jun 16 09:01:13
# THIS SCRIPT AIMS: split string at 100 chars
#           AUTHOR: Sérgio Luiz Araújo Silva
#             SITE: http://vivaotux.blogspot.com
#          TWITTER: @voyeg3r
#            SKYPE: sergioaraujosilva
# =================================================

# Reference: http://michalfapso.blogspot.com.br/2012/01/using-google-text-to-speech.html

#var="${@:?Uso: $0 digite uma string}"
#echo "Sua string contém "${#var}" caracteres"

var="${@}"
echo "terceiro caratere da string ----> ${var:2:1}"

OIFS="$IFS"
IFS=' '
read -a palavras <<< "${var}"
IFS="$OIFS"

echo "--------------------------------"
echo "string original: ${@}"
echo "--------------------------------"
echo "primeira palavra: ${palavras[0]}"
echo "último caractere da primeira palavra --> ${palavras[0]: -1}"
echo "última palavra --> `echo ${palavras[${#palavras[*]}-1]}`"
echo "Primeiro caractere da última palavra --> `echo ${palavras[${#palavras[*]}-1]:0:1}`"

length=`echo "${palavras[@]}" | wc -c`
echo "tamanho do array 'string:' $length"

array2=()
while [ "`echo ${palavras[@]} | wc -c`" -gt "30" ]; do
	  echo "palavra removida: `echo ${palavras[${#palavras[*]}-1]}`"
	  array2=( ${palavras[${#palavras[*]}-1]} "${array2[@]}"  )
      unset palavras[${#palavras[*]}-1]
done

echo "novo tamanho: `echo "${palavras[@]}" | wc -c`"
echo "Resultado final: ${palavras[*]}"

echo "------------------------------------"
echo "${array2[@]}"



