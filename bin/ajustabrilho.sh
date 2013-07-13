#!/bin/bash
# Criado em: Sáb 28/Jul/2012 hs 04:05
# Last Change: 2012 Ago 29 05:43:11
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: ajustar o brilho do monitor no ubuntu
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
# como saber onde estou?
# http://stereopsis.com/flux/map.html

which xflux > /dev/null 2>&1 || wget -c https://www.dropbox.com/s/f837y509u68jdz7/xflux?dl=1 -O /usr/bin/xflux && chmod 777 $_

# this coordenates are to Quixeramobim
# to get your location visit:  http://stereopsis.com/flux/map.html
# xflux -l 5.1981 -g -39.2962
# xflux -l -4.85460128 -g -39.57275391 madalena
xflux -l -5.198116 -g -39.296201
