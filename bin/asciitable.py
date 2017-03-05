#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  dom 05 mar 2017 06:02:56 -03
# Created:      dom 05 mar 2017 06:02:56 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

# ascii table in python
# 0-31 are the ASCII control characters
# 32-127 are the printable characters.
# 128-255 is the extended ASCII set

# def asciitable():
#     for i in range(32, 256):
#         if i % 40 == 0:
#             print()
#         print(chr(i), sep=' ', end='')

# import string
# string.printable

asciitable= ''.join([ chr(i) for i in range(32, 128) ])
