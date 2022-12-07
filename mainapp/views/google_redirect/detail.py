__all__ = ['redirect_page']

from django.shortcuts import render, redirect


def redirect_page(request, param: str):
    return redirect(to=f'https://google.com/search?q={param}')