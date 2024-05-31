#!/usr/bin/env python3
#  -*- coding: utf-8 -*-
#         vim: ai ts=4 sts=4 et sw=4
#    Filename: getlinks2.py
#      Author: Sergio Araujo
#     Purpose: get page links
# Last Change: fev 25, 2021 - 17:34
#     Created: qui 25 fev 2021 17:31:10
#       email: <voyeg3r ✉ gmail.com>
#      Github: https://github.com/voyeg3r
#     twitter: @voyeg3r
#     webpage: https://dev.to/voyeg3r
#      source: https://www.goskills.com/Development/Resources/Python-code-examples

import requests
import re
import argparse

parser = argparse.ArgumentParser(
    description="Get list of links from a website"
)

parser.add_argument("url", nargs="?", help="URL", default=None)

arguments = parser.parse_args()

use_arguments = True if arguments.url is not None else False

# Check whether url will be obtained from command line argument
# or from user input
if use_arguments:
    url = arguments.url
else:
    while True:
        url = input("Enter the URL: ")

        if url == "":
            print("Invalid URL")
            continue
        break

html = requests.get(url).text

links = re.findall('"(https?://.*?)"', html)

for link in links:
    print(link)

