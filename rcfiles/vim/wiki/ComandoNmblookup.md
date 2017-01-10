### Introdução
Resolve o hostname à partir de um IP

nmbloockup -A 172.30.34.5


### Script para pegar hostnames

#!/bin/bash
# Criado em:ter 04/nov/2008 hs 08:34
# Last Change: Ter 04 Nov 2008 11:06:02 BRT
# Instituicao: funcet
# Proposito do script: pegar hostnames
# Autor: Sérgio Luiz Araújo Silva
# site: vivaotux.blogspot.com

> hosts.txt
echo " preparando a lista de hosts ativos..."
faixa=$(nmap -sP 172.35.34.1-254 | awk '/^Host/ {print $2}')
echo
echo " lista de ips ativos criada..."
echo
for i in $faixa; do
echo " obtendo hostname de $i"
nome=$(nmblookup -A $i | awk 'NR==2 {print $1}') 2>&1>> /dev/null
   if [ ! $nome == 'No' ]; then
       echo "$i $nome" | tee -a >> hosts.txt
   else
       echo "não foi possível obert o nome para $i"
   fi
done

# para ler todas as dicas que postei sobre shell script / bash acesse:
# http://vivaotux.blogspot.com/search/label/bash

