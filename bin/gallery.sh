#!/bin/bash
# Criado em:Dom 17/Abr/2011 hs 11:55
# Last Change: 2012 Out 17 07:19:31
# vim:ft=sh:fdm=syntax:nu:
# Proposito do script: Criar uma galeria de imagens html
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r

read -p "indique o local das imagens: " place
place=`echo $place | sed 's/~/$HOME/g'`
echo $place

#
#imagens=`ls *.jpg *.png`
#cd=$OLDPWD
#
#sleep 2
##read -p "indique o tamanho das imagens por ex --> 300x150 : " tamanho
##echo "tamanho das imagens $tamanho"
##sleep 1
#
#tamanho=300x150
#echo "tamanho padrao para imagens 300x150"
#sleep 2
#
#largura=`echo $tamanho | awk -Fx '{print $1}'`
#altura=`echo $tamanho | awk -Fx '{print $2}'`
#
#> galeria1.html
#for i in $images; do
#   #echo "<td> <img src="${place}/${i} width=${largura} height=${altura}> </td>" >> galeria1.html
#   echo "<td>  <img src=\"${place}\" width=\"${largura}\" height=\"${altura}\"></td>" >> galeria1.html
#done
#
## a cada tres linhas uma quebra de coluna
#cat galeria1.html |  awk '{print $0; if (NR%3==0) print "</tr>\n<tr>"}' >> galeria.html
#
#sed -i '1i<html>\n<body>\n<table>\n<tr>' galeria.html
#sed -i '$a</table>\n</body>\n</html>' galeria.html
#
#rm -f galeria1.html
