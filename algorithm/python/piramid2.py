#!/bin/env python
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: piramid2.py
#      Author: Sergio Araujo
#
# challenge
# print a triangle like this
#      *
#     * *
#    * * *
#   * * * *
#  * * * * *


# n = int(input("How large is your piramid? "))

def piramid(n):
    for i in reversed(range(n)):
        print(f'{i*" "}{(-i+n)*" *"}')

piramid(5)

