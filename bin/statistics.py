#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  qua 08 mar 2017 11:37:59 -03
# Created:      qua 08 mar 2017 11:37:59 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r


import heapq


grades = [32, 43, 654, 34, 132, 66, 99, 532]

print(heapq.nlargest(3, grades))

stocks = [
    {'ticker': 'AAPL', 'price': 201},
    {'ticker': 'GOOG', 'price': 800},
    {'ticker': 'F', 'price': 54},
    {'ticker': 'MSFT', 'price': 313},
    {'ticker': 'TUNa', 'price': 68},
]

print(heapq.nsmallest(2, stocks, key=lambda stock: stock['price'] ))
