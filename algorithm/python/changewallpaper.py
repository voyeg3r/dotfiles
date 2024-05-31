#!/usr/bin/python
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    19-06-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  <+File Name+>
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import os
import random
import mimetypes

backgrounds = os.environ['HOME'] + "/img/new-wallpapers/"
items = []

for item in os.listdir(backgrounds):
        if "image" in mimetypes.guess_type(item)[0]:
                items.append (item)


item = random.randrange (0, len (items))
os.system('gsettings set org.gnome.desktop.background picture-uri "file:///' + backgrounds + items[item] + '"' )
