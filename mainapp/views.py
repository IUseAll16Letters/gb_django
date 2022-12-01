from django.shortcuts import render
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

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update(
            {
                "news_objects": [{'title': f'title for news {i}',
                                  'content': f'news number {i} content, that describe it',
                                  'date': f'22-12-22-00:00:0{i}',
                                  'id': f'{i}'} for i in range(1, 8)]
             }
        )
        context.update({"news": get_news()})

        return context


class CoursesPageView(TemplateView):
    template_name = 'mainapp/courses_list.html'


class ContactsPageView(TemplateView):
    template_name = 'mainapp/contacts.html'


class LoginPageView(TemplateView):
    template_name = 'mainapp/login.html'


class DocPageView(TemplateView):
    template_name = 'mainapp/doc_site.html'


