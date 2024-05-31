#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Seg 12/Abr/2010 hs 15:48
# Last Change: Sex 16 Abr 2010 22:39:48 BRT
# vim:ft=python:nolist:nu:
# Instituicao: none
# Proposito do script: calcular números primos
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com
# Referências: http://pipeless.blogspot.com/2008/09/o-crivo-de-eratstenes-em-python.html
# download: http://gist.github.com/363882#file_prime.py

print "calculo de numeros primos"
max = int(raw_input("Digite o limitie :"))
print [x for x in range(2,max) if not [t for t in range(2,int(x**1/2)) if not x%t]]


