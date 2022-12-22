from django import template
import re

register = template.Library()


@register.simple_tag
def paginate_correct_page(url: str, required_page):
    if '&page' not in url:
        return url + f'&page={required_page}'

    re_pattern = re.compile(r'&page=\d{1,3}')
    url = re_pattern.sub(f'&page={required_page}', url)
    return url
