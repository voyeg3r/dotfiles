#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    23-01-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  Remove accents of a given text
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------



import unicodedata


def unaccent(text):
    '''
    Removes accents from a givem text
    unacent(text) --> string '''
    output = unicodedata.normalize('NFKD', text).encode('ascii', 'ignore')
    output = output.decode('utf-8')
    return output

def main():
        texto_acentuado = "Ação, à la carte, a pé"
        output = unaccent(texto_acentuado)
        print(f'Texto acentuado: "{texto_acentuado}"')
        print(f'"{output}"')
        return output

if __name__ == '__main__':
        main()
