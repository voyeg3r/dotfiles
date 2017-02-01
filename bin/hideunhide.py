#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"


def hide(msg):
    s = ''
    for c in msg:
        s += chr(ord(c) + 30000)
    return s


def show(msg):
    s = ''
    for c in msg:
        s += chr(ord(c) - 30000)
    return s
