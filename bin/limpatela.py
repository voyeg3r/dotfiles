#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Qui 04/Mar/2010 hs 14:02
# Last Change: Qui 04/Mar/2010 hs 14:02
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: limpar a tela
# Autor: Sérgio Luiz Araújo Silva 
# site: http://vivaotux.blogspot.com
# fonte: http://stackoverflow.com/questions/517970/how-to-clear-python-interpreter-console

import os

def cls():
    os.system(['clear','cls'][os.name == 'nt'])

# now, to clear the screen
cls()


