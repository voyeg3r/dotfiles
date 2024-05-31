#!/usr/bin/env python
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: make-uuid.py
#      Author: Sergio Araujo
#     Purpose: generate uuid
# Last Change: ago 27 2018 10:15
#     Created: seg 27 ago 2018 09:58:27 -03
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#
#     you can do this on vim to automating the uuid generation
#     :inoremap <C-M>u <C-r>system('./make-uuid.py')<CR>
#
#     We used sys.stdout.writ to avoid the new line of print function of python

import uuid
import sys
sys.stdout.write(uuid.uuid4().__str__())
