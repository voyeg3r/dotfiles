#!/bin/bash
# Criado em:Qui 25/Out/2007 hs 07:42
# Last Change: Sex 15 Out 2010 07:33:14 BRT
# Instituicao:
# Proposito do script: adicionar chaves gpg ao apt
# Autor: Sérgio Luiz Araújo Silva

# testa se o script está sendo executado como root
#if  [ "$(id -u) " != "0" ];  then
#  echo "  Este script deve ser executado como root "
#  exit  1
#fi

usage ()
{
	echo    "script para adicionar chave gpg ao apt"
	echo	"Uso: addkey CHAVE"
}

#  testa se o usuário digitou a chave gpg
#  a ser adicionada
if [ $# != 1 ]
then
	usage
	exit
fi

gpg --keyserver subkeys.pgp.net --recv $1
gpg --export --armor $1 | sudo apt-key add -
sudo apt-get update

