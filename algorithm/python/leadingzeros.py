#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#            File:  leadingzeros.py
#         Created:  2018 mai 22 19:47
#     Last Change:  2018 jun 01 20:06
#          Author:  sergio luiz araujo silva
#            Site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import sys

# echo 5 | python -c "import sys; value = int(sys.stdin.read()); print(f'{value:03}')"
# usando só o método read ele lê uma só linha
# com o método readlines posso fazer algo assim:
#   seq 3 | readlines.py
#   001
#   002
#   003

data = sys.argv[1:] if len(sys.argv) > 1 else sys.stdin.readlines()

size = 3

for item in data:
    output = int(item)
    print(f'{output:0{size}}')


