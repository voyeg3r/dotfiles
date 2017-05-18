#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    21-04-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  <+File Name+>
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
#      References:  http://stackoverflow.com/a/27652558/2571881
#                   http://stackoverflow.com/a/25564921/2571881
#                   http://stackoverflow.com/a/16149666/2571881
# ------------------------------------------------

from bs4 import BeautifulSoup
import requests
import re
import wget
import os
from urllib.parse import unquote

def cleanup(url):
    try:
        return unquote(url, errors='strict')
    except UnicodeDecodeError:
        return unquote(url, encoding='utf-8')


print("Digite o endereço da página que deseja pegar os links: ")
url = input()

if not url:
    url = 'http://www.mairovergara.com/como-se-diz-foi-por-pouco-em-ingles/'


# changing user-agent
headers = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}

page = requests.get(url, headers=headers)
soup = BeautifulSoup(page.content, 'html.parser')


# print all page links
#print('All links')
#for link in soup.find_all("a"):
#    print(link.get("href"))

#print('All links')
#for a in soup.findAll('a',href=re.compile('http.*\.mp3')):
#    print ("URL:", a['href'])

# You can build a list using a list-comprehension instead:
# links = [a['href'] for a in soup.find_all('a',href=re.compile('http.*\.mp3'))]


# audios = []
# for link in soup.find_all('a'):
#     if 'mp3' in link['href']:
#         file_link = link.get('href')
#         file_name = link.contents[0]
#         file_name = cleanup(file_name)
#         #file_name = file_name.replace(" ", "-") + 'mp3'
#         #if not '.' in file_name:
#         #    file_name = file_name.replace("mp3", ".mp3")
#         #print(f'Audio: {file_name} Link: {file_link}')
#         #wget.download(file_link, out=file_name)
#         audios.append(file_name)
# 
# for audio in audios:
#     wget.download(audio)
# 
# print()
# audios.reverse()

for strong_tag in soup.find_all('strong'):
    #audio = audios.pop()
    #audio = os.path.basename(audio)
    print(strong_tag.text, strong_tag.next_sibling.text)


