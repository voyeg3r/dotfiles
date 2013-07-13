#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Sáb 02/Mai/2009 hs 19:44
# Last Change: Sáb 02/Mai/2009 hs 19:44
# vim:ft=python:nolist:nu:
# Instituicao: non
# Proposito do script: saudação
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com

from time import strftime
hora = int(strftime("%H"))


# testar a hora e exibir a mensagem apropriada
if hora > 6 and hora <= 12 :
    print "bom dia"
elif hora > 12  and hora <=18 :
    print "boa tarde"
else:
    print "boa noite"




