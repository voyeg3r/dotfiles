#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  sortcsv.py
#         Created:  2018 mai 17 12:05
#     Last Change:  qui 17 mai 2018 12:05:13 -03
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import csv

with open('file.csv') as sample, open('filesorted.csv', "w") as out:
    csv1=csv.reader(sample)
    header = next(csv1, None)
    csv_writer = csv.writer(out)
    if header:
        csv_writer.writerow(header)
    csv_writer.writerows(sorted(csv1, key=lambda x:int(x[0])))


