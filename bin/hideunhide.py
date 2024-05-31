#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# File:         hideunhide.py
# Author:       Sergio Araujo
# Last Change:  abr 11, 2020 - 16:29
# Created:      qui 23 mar 2017 18:14:54 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

import pyperclip
import sys

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
    pyperclip.copy(s)
    return s

def unhide(msg):
    '''Decodes a string encoded with hide function  '''
    s = ''
    for c in msg:
        s += chr(ord(c) - 30000)
    pyperclip.copy(s)
    return s

def main():
    '''This function will get sys.argv or stdin as argument
    and return it without punctuation and in lowercase'''
    argument = sys.argv[1:] if len(sys.argv) > 1 else sys.stdin.read()

    if isinstance(argument, list):
        argument = " ".join(str(item) for item in argument)

    if ord(argument[0]) > 30000:
        result = unhide(argument)
        print(result)
        pyperclip.copy(result)
    else:
        result = hide(argument)
        print(result)
        pyperclip.copy(result)

if __name__ == '__main__':
    main()
