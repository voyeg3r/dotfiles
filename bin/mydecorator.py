#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  seg 27 fev 2017 20:11:10 BRT
# Created:      seg 27 fev 2017 20:11:10 BRT
# File:         Decorator example
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r


def my_docorator(inner):
    def wrapper(*args, **kwargs):
        print(f'This happens before {inner.__name__} execution')
        return inner(*args, **kwargs)
        print(f'This happens after {inner.__name__} execution')
    return wrapper

@my_docorator
def myfunc():
    print('This happened')

if __name__ == '__main__':
        myfunc()
