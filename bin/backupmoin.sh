#!/bin/bash
# Criado em:Seg 29/Out/2007 hs 10:15
# Last Change: Seg 29 Out 2007 10:47:20 BRT
# Instituicao:
# Proposito do script: backup do wiki moinmoin
#                      para uma máquina remota

# Autor: Sérgio Luiz Araújo Silva

# checa se o usuário corrente é root
if  [ `id -u` != "0" ];  then
  echo "  Este script deve ser executado como root"
  sleep 2
  exit  1
fi


echo "   Iniciando copia dos arquivos"

cd /usr/share

tar cjvf backup-moin`date +%d-%m-%y`.tar.bz2 moin

rsync -av backup-moin`date +%d-%m-%y`.tar.bz2 sergio@natalia:/home/sergio/

rm -f backup-moin`date +%d-%m-%y`.tar.bz2
echo "  backup realizado com sucesso"

