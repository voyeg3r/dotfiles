#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: checkinternet.pycheckinternet.py
#      Author: Sergio Araujo
#     Purpose: check Internet connection
# Last Change: abr 27, 2020 - 18:45
#     Created: seg 27 abr 2020 18:45:01 -03
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#     webpage: https://dev.to/voyeg3r

# <+you can press <leader>p or <c-j +>
import urllib
from urllib.request import urlopen

def is_internet():
    """
    Query internet using python
    :return:
    """
    try:
        urlopen('https://www.google.com', timeout=1)
        return True
    except urllib.error.URLError as Error:
        print(Error)
        return False

if is_internet():
    print("Internet is active")
else:
    print("Internet disconnected")

