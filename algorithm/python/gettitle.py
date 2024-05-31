#!/usr/bin/python
# get title frm url

from urllib.request import urlopen
from bs4 import BeautifulSoup
import sys

def get_title_from_url(url):
    # using the BeautifulSoup module
    soup = BeautifulSoup(urlopen(url), 'html.parser')

    # displaying the title
    # print("Title of the website is:")
    print(soup.title.get_text())

if __name__ == "__main__":
    # Check if a URL is provided as a command-line argument
    if len(sys.argv) > 1:
        url = sys.argv[1]
        get_title_from_url(url)
    else:
        # If no URL provided, read from the shell script pipe
        url = sys.stdin.readline().strip()
        get_title_from_url(url)

