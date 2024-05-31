#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:  23-03-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  EAFP.py
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

'''
This script attempts to show the concept of:
It is easyer to ask forgiveness than permission
'''

person = {'name': 'Jess', 'age': 23, 'job': 'Programmer'}

try:
    print("I'm {name}. I'm {age} years old and I'm {job}".format(**person))
except KeyError as e:
    print(f"Missing {e} key")
