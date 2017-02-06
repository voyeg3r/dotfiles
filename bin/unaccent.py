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

# to use unaccent function
# import from unaccent import unaccent

import unicodedata


def unaccent(text):
    output = unicodedata.normalize('NFKD', text).encode('ascii', 'ignore')
    return output
