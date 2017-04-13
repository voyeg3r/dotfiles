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
# wget lib: https://pypi.python.org/pypi/wget



from bs4 import BeautifulSoup
import requests
import wget
import string


print("Digite o endereço da página que deseja pegar os links: ")
url = input()

if not url:
    url = 'http://www.talkenglish.com/lessondetails.aspx?ALID=2020'

page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')

print('-' * 50)

# file_list = []

for link in soup.find_all('a'):
    if 'mp3' in link['href']:
        file_link = link.get('href')
        file_name = link.contents[0]
        file_name = file_name.replace(" ", "-") + 'mp3'
        if not '.' in file_name:
            file_name = file_name.replace("mp3", ".mp3")
        #print(f'{file_link} {file_name}')
        print(f'Baixando o arquivo {file_name}')
        wget.download(file_link, out = file_name)



# link attribs and link contents
# print(f'{link.attrs} {link.contents}')

# for link in soup.find_all('a'):
#     if 'mp3' in link['href']:
#             file_list.append(link.get('href'))
#
# print(file_list)

