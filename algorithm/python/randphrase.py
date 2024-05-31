#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: randphrase.py
#      Author: Sergio Araujo
#     Purpose: read a random paragraph from a file
# Last Change: mai 31 2019 22:04
#     Created: sex 31 mai 2019 18:47:16 -03
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#
# Copying a text file into a list paragraph by paragraph in Python
# source: https://stackoverflow.com/a/40197938/2571881
#         https://stackoverflow.com/a/509295/2571881

import random
import os

# clear the screen
# def cls():
#     if os.name == 'posix':
#         os.system('clear')
#     else:
#         os.system('cls')

# cls()


# clear the screen using ternary operator
os.system('clear') if os.name == 'posix' else os.system('cls')

file = "/home/sergio/.dotfiles/nvim/wiki/phrases.md"

par = open(file).read().split('\n\n')

print()
print(random.choice(par[2:-1]))
print()

