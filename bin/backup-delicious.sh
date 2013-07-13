#!/bin/bash
# Criado em:Sex 17/Dez/2010 hs 15:11
# Last Change: 2010 Dez 17 15:24:18
# vim:ft=sh:fdm=syntax:nu:
# Instituicao: none
# Proposito do script: backup do delicious
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# twitter: http://www.twitter.com/voyeg3r
#
#curl --user login:password -o DeliciousBookmarks.xml -O 'https://api.del.icio.us/v1/posts/all'

# este script é interessante pois mostra como pegar uma
# senha em shell script

read -p "digite seu nome de usuário: " user
echo -n "Digite sua senha: "

stty -echo
read password
stty echo

echo ""         # force a carriage return to be output
#echo You entered $password

curl --user ${user}:${password} -o DeliciousBookmarks.xml -O 'https://api.del.icio.us/v1/posts/all'
