#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  sáb 11 fev 2017 16:59:54 BRT
# Created:      sáb 11 fev 2017 16:59:54 BRT
# Purpose:      Remove spaces in file names
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r


import os


def removespaces():
    """Removes spaces in file names (no argument needed)"""
    for f in os.listdir('.'):
        oldname = f
        newname = f.replace(' ', '_')
        print(f'Renaming \n {oldname} --> {newname}\n')
        os.rename(oldname, newname)


if __name__ == '__main__':
        removespaces()
