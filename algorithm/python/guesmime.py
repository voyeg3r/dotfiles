#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: guesmime.py
#      Author: Sergio Araujo
#     Purpose: guess mimetypes
# Last Change: abr 26, 2020 - 19:37
#     Created: dom 26 abr 2020 11:54:10 -03
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#     webpage: https://dev.to/voyeg3r
#   Reference: https://medium.com/@ajrbyers/file-mime-types-in-django-ee9531f3035b
# on void linux install magic
# sudo pip3 install python-magic

import magic
from pathlib import Path

target = Path.home() / 'music'

def file_path_mime(file_path):
    mime = magic.from_file(file_path, mime=True)
    return mime

# The check_in_memory_mime function works for Django file uploads
# pulled directly from request.FILES on POST.
def check_in_memory_mime(in_memory_file):
    mime = magic.from_buffer(in_memory_file.read(), mime=True)
    return mime

for f in target.iterdir():
    if f.is_file():
        filetype = file_path_mime(str(f.resolve()))
        print(f'{f.name} {filetype}')

