#!/bin/bash
# Criado em:Qua 30/Mar/2011 hs 09:20
# Last Change: 2011 Out 23 08:38:09
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: salvar video em flash
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# source: http://blog.liquuid.net/2011/03/26/como-salvar-um-video-do-youtube-no-novo-flash-plugin/

processo=`lsof | grep deleted | grep /tmp/Flash | awk '{print $2}' | uniq`
link=`ls -l /proc/${processo}/fd/ | grep '/tmp/Flash' | awk '{print $8}'`

cp /proc/${processo}/fd/${link} ./

