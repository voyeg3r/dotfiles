#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# Author:       Sergio Araujo
# Last Change:  2018 mai 24 17:30
# Created:      ter 07 fev 2017 12:09:46 BRT
# Purpose:      This script show how to get cmd argument in python
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r
# source:       http://stackoverflow.com/a/8280309/2571881

import sys

with open(sys.argv[1], 'r') as f:
    print(f.read())
