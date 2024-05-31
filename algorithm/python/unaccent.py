#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#         Created:  23-01-2017
#     Last Change:  abr 19, 2020 - 15:49
#    What it does:  Remove accents of a given text
#          Author:  sergio luiz araujo silva
#            Site:  https://dev.to/voyeg3r
#         twitter:  @voyeg3r
# ------------------------------------------------

import unicodedata
import sys

def unaccent(text):
    '''
    Removes accents from a givem text
    unacent(text) --> string '''
    output = unicodedata.normalize('NFKD', text).encode('ascii', 'ignore')
    output = output.decode('utf-8')
    return output

def main():
    argument = sys.argv[1:] if len(sys.argv) > 1 else sys.stdin.read()
    argument = ' '.join(argument).lower()
    print(unaccent(argument))

# def example():
#         texto_acentuado = "Ação, à la carte, a pé"
#         output = unaccent(texto_acentuado)
#         print(f'Texto acentuado: "{texto_acentuado}"')
#         print(f'"{output}"')
#         return output

if __name__ == '__main__':
        main()

