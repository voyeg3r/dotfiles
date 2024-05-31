#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  sort_csv.py
#         Created:  2018 mai 17 10:55
#     Last Change:  <+type change date+>
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import csv
import operator
import sys

if len(sys.argv) < 2:
    sys.exit('You must provide a value!')

column = int(sys.argv[1])

sample = open('file.csv', 'r')

csv1 = csv.reader(sample, delimiter=',')
# next(csv1, None)
# sort = sorted(csv1, key=operator.itemgetter(column))
sort = sorted(csv1, key=lambda x: int(x[1]))

for eachline in sort:
    print(eachline)

