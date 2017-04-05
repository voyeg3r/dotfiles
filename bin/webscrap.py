#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    05-04-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  webscrap.py
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
#       Reference:  https://www.crummy.com/software/BeautifulSoup/bs4/doc/
# ------------------------------------------------


from bs4 import BeautifulSoup
import requests

'''
Here are some simple ways to navigate that data structure:

soup.title
# <title>The Dormouse's story</title>

soup.title.name
# u'title'

soup.title.string
# u'The Dormouse's story'

soup.title.parent.name
# u'head'

soup.p
# <p class="title"><b>The Dormouse's story</b></p>

soup.p['class']
# u'title'

soup.a
# <a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>

soup.find_all('a')
# [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
#  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
#  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]

soup.find(id="link3")
# <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>
'''


html_doc = """
<html><head><title>The Dormouse's story</title></head>
<body>
<p class="title"><b>The Dormouse's story</b></p>

<p class="story">Once upon a time there were three little sisters; and their names were
<a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
<a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
<a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
and they lived at the bottom of a well.</p>

<p class="story">...</p>
"""

soup = BeautifulSoup(html_doc, 'html.parser')

# print(soup.prettify())

print("-" * 30)
print('Printing all links...')
print("-" * 30)
print()
for link in soup.find_all('a'):
    print(link.get('href'))

print()

print("-" * 30)
print('Another common task is extracting all the text from a page:')
print("-" * 30)

print(soup.get_text())
