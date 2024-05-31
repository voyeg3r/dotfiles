#!/usr/bin/python
# recursively rename all files and directories in a given folder to lowercase

#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
#        File:  <+Filename Here+>
#      Author:  Sergio Araujo
#     Purpose:  lowercase recursivelly
# Last Change:  sex 01 jun 2018 20:06:41 -03
#     Created:  sex 01 jun 2018 20:06:41 -03
#       email:  <voyeg3r ✉ gmail.com>
#      Github:  https://github.com/voyeg3r
#     twitter:  @voyeg3r

import sys, os, itertools

if len(sys.argv) < 2:
    print(sys.stderr, "usage: lower PATH")
    sys.exit(2)
if not os.path.isdir(sys.argv[1]):
    print(sys.stderr, sys.argv[1], "not a directory")
    sys.exit(1)

for root, dirs, files in os.walk(sys.argv[1]):
    for path in itertools.chain(files, dirs):
        old, new = os.path.join(root, path), os.path.join(root, path.lower())
        if not os.path.exists(new):
            os.rename(old, new)

