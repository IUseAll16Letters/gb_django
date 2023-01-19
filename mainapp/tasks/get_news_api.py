__all__ = ('get_news', 'save_news_to_db')

import os, re
import json
import django
import datetime
import requests

from pathlib import WindowsPath
from config.settings import NEWS_API_KEY, BASE_DIR, DEFAULT_CHARSET

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')
django.setup()

from mainapp.models import *

# TODO solve this puzzle
from mainapp.utils.deprecated import deprecated_function


JSON_NEWS_LOCATION = BASE_DIR / 'cache'   # Deprecated


@deprecated_function
def make_news_json_from_api(news_as_dict: dict, news_file: WindowsPath = None) -> None:
    if news_file is not None:
        news_file.unlink()

    current_time = datetime.datetime.now().strftime('%y_%m_%d_%H_%M_%S')

    with open(JSON_NEWS_LOCATION / f'cached_news_{current_time}.json', 'w', encoding=DEFAULT_CHARSET) as f:
        dump = json.dumps(news_as_dict, indent=4, ensure_ascii=False)
        f.write(dump)


# sort_by = popularity, publishedAt
def get_news_from_api(amount: int, sort_by: str = 'publishedAt') -> dict:
    request_url = f'https://newsapi.org/v2/everything?q=Python+Programming&' \
                  f'sortBy={sort_by}&' \
                  f'pageSize={amount}&page=1&' \
                  f'language=en&language=ru&' \
                  f'apiKey={NEWS_API_KEY}'

    response = requests.get(request_url)
    if response.status_code == 200:
        return response.json().get('articles')
    else:
        raise ValueError


@deprecated_function
def get_news_from_json(filename: str) -> dict:
    with open(filename, 'r', encoding=DEFAULT_CHARSET) as f:
        return json.load(f)


@deprecated_function
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
    news = get_news_from_api()
    make_news_json_from_api(news, news_file)
    news = news.get('articles')

    return news


def save_news_to_db(amount: int) -> int:
    news_from_request = get_news_from_api(amount)
    news_from_db = tuple(i.get("title") for i in News.objects.values('title'))

    created_news = News.objects.bulk_create(
        [
            News(
                title=news_object.get('title') or 'No title',
                description=news_object.get('description') or 'No description',
                author=news_object.get('author') or 'Unknown author',
                content=news_object.get('content') or 'No content',
                url=news_object.get('url') or 'No url provided',
                source=news_object.get('source').get("name") or 'Unknown source',
                image_url=news_object.get('urlToImage') or 'not_found.svg',
                created=news_object.get('publishedAt') or datetime.datetime.now(),
            )
            for news_object in news_from_request
            if news_object.get("title") is not None and news_object.get("title") not in news_from_db
        ]
    )
    return len(created_news)


if __name__ == '__main__':
    print(save_news_to_db(10))
