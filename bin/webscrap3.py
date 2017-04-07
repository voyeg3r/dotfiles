#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    06-04-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  webscrap3.py
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

# source: https://www.analyticsvidhya.com/blog/2015/10/beginner-guide-web-scraping-beautiful-soup-python/

from urllib.request import urlopen
from bs4 import BeautifulSoup

wiki = "https://en.wikipedia.org/wiki/List_of_state_and_union_territory_capitals_in_India"

page = urlopen(wiki)
soup = BeautifulSoup(page)

# print(soup.beutify())
all_links = soup.find_all('a')

print('-' * 50)
print('Printing all links')

for link in all_links:
    print(link.get('href'))

print('-' * 50)
print()

