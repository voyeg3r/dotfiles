#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  oddeven.py
#   Creation Date:  ter 13 mar 2018 10:06:28 -03
#     Last Change:  ter 13 mar 2018 10:06:35 -03
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

# source:
# https://www.reddit.com/r/vim/comments/59yabt/select_odd_or_even_lines_for_future_copy/

import sys

def main():
    filename = sys.argv[1]
    with open(filename) as f:
        lines = f.readlines()

    with open('odd.txt', 'w') as f:
        for l in lines[0::2]:
            f.write(l)

    with open('even.txt', 'w') as f:
        for l in lines[1::2]:
            f.write(l)

if __name__ == '__main__':
    main()


