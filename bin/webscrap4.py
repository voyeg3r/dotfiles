#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    21-04-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  <+File Name+>
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
#       Reference:  http://stackoverflow.com/a/27652558/2571881
# ------------------------------------------------

from bs4 import BeautifulSoup
import requests
import re


print("Digite o endereço da página que deseja pegar os links: ")
url = input()

if not url:
    url = 'http://www.mairovergara.com/como-se-diz-foi-por-pouco-em-ingles/'


# changing user-agent
headers = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}

page = requests.get(url, headers=headers)
soup = BeautifulSoup(page.content, 'html.parser')

print('-' * 50)

# print all page links
# for link in soup.find_all("a"):
#     print(link.get("href"))

for strong_tag in soup.find_all('strong'):
    print(strong_tag.text, strong_tag.next_sibling)
