#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  sex 17 fev 2017 20:43:18 BRT
# Created:      sex 17 fev 2017 20:43:18 BRT
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r


import time


def timeit(f):
    def wrapper(*arg, **kw):
        t1 = time.time()
        res = f(*arg, **kw)
        t2 = time.time()
        return (t2 - t1), res, f.__name__
    return wrapper

if __name__ == '__main__':
        timeit()
