#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    31-03-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  regexsearch.py
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

# visit http://regex101.com

import re

string_de_teste = 'a gata, o gato, os gatinhos e os gatões'

# the findall method returns one list
padrao = re.findall(r'gat\w+', string_de_teste)


if padrao:
    print(padrao)
else:
    print('Padrão não encontrado')
