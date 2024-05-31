#!/bin/bash
# Criado em: Qui 11/Out/2012 hs 18:20
# Last Change: Dom 01 Mai 2016 14:55:43 BRT
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


((ano % 400)) && echo  no bissesto || echo fevereiro com 28 dias

for ((i=1;i<=31;i++)); do

 	diasemana=`echo date -d "10/${i}/$ano" +%A | sh`
 	numdiasemana=`echo date -d "10/${i}/$ano" +%d | sh`
	echo "   $numdiasemana $diasemana" | grep -E 'sábado|domingo'

done
echo " -----------------------"


