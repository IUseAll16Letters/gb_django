__all__ = ['NewsListView']

import datetime

from django.contrib import messages
from django.views.generic import ListView
from django.core.cache import cache

from mainapp.models import News


class NewsListView(ListView):
    model = News
    paginate_by = 5
    template_name = "mainapp/news/news_list.html"

    def get_queryset(self):
        date_from = self.request.GET.get('dateFrom')
        date_to = self.request.GET.get('dateTo')

        if date_from or date_to:
            if (date_from and date_to) and (date_to < date_from):
                messages.add_message(
                    self.request,
                    level=messages.WARNING,
                    message='"Date from" should be bigger than "date to". Set to default',
                )
                date_from, date_to = date_to, date_from

            return super().get_queryset().filter(
                created__range=[date_from or datetime.datetime(year=2010, month=1, day=1),
                                date_to or datetime.datetime.now()])

        return super().get_queryset().filter(deleted=False)

    def get_context_data(self, **kwargs):
        c = super().get_context_data(**kwargs)
        return c
