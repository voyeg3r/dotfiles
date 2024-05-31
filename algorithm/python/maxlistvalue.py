#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  max-list-value.py
#   Creation Date:  08-02-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
# this script aim:  Return the maximum value from a given list
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------
'''
This script must be used only for didatic purpuses once
you can use max(some_list) or sorted(lst)[-1] to get the
maximum value of one given list
source: http://codereview.stackexchange.com/a/51568/7431
'''


def maxListValue(lst):
    ''' Returns the maximum value from a given list '''
    max_val = lst[0]        # initialize with the first value from the list
    for item in lst:        # loop over the items in the list
        if item > max_val:  # compare current item with the maximum seen so far
            max_val = item  # set new max
    return max_val          # return the max
