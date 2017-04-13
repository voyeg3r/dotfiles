#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    05-04-2017
#     Last Change:  ter 29 nov 2016 09:21:52 BRT
#            File:  <+File Name+>
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------


from bs4 import BeautifulSoup
import requests

print("Digite o endereço da página que deseja pegar os links: ")
url = input()

# page = requests.get('https://www.dataquest.io/blog/web-scraping-tutorial-python/')

page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')

print('-' * 50)

# print all page links
for link in soup.find_all("a"):
    print(link.get("href"))

