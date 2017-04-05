
# how to use BeautifulSoup
+ https://www.dataquest.io/blog/web-scraping-tutorial-python/

``` python
from bs4 import BeautifulSoup
import requests

url = input("Digite o link da página: ")

# page = requests.get('https://www.dataquest.io/blog/web-scraping-tutorial-python/')

page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')

# print all page links
for link in soup.find_all("a"):
    print(link.get("href"))
```
