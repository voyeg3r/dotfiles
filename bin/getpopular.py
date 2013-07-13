#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Ter 02/Mar/2010 hs 11:58
# Last Change: 2011 Abr 11 13:41:56
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: pesquisar tags populares no delicious
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com

# versão 1.2


# instale pydelicious
# sudo su -
# easy_install -z http://pydelicious.googlecode.com/files/pydelicious%2Btools-0.5.3.zip

import sys
import os

# limpar a tela
if os.name == 'posix':
    os.system('clear')
else:
    os.system('cls')

# como o módulo pydelicious pode não estar instalado coloquei este try/except
try:
    import pydelicious
except ImportError:
    print " "
    print " você tem que instalar primeiro a biblioteca pydelicious"
    print ""
    print " sudo aptitude install python-setuptools"
    print " sudo easy_install http://pydelicious.googlecode.com/files/pydelicious-0.6.zip"
    print " "
    sys.exit(1)


if len(sys.argv) != 2:
    print ' Uso: %s tag' % sys.argv[0]
    sys.exit(1)

populares=pydelicious.get_popular(tag=str(sys.argv[1]))
print "\n".join([ x.get('url') for x in populares] )
