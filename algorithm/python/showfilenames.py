#!/usr/bin/env python
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#         CREATED:  Sáb 29/Dez/2012 hs 13:03
#     LAST CHANGE:  2018 mai 24 17:31
# THIS SCRIPT AIM:  this script ...
#          AUTHOR:  Sergio Luiz Araujo Silva
#            SITE:  http://vivaotux.blogspot.com
#         TWITTER:  @voyeg3r
# ------------------------------------------------

# Import the os module, for the os.walk function
import os

# Set the directory you want to start from
rootDir = '.'
for dirName, subdirList, fileList in os.walk(rootDir, topodown=False):
    print('Found directory: %s' % dirName)
    for fname in fileList:
        print('\t%s' % fname)


