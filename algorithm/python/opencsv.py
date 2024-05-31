#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:  08-02-2017
#     Last Change:  nov 17 2018 08:06
# this script aim:  open csv file
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import csv

# read each row and print it
with open("capitals.csv", 'r') as f:
        r = csv.reader(f, delimiter=',')
        for row in r:
            if len(row == 2):
                print(row[0] + ', ' + row[1])

states = ['Tripura', 'West Bengal']
caps = ['Agartala', 'Kolkata']

# write (append) two more states and capitls to the file
with open('capitls.csv', 'a', newline='') as f:
    w = csv.writer(f, delimiter=',')  # , quoting=csv.QUOTE_ALL
    for i in range(len(states)):
        w.writerow(states[i], caps[i])
