#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# File:         hideunhide.py
# Author:       Sergio Araujo
# Last Change:  qui 23 mar 2017 18:14:54 -03
# Created:      qui 23 mar 2017 18:14:54 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r


'''
This module has two functions

hide: input str --> str in chinese chars

unhide: input str in chinese chars -> decodes it as str
'''

def hide(msg):
    '''Encodes any string -> chinese symbols as str'''
    s = ''
    for c in msg:
        s += chr(ord(c) + 30000)
    return s


def unhide(msg):
    '''Decodes a string encoded with hide function  '''
    s = ''
    for c in msg:
        s += chr(ord(c) - 30000)
    return s
