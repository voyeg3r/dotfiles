#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    28-02-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  print all string module constants
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
#          source:  https://pymotw.com/3/string/index.html
# ------------------------------------------------

'''
The string module includes a number of constants related to
ASCII and numerical character sets.

This module prints out every CONSTANT that is
instance of String class

This code shows some python's introspection capabilities
'''

import inspect
import string


def is_str(value):
    '''Returns True if value is instance of str
    str('this') --> True    str(42) --> False
    '''
    return isinstance(value, str)

def str_constants():
    '''Prints every constant string.method that is str'''
    for name, value in inspect.getmembers(string, is_str):
        if not name.startswith('_'):
            print(f'{name!s} = {value!r}')

if __name__ == '__main__':
        str_constants()
