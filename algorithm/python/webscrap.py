#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# File:         <+Filename Here+>
# Author:       Sergio Araujo
# Last Change:  jun 09 2019 18:48
# Created:      seg 09 out 2017 18:22:11 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r

# References: https://stackoverflow.com/a/25564921/2571881

from bs4 import BeautifulSoup
import requests
import re
import sys

if len(sys.argv) > 1:
    url = sys.argv[1]
else:
    # video = pafy.new('video id or video url')
    url = input("Digite o link da página")

headers = {'User-Agent': 'Mozilla/5.0'}

# Use requests to get the contents
r = requests.get(url, headers=headers)

# Get the text of the contents
html_content = r.text

# Convert the html content into a beautiful soup object
soup = BeautifulSoup(html_content, 'html.parser')


# for tag in soup.findAll('em'):
#     print(tag.text, tag.next_sibling.text)

# print(soup.find_all('p'))
#with open("output.csv", "w") as f:
#    for tag in soup.findAll('strong'):
#        var = str(tag) + str(tag.next_sibling)
#        f.write(var)

# import re
# for tag in soup.find_all(re.compile("^b")):
#     print(tag.name)
# body
# b

# comentado para testes
# with open("output.csv", "w") as file:
#     for tag in soup.findAll('p'):
#         file.write(str(tag))
#         file.write("\n\n")

with open("output.csv", "w") as file:
    for tag in soup.select('p em'):
        file.write(str(tag))
        file.write("\n")

# with open("output.csv", "w") as file:
#     for tag in soup.find_all('strong'):
#         value=(str(tag))
#         file.write(value)
#         file.write("\n\n")

with open("audios.txt", "w") as file:
    for a in soup.findAll('a',href=re.compile('http.*\.mp3')):
        file.write(a['href'])
        file.write("\n")

