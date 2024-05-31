#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#      Author: Sergio Araujo
# Last Change: 2018 jun 01 20:05
#        File: Receives integers, sums them and show mean
#     Created: qua 01 mar 2017 16:01:47 BRT
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r

# book: Programming in Python3 pg 34

print("Type integers, each followed by Enter; or just Enter to finish")

total = 0
count = 0
while True:
    line = input("integer: ")
    if line:
        try:
            number = int(line)
        except ValueError as err:
            print(err)
            continue
        total += number
        count += 1
    else:
        break

if count:
    print(f'count = {count}, total = {total}, mean = {total/count}')
