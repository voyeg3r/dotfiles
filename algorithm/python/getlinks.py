#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# File:         <+Filename Here+>
# Author:       Sergio Araujo
# Last Change:  jun 14 2018 10:35
# Created:      seg 09 out 2017 18:22:11 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

# References: https://stackoverflow.com/a/25564921/2571881

from bs4 import BeautifulSoup
import requests
import sys


if len(sys.argv) > 1:
    url = sys.argv[1]
else:
    # video = pafy.new('video id or video url')
    url = input("Digite o link da página: ")


headers = {'User-Agent': 'Mozilla/5.0'}

# Use requests to get the contents
r = requests.get(url, headers=headers)

# Get the text of the contents
html_content = r.text

# Convert the html content into a beautiful soup object
soup = BeautifulSoup(html_content, 'html.parser')

with open("links.txt", "w") as f:
    for tag in soup.find_all('a', {'class': 'season-episode-title'}):
       var = str(tag) + '\n'
       f.write(var)
