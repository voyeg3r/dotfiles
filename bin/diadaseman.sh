#!/bin/bash
# Criado em: Qui 11/Out/2012 hs 18:20
# Last Change: 2012 Out 12 11:51:35
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: diz que dia da semana foi cada dia do mês
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r

# veja também o comando cal


mes=`date -d '10/01/2012' +%B`
ano=`date +%Y`

echo " -----------------------"
echo "   ${mes^^} ${ano^^} "
echo " -----------------------"


((ano % 400)) && echo "  ano bissesto" || echo "  fevereiro com 28 dias"

for ((i=1;i<=31;i++)); do

 	diasemana=`echo date -d "10/${i}/2012" +%A | sh`
 	numdiasemana=`echo date -d "10/${i}/2012" +%d | sh`
	echo "   $numdiasemana $diasemana" | grep -E 'sábado|domingo'

done
echo " -----------------------"


