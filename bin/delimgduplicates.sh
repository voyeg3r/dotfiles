#!/bin/bash
# Criado em: Dom 28/Out/2012 hs 05:54
# Last Change: 2012 Out 28 05:59:23
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: deletar imagens duplicadas
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r

# source: http://br.groups.yahoo.com/group/shell-script/message/35190

Tudo=$(find -iname \*.jpg -o -iname \*.png -print0 | xargs -0 md5sum)
Md5Dupl=$(sort <(cut -f1 -d' ' <<< "$Tudo") | uniq -d)

for Morre in $Md5Dupl
{
rm <(tail -n +2 <(grep $Morre "$Tudo" | cut -f2- -d' '))
}
