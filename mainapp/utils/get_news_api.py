__all__ = ['get_news']

import json
import datetime
import re
import requests

from pathlib import WindowsPath
from config.settings import NEWS_API_KEY, BASE_DIR, DEFAULT_CHARSET


JSON_NEWS_LOCATION = BASE_DIR / 'cache'


def make_news_json_from_api(news_as_dict: dict, news_file: WindowsPath = None) -> None:
    if news_file is not None:
        news_file.unlink()

    current_time = datetime.datetime.now().strftime('%y_%m_%d_%H_%M_%S')

    with open(JSON_NEWS_LOCATION / f'cached_news_{current_time}.json', 'w', encoding=DEFAULT_CHARSET) as f:
        json.dump(news_as_dict, f, indent=4)


def get_news_from_api() -> dict:
    request_url = f'https://newsapi.org/v2/everything?q=Python+Programming&' \
                  f'sortBy=publishedAt&' \
                  f'pageSize=100&page=1&' \
                  f'language=en&language=ru&' \
                  f'apiKey={NEWS_API_KEY}'

    response = requests.get(request_url)
    return response.json()


def get_news_from_json(filename: str) -> dict:
    with open(filename, 'r', encoding=DEFAULT_CHARSET) as f:
        return json.load(f)


def get_news() -> dict:
    news_file = None
    for file in (BASE_DIR / 'cache').iterdir():
        if 'cached_news' in str(file):
            news_file = file

    if news_file is not None:
        news_file_datetime = datetime.datetime\
            .strptime(re.search(r'(\d{2}_){5}\d{2}', str(news_file), re.I).group(), '%y_%m_%d_%H_%M_%S')
        if datetime.datetime.now() - news_file_datetime < datetime.timedelta(hours=1):
            return get_news_from_json(news_file).get('articles')
    print('Getting new news')
    news = get_news_from_api()
    make_news_json_from_api(news, news_file)
    news = news.get('articles')

    return news
