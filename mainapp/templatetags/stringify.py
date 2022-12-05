from typing import Any
from django import template


register = template.Library()


@register.filter
def stringify(argument: Any):
    return argument.replace('/', ' ')
