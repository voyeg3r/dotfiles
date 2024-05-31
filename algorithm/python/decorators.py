#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: decorators.py
#      Author: Sergio Araujo
#     Purpose: show how decorators work

def my_decorator(func):
    def wrapper():
            print("This happens before")
            func()
            print('This happens after')
    return wrapper

@my_decorator
def say_whee():
        print("Whee!")

say_whee()


