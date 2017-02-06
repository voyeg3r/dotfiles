#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  qui 26 jan 2017 07:22:20 BRT
# Created:      qui 26 jan 2017 07:22:20 BRT
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r


# References:
# the first version of this script came from:
# https://gist.github.com/fmasanori/4673017

# to get the file:
# lynx -dump http://www.gutenberg.org/cache/epub/11/pg11.txt > alice.txt

with open('alice.txt', 'r') as f:
        f = f.read().lower().split()

result = {i:f.count(i) for i in f if i == 'alice'}

name = next(iter(result.keys()))
num = next(iter(result.values()))

print(f'{name} aparece {num} vezes no texto')
