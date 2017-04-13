#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: ai ts=4 sts=4 et sw=4
# File:         getmp3.py
# Author:       Sergio Araujo
# Last Change:  qui 13 abr 2017 16:49:37 -03
# Created:      qui 13 abr 2017 16:49:37 -03
# email:        <voyeg3r ✉ gmail.com>
# Github:       https://github.com/voyeg3r
# twitter:      @voyeg3r
# Reference: http://stackoverflow.com/a/1080427/2571881


from bs4 import BeautifulSoup
import requests

url = 'http://www.talkenglish.com/lessondetails.aspx?ALID=2020'

page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')

for link in soup.find_all('a'):
    if 'mp3' in link['href']:
            print(link.get('href'))
