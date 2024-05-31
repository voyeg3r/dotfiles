#!/usr/bin/env python3
#  -* - coding: utf-8 -* -
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: piramid.py
#      Author: Sergio Araujo
# https://dev.to/voyeg3r/let-s-share-some-python-snippets-1354

# the porpuse of this script is to generate an image like this
# *
# * *
# * * *
# * * * *
# * * * * *
# * * * *
# * * *
# * *
# *

# x = 1
# operacao = lambda x:x+1

# while x >= 1:
#     print( x *  "*  ")
#     x = operacao(x)
#     if x >= 5:
#         operacao = lambda x:x-1

for i in (list(range(1,6)) + list(reversed(range(1,5)))):
    print(i * "* ")

