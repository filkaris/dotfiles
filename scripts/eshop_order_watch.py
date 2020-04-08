#!/bin/env python

import requests
from bs4 import BeautifulSoup

URL = 'https://www.e-shop.gr/status.phtml?id=2003311246099471162254'
page = requests.get(URL)

soup = BeautifulSoup(page.content, 'html.parser')


available = 0
waiting = 0
items = soup.find_all('td', class_='statusrowok')
for item in items:
    if item.get_text() == "Αμεσα Διαθέσιμο":
        available += 1
    if item.get_text() == "Αναμονή παραλαβής":
        waiting += 1

print("Av={:d},W={:d}".format( available, waiting ))
