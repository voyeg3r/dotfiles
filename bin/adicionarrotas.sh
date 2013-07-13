#!/bin/bash
# Criado em:Ter 18/Mar/2008 hs 11:10
# Last Change: Seg 24 Mar 2008 10:24:44 BRT
# Instituicao:
# script para adicionar rotas
# Autor: Sérgio Luiz Araújo Silva

route add -net 172.17.0.0 netmask 255.255.254.0 gw 172.30.10.150
route add -net 172.19.0.0 netmask 255.255.254.0 gw 172.30.10.150

#dar permissão:
#
#   chmod 755 /etc/init.d/adicionarrotas
#
#e adicioar o script assim:
#
#    cd /etc/init.d/
#
#    update-rc.d adicionarrotas defaults
#
#!Referências
#
#* http://linuxcommand.org/man_pages/route8.html
#
#* http://www.dicas-l.com.br/print/20061010.html
##Voltar para o index ComandosLinux
