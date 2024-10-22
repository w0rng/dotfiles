#!/Users/w0rng/Projects/w0rng/dotfiles/.venv/bin/python

# @raycast.schemaVersion 1
# @raycast.title sm sity
# @raycast.mode inline
# @raycast.refreshTime 1h
# @raycast.icon 🏠


import requests
from parsel import Selector

response = requests.get('https://www.sm-city.ru/catalog/yuzhnyy_bereg/genplan/')
selector = Selector(text=response.text)
count_free = selector.xpath('//*[@id="tspan11451-37-0-6-6"]/text()').get().split(' ')[0]

response = requests.get(
    'https://www.sm-city.ru/catalog/yuzhnyy_bereg/?proj=%D0%AE%D0%B6%D0%BD%D1%8B%D0%B9%20%D0%B1%D0%B5%D1%80%D0%B5%D0%B3&arrFilter_570=4162844291&arrFilter_524_1898143542=Y&undefined=16&arrFilter_659_MIN=62.00&arrFilter_659_MAX=123.00&price-min=8%20600%20000&price-max=21%20400%20000&SHOW_BRON=Y&set_filter=y&show_by=15',
)
selector = Selector(text=response.text)
first_price = int(
    selector.xpath(
        '/html/body/div[3]/main/div[2]/div[2]/div/div[2]/div[1]/div/div[2]/div/a[1]/child::node()[last()]',
    )
    .get()
    .replace(' ', '')
    .strip()[:-1],
)

response = requests.get(
    'https://www.sm-city.ru/catalog/yuzhnyy_bereg/filter/ploshchad_bez_balkona-from-62.00-to-123.00/address_skleeno-is-%D0%B4%D0%BE%D0%BC%2024/kolichestvo_komnat-is-688c0a12-953d-11e2-be62-4cedde7eddb0/apply/?sort=price&by=desc&show_by=15',
)
selector = Selector(text=response.text)
last_price = int(
    selector.xpath(
        '/html/body/div[3]/main/div[2]/div[2]/div/div[2]/div[1]/div/div[2]/div/a[1]/child::node()[last()]',
    )
    .get()
    .replace(' ', '')
    .strip()[:-1],
)
price = (last_price + first_price) // 2
price = f'{price:_}'.replace('_', ' ')

print(f'Свободных квартир: {count_free} | Средняя стоимость: {price}')
