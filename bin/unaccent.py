#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#         Created:  23-01-2017
#     Last Change:  fev 28, 2021 - 09:07
#    What it does:  Remove accents of a given text and lowercases it
#          Author:  Sergio Luiz Araujo Silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
#     dependecies:  sudo pip install unidecode
# ------------------------------------------------

import unicodedata
import sys

''' Removes accents from a given string

    References:
    https://docs.python.org/3.6/library/unicodedata

    # dependencies
    sudo pip install unidecode

    unaccent.py "Ação, pé, alçapão --> Acao, pe, alcapao"

    echo Ação, pé, alçapão | unaccent.py
    Acao, pe, alcapao

    You can also import it

    from unaccent import unaccent
    print(unaccent('AÇÃO INCONGRUENTE?'))
'''

def main():
    '''This function will get sys.argv or stdin as argument
    and return it without punctuation and in lowercase'''
    argument = sys.argv[1:] if len(sys.argv) > 1 else sys.stdin.read()

    if isinstance(argument, list):
        argument = " ".join(str(item) for item in argument)

    argument = ''.join(argument).lower()
    print(unaccent(argument))

def unaccent(text):
    '''
    This function can be imported as flows:

    from unaccent import unaccent

    It removes accents from a givem text
    unacent('TEXT UPPERCASE AND EXCLAMATION!') --> 'text uppercase and exclamation' '''
    text = text.lower()
    output = unicodedata.normalize('NFKD', text).encode('ascii', 'ignore')
    output = output.decode('utf-8')
    output = ''.join(x for x in output if (x.isalnum() or x in "._- "))
    return output

if __name__ == '__main__':
    main()
