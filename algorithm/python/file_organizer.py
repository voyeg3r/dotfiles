#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: file_organiser.py
#      Author: Sergio Araujo
#     Purpose: Organize files downloaded
# Last Change: abr 30, 2020 - 16:15
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#     webpage: https://dev.to/voyeg3r

from pathlib import Path
import magic

target = Path.home() / 'Downloads/'

for f in target.iterdir():
    if f.is_file():
        name, ext = f.name, f.suffix[1:]
        p = Path(target) / f'{ext}_files'
        p.mkdir(parents=True, exist_ok=True)
        Path(f).rename(p / f'{f.name}')

# # NOTE: magic.from_file receives filename as string
# def file_mime_type(filename):
#     return(magic.from_file(str(filename), mime=True))

# for f in target.iterdir():
#     if f.is_file():
#         print(f'{f.name} {file_mime_type(f)}')

