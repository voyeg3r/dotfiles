#!/bin/bash
# Criado em: Ter 16/Out/2012 hs 13:08
# Last Change: 2012 Out 30 15:53:20
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: <+nome+>
# Proposito do script: <+descreva+>
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# solução do Julio César Neves: http://br.groups.yahoo.com/group/shell-script/message/35190

# uma ideia que achei e ainda não testei
# source: http://mikebeach.org/2012/09/15/simple-linux-bash-script-to-locate-and-delete-duplicate-photos/
# find . -type f -name “*” -exec md5sum {} ; | sort | uniq -d -w 32

# para gerar um relatório faça   searchduplicated.sh | tee relatorio.txt

# a fim de reduzir o tempo de execução do script tive a ideia de testar
# a quantidade de bytes dos arquivos da mesma forma que faço com os md5sums
# esta ideia ainda não foi implementada mas acho que vai dar certo


clear
echo " Aguarde alguns instantes ..."
echo " Serão processadas `find  -iregex ".*\(jpg\|png\)" -type f | wc -l` imagens ..."
echo " Gerando a lista de Imagens..."

#Tudo=$(find -type f -iregex ".*\.\(jpg\|png\)" -print0 | xargs -0 ls -lQ | awk '{print $5,$9}')
#Sizeduplicated=$(sort <(awk '{print $1}' <<< "$Tudo") | uniq -d)
Tudo=$(find -iregex ".*\(jpg\|png\)" -type f -print0 | xargs -0 md5sum)
MdsumsDuplicated=$(sort <(awk '{print $1}' <<< "$Tudo") | uniq -d)

for i in ${MdsumsDuplicated[*]}; do
#for i in ${Sizeduplicated[*]}; do
	     echo " --------------------------------------------------------"
	     echo "    ARQUIVO DUPLICADO ...  "
	     echo " --------------------------------------------------------"
             grep $i <<< "$Tudo" | awk '{$1=""; print}'
	     echo " --------------------------------------------------------"
done

