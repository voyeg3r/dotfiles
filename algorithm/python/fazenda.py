#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# vim:ft=python:nolist:nu:
#           Criado em: Qui 11/Mar/2010 hs 14: 50
#         Last Change: 2018 jun 01 19:56
#         Instituicao: <+nome+>
# Proposito do script: <+descreva+>
#               Autor: <+seuNome+>
#                site: <+seuSite+>
"""
   Um fazendeiro tem um bando de porcos e um bando de galinhas.
   Ele sai para o terreiro e observa 20 cabeças e 56 pernas.
   Quantos porcos e quantas galinhas que ele tem?

   Observando o algoritmo você vai pareceber que ele trabalha por força bruta,
   tentando cada opção até chegar ao equilíbrio das igualdades.

   para calcular: barnYard(cabecas,pernas)
"""


def solve(numLegs, numHeads):
    for numChicks in range(0, numHeads + 1):
        numPigs = numHeads - numChicks
        totLegs = 4*numPigs + 2*numChicks
        if totLegs == numLegs:
                return [numPigs, numChicks]
    return [None, None]

def barnYard(heads, legs):
    pigs, chickens = solve(legs, heads)
    if pigs == None:
        print "There is no solution."
    else:
        print 'Number of pigs: ', pigs
        print 'Number of Chickens: ', chickens

if __name__ == '__main__':
    cabecas=int(raw_input("Quantas cabeças? "))
    pernas=int(raw_input("Quantas pernas? "))
    barnYard(cabecas,pernas)
