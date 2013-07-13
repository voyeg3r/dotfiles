#!/bin/bash
# Criado em: Qui 11/Out/2012 hs 15:43
# Last Change: 2012 Out 11 15:47:41
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: limpar o spool de impressão do cups
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r

sudo service cups stop
sudo rm -rf /var/spool/cups/*
sudo service cups start


