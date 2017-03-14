#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    05-03-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  segmentoscrescentes.py
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

'''
Dados n e uma sequencia de n números inteiros,
determinar o comprimento de um segmento crescente de comrpiment máximo

Por exemplo, na sequencia:
        5, 10, 3, 2, 4, 7, 9, 8, 5
        o comprimento máximo crescente é 4
'''

n = int(input('Digite o tamanho da sequencia: '))
ant = int(input('Digite o 1º número: '))
cont = seg = segMAX = 1

while cont < n:
    prox = int(input(f'Digite o número {cont + 1}: '))
    if prox > ant:
        seg += 1
    else:
        if seg > segMAX:
            segMAX = seg
        seg = 1
    cont += 1
    ant = prox

print(f'O maior segmento crescente da sequencia é {segMAX}')

