#!/bin/python
# vim:ft=python:nolist:
# tags: [chatgpt, ai, python]

# This script was created by chatgpt an aims to scrap all urls
# from a given link/url

from bs4 import BeautifulSoup
import requests

# url = 'https://example.com/'
url = input("Give me a url to scrap all links: ")

# Fetch the webpage content using Requests
res = requests.get(url)

# Create a BeautifulSoup object
soup = BeautifulSoup(res.text, 'html.parser')

# Find all the links in the webpage
links = []
for link in soup.find_all('a'):
    href = link.get('href')
    if href:
        links.append(href)

# Print all the links, one per line
for link in links:
    print(link)


