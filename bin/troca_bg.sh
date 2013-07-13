#!/bin/bash
# Scrip para mudar background de arquivos html
#Criado: Sex 30/Dez/2005 hs 22:12
#ultima modificação: Qui 12 Jan 2006 09:13:05 BRST
#Autor: Sérgio Luiz Araújo Silva

#=================================================#
#  este script com alguma modificação é capaz de  #
#  modificar o fundo de vários arquivos html de   #
#  forma não interativa                           #
#=================================================#


for i in *.htm
  do
   cat $i | sed 's/bgcolor="#white"/bgcolor="#eeeeee"/' > ~/tmp/$i
  done


for i in *.html
  do
   cat $i | sed 's/bgcolor="#white"/bgcolor="#eeeeee"/' > ~/tmp/$i
  done
