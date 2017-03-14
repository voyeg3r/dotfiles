#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    05-03-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  triangulares.py
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

'''
Calcula se um dado número é triangular:

Dizemos que um número é triangular se ele é produto de três
números consecutivos. Ex: 6 = 1 * 2 * 3
'''

num = int(input('Digite um número: '))

i = 1

while i * (i + 1) * (i + 2) < num:
    i += 1

if i * (i + 1) * (i + 2):
    print(f'{num} é um número triangula')
else:
    print(f'{num} não é um número triangula')
