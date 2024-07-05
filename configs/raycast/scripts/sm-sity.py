#!/Users/w0rng/Projects/w0rng/dotfiles/.venv/bin/python

# @raycast.schemaVersion 1
# @raycast.title sm sity
# @raycast.mode inline
# @raycast.refreshTime 1h
# @raycast.icon 🤖


import requests
from parsel import Selector

response = requests.get('https://www.sm-city.ru/catalog/yuzhnyy_bereg/genplan/')
selector = Selector(text=response.text)

count_free = selector.xpath('//*[@id="tspan11451-37-0-6-6"]/text()').get().split(' ')[0]

print('Свободных квартир:', count_free)
