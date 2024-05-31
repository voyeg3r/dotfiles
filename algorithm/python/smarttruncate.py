#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  smarttruncate.py
#         Created:  2018 mai 18 06:37
#     Last Change:  2018 mai 18 06:39
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
#       Reference: https://stackoverflow.com/a/250406/2571881
# ------------------------------------------------

def smart_truncate(content, length=100, suffix='...'):
    if len(content) <= length:
        return content
    else:
        # return ' '.join(content[:length+1].split(' ')[0:-1]) + suffix
        return content[:length].rsplit(' ', 1)[0]+suffix
