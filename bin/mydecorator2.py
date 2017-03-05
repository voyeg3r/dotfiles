#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# File:         mydecorator2.py
# Author:       Sergio Araujo
# Last Change:  sáb 04 mar 2017 11:31:29 BRT
# Created:      sáb 04 mar 2017 11:31:29 BRT
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r
# source:       https://realpython.com/blog/python/primer-on-python-decorators/



import time


def timing_function(some_function):

    """
    Outputs the time a function takes
    to execute.
    """

    def wrapper():
        t1 = time.time()
        some_function()
        t2 = time.time()
        # return f'Time it took to run the function: ' + str((t2 - t1)) + "\n"
        return f'Time it took to run the function: {t2 - t1} \n'
    return wrapper


@timing_function
def my_function():
    num_list = []
    for num in (range(0, 10000)):
        num_list.append(num)
    print("\nSum of all the numbers: " + str((sum(num_list))))


print(my_function())
