#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    01-03-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  Programming in Python pg 35
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------


print("Type integers, each followed by Enter; or ^D or ^Z to finish")

total = 0
count = 0
while True:
    try:
        line = input()
        if line:
            number = int(line)
            total += number
            count += 1
    except ValueError as err:
        print(err)
        continue
    except EOFError:
        break

if count:
    print("count = ", count, "total = ", total, "mean = ", total / count)
