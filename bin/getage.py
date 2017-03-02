#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:  01-03-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  Programming in Python pg 37
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------
"""
One frequent need when writing interactive console applications is to obtain
an integer from the user. Here is a function that does just that:

This function takes one argument, msg . Inside the while loop the user is prompt-
ed to enter an integer. If they enter something invalid a ValueError exception
will be raised, the error message will be printed, and the loop will repeat. Once
a valid integer is entered, it is returned to the caller. Here is how we would
call it:
"""

def get_int(msg):
    while True:
        try:
            i = int(input(msg))
            return i
        except ValueError as err:
            print(err)

age = get_int("Enter your age ")
print("Your age is", age)
