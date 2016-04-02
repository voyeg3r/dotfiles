#!/usr/bin/env python2
# # -*- coding: UTF-8 -*-
# Criado em:Qui 11/Mar/2010 hs 08:19
# Last Change: Sáb 02 Abr 2016 16:56:30 BRT
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: calcular sequencia de fibonacci
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
"""
importe: from fibonacci import fib
g = fib
for i in range(max):
        print g.next(),
"""
from __future__ import generators
import os

# limpando a tela
if os.name == 'posix':
    os.system('clear')
else:
    os.system('cls')


# needs Python 2.2 or above!
def fib():
    "unbounded generator, creates Fibonacci sequence"
    x,y=0,1
    while 1:
        x, y = y, x + y
        yield x

if __name__ == "__main__":
    g = fib()
    max = int(raw_input("Digite o numero a calcular: "))
    for i in range(max):
        print g.next(),

