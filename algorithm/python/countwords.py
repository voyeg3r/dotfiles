#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
#
# Author:       Sergio Araujo
# Last Change:  qua 25 jan 2017 20:09:07 BRT
# Created:      qua 25 jan 2017 20:09:07 BRT
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

# References:
# the first version of this script came from:
# https://gist.github.com/fmasanori/4673017

# to get the file:
# lynx -dump http://www.gutenberg.org/cache/epub/11/pg11.txt > alice.txt

with  open('alice.txt', 'r') as f:
    texto = f.read().lower()

import string
for c in string.punctuation:
    texto = texto.replace(c, ' ')

texto = texto.split()

dic = {}
for p in texto:
    if p not in dic:
        dic[p] = 1
    else:
        dic[p] += 1

print(f'Alice aparece {dic["alice"]} vezes no texto')


