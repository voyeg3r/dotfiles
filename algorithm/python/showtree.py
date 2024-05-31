#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#    Creation Date:  11-02-2017
#      Last Change:  2018 mai 30 09:09
# this script aims:  show files and dirs recursively
#           author:  sergio luiz araujo silva
#             site:  http://vivaotux.blogspot.com
#          twitter:  @voyeg3r
#  ------------------------------------------------
# Obs: to rename files we have to use -->  topdown=False

import os

search_folder = '.'

for root, dirs, files in os.walk(search_folder):
    print(f'Diretório: {root}')
    for file in files:
            fullfilepath = os.path.join(root, file)
            filesize = os.path.getsize(fullfilepath)
            print(f'{fullfilepath} bites: {filesize}')
    print()
