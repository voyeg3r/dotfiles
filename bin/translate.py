#!/usr/bin/env python
#-*- coding: utf-8 -*-
#------------------------------------------------------------------------+
#   Dicionário Inglês/Português Babylon
#   por Fábio Cerqueira
#   Versão 0.1b para uso pessoal
#
# Licença
#    Copyright (C) 2009  Fábio Cerqueira
#
#    Este programa é software livre; você pode redistribuí-lo e/ou
#    modificá-lo sob os termos da Licença Pública Geral GNU, conforme
#    publicada pela Free Software Foundation; tanto a versão 2 da
#    Licença como (a seu critério) qualquer versão mais nova.
#    Este programa é distribuído na expectativa de ser útil, mas SEM
#    QUALQUER GARANTIA; sem mesmo a garantia implícita de
#    COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
#    PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
#    detalhes.
#    Para consultar texto em inglês visite:
#	http://www.gnu.org/licenses/gpl.txt
#
#------------------------------------------------------------------------+

import urllib2
import sys
import re

if len(sys.argv) < 2:
    print
    print "\tErro! Use: %s palavra" % __file__
    print
    sys.exit()
else:
    word = sys.argv[1]

try:
    down = urllib2.urlopen('http://online.babylon.com/cgi-bin/trans.cgi?layout=uol.txt&lang=ptg&word=%s' % word)
except:
    print 'Erro! Não foi possível conectar.'
    sys.exit(1)

texto = down.readlines()

ini = '<div style="margin: 5px;">\n'
fim = '</div>\n'

try:
    p = re.compile('(<[^<>]+>)')
    for l in texto[texto.index(ini)+1:texto.index(fim)]:
        s = p.sub('',l.replace('\n',' '))
        #print s.decode("iso-8859-1"), #sem virgula evita juntar tudo em uma linha
        print s.decode("iso-8859-1")
except ValueError:
    print 'Erro! Nao foi possível localizar a palavra.'

