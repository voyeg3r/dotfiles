#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
#        File:  revstring
#     Created:  qui 17 mai 2018 15:36:28 -03
# Last Change:  2018 mai 17 19:44
#      Author:  Sergio Araujo
#     Purpose:  reverse a given string
#       email:  <voyeg3r ✉ gmail.com>
#      Github:  https://github.com/voyeg3r
#     twitter:  @voyeg3r

"""
    Returns reverted string, example:

    INPUT str

    OUTPUT reverted string

    echo one two three | revstring
    revstring another string

    You can also import this module typing → import revstring
    in order to be able to import create a symlink with .py extensio

    from revstring impor revstring
    revstring('just a test')
"""

import sys

def main():
    argument = sys.argv[1:] if len(sys.argv) > 1 else sys.stdin
    print(' '.join(argument)[::-1])

def revstring(s):
    return s[::-1]

if __name__ == "__main__":
    main()

