#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  lowerename.py
#         Created:  2018 mai 30 09:27
#     Last Change:  2018 mai 30 12:30
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------
'''
In order to test try:
mkdir FOLDER\ AÇÃO\ {001..010}
'''

import os
import unicodedata
import string
#import sys

def unaccent(text):
    ''' Removes accents and spaces of filenames'''
    text = text.lower()
    check = string.ascii_lowercase + string.digits + ' '
    output = unicodedata.normalize('NFKD', text).encode('ascii', 'ignore')
    output = output.decode('utf-8')
    output = ''.join(ch for ch in output if ch in check)
    return output

for fileName in os.listdir('.'):
    Newname = unaccent(fileName)
    if not os.path.isfile(Newname):
        os.rename(fileName, Newname.replace(' ', '-'))
    else:
        print(f'{FileName} already exists!')
        Othername = input('Type and anternative name: ')
        os.rename(fileName, Othername.replace(' ', '-'))
