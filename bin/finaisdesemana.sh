#!/bin/bash
# Criado em: Qui 11/Out/2012 hs 20:56
# Last Change: 2012 Out 13 16:03:19
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: gerar uma lista com finais de semana de cada mês
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# licença: Use este script sob os termos da GNU-GPL Versão 3

begin="-$(date +'%-m') + 2"
end="10+$begin"
ano=`date +%Y`

echo " ----------------------------------"
echo "   finais de semana em $ano"
echo " ----------------------------------"
for ((i=$begin; i<=$end+1; i++)); do
    #echo $(date -d "$i month -$(date +%d) days" | awk '{ printf "%s  %s dias", $2, $3 }')
	mesporextenso=`date -d "$i  month -$(date +%d) days" +%B`
	mesnumerico=`date -d "$i  month -$(date +%d) days" +%m`
	quantosdiastemnomes=`date -d "$i  month -$(date +%d) days" +%d`
    #echo $mesnumerico $mesporextenso $quantosdiastemnomes

 	echo " ----------------------------------"
 	echo "   finais de semana em ${mesporextenso^^}"
 	echo " ----------------------------------"
	for ((y=1;y<=quantosdiastemnomes;y++)); do
		diasemana=`echo date -d "$mesnumerico/${y}/$ano" +%A | sh`
		numdiasemana=`echo date -d "$mesnumerico/${y}/$ano" +%d | sh`
		echo "   $numdiasemana $diasemana" | grep -E 'sábado|domingo'
	done
done

