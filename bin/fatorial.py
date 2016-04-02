#!/usr/bin/env python2
# # -*- coding: UTF-8 -*-
# Criado em:Qui 11/Mar/2010 hs 13:34
# Last Change: Sáb 02 Abr 2016 16:54:28 BRT
# vim:ft=python:nolist:nu:
# Instituicao: <+nome+>
# Proposito do script: <+descreva+>
# Autor: <+seuNome+>
# site: <+seuSite+>

# fatorial básico
#def fatorial(n):
#  if n == 1:
#    return 1
#  else:
#    return n * fatorial(n-1)

import os

# limpando a tela
if os.name == 'posix':
    os.system('clear')
else:
    os.system('cls')


def fatorial(n):
    """retorna o fatorial de um número dado"""
    if not isinstance(n, int):
        print "fatorial is only defined for integers."
        return -1
    elif n < 0:
        print "fatorial is only defined for positive integers."
        return -1
    elif n == 0:
        return 1
    else:
        return (n * fatorial(n-1))

if __name__ == '__main__':
    n = int(raw_input("digite o fatorial a ser calculado: "))
    print fatorial(n)

