#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    09-02-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  <+this script aims+>
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------


import time

t = time.process_time()

nums = []
for i in range(1,11):
    nums.insert(0,i)

print(list(nums))

elapsed_time = time.process_time() - t

print(f'Elapsed time: {elapsed_time} using tradicional loop')

t = time.process_time()
print([ x for x in range(1,11)[::-1] ])
elapsed_time = time.process_time() - t

print(f'Elapsed time: {elapsed_time} using list comprehensions')
