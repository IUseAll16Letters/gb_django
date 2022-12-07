__all__ = ['NewsPageView']

from mainapp.utils.get_news_api import get_news
from django.views.generic import TemplateView


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