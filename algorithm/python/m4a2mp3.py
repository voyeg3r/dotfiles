#!/usr/bin/env python
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#        File:  m4a2mp3.py
#      Author:  Sergio Araujo
#     Purpose:  convert m4atomp3
# Last Change:  jun 13 2018 15:20
#     Created:  jun 13 2018 14:04
#       email:  <voyeg3r ✉ gmail.com>
#      Github:  https://github.com/voyeg3r
#     twitter:  @voyeg3r

import os
from pydub import AudioSegment
from os import listdir
from os.path import isfile, join

files = [f for f in listdir('./') if isfile(join('./', f))]

# pegando so os mp3
audios = [ f for f in files if f.endswith('.m4a')]

for i in audios:
    filename , file_extension = os.path.splitext(i)
    print(f"Converting {i}... ")
    sound = AudioSegment.from_file(i)
    new_name = filename + '.mp3'
    sound.export(new_name, format="mp3", bitrate="128k")

