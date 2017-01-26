#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  sex 20 jan 2017 20:06:13 BRT
# Created:      sex 20 jan 2017 20:06:13 BRT
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

# this module changes
# file-1.txt to file-01.txt

import os

os.chdir('/home/sergio/tmp')
for f in os.listdir():
    f_name, f_ext = os.path.splitext(f)

    f_name, f_num = f_name.lower().split(' ')
    f_num = f_num.zfill(2)
    f_ext = f_ext.lower()

    new_name = f'{f_num}-{f_name}{f_ext}'
    print(f'renaming {f} to {new_name}')
    os.rename(f, new_name)

