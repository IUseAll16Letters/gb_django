from django.shortcuts import render, redirect
from django.views.generic import TemplateView
from mainapp.utils.get_news_api import get_news


class IndexView(TemplateView):
    template_name = 'mainapp/index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({'special_data': "don't tell anyone!"})
        return context


class NewsPageView(TemplateView):
    template_name = "mainapp/news.html"
    page = 0

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({"news": get_news()})
        print(context.get('news'))
        print(f'{self.page = }')
        return context


class CoursesPageView(TemplateView):
    template_name = 'mainapp/courses_list.html'


class ContactsPageView(TemplateView):
    template_name = 'mainapp/contacts.html'


class LoginPageView(TemplateView):
    template_name = 'mainapp/login.html'


class DocPageView(TemplateView):
    template_name = 'mainapp/doc_site.html'


def redirect_page(request, param: str):
    return redirect(to=f'https://google.com/search?q={param}')
