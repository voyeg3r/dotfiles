#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  sáb 04 mar 2017 11:07:03 BRT
# Created:      sáb 04 mar 2017 11:07:03 BRT
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r


def decorator_function(original_function):
    def wrapper_function(*args, **kwargs):
        print(f'wrapper_function executed this before {original_function.__name__}')
        return original_function(*args, **kwargs)
    return wrapper_function

@decorator_function
def display():
    print('display function ran')

@decorator_function
def display_info(name, age):
    print(f'display_info ran with arguments {name} {age}')

display_info('Jonh', 25)
