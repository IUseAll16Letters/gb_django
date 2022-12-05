from django import template

register = template.Library()


@register.filter
def rng(minimum=5):
    return range(1, minimum + 1)

