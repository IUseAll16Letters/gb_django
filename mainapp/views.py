from django.shortcuts import render, redirect
from django.urls import reverse_lazy
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

    def get_context_data(self, page=1, **kwargs):
        context = super().get_context_data(**kwargs)

        ## TODO MOVE PAGINATION LOGICS TO PAGINATOR CLASS IF POSSIBLE
        all_news = get_news()
        pages_total = len(all_news) // 5

        page = pages_total if page > pages_total else page

        next_page, prev_page = None, None

        if page - 1 > 0:
            start_range = page - 1
            prev_page = page - 1
        else:
            start_range = page

        if page + 1 < pages_total:
            end_range = page + 2
            next_page = page + 1
        else:
            end_range = pages_total

        all_news = all_news[page * 5 - 5: page * 5]

        context.update({
            "news": all_news,
            "total_range": range(start_range, end_range),
            "page": page,
            "next": next_page,
            "prev": prev_page,
        })

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
