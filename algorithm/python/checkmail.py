#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: checkmail.py
#      Author: Sergio Araujo
#     Purpose: validate e-mail
# Last Change: jul 04, 2020 - 07:29
#     Created: sáb 04 jul 2020 07:18:01 -03
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#     webpage: https://dev.to/voyeg3r

import re

regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'

def check(mail):
    if(re.search(regex,email)):
        print("Valid Email")
    else:
        print("Invalid Email")

if __name__ == '__main__':
    email = input("Enter Email Address: ")
    check(email)


