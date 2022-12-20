__all__ = ['NewsDetailView']

from django.views.generic import DetailView

from mainapp.models import News


class NewsDetailView(DetailView):
    model = News
    template_name = "mainapp/news/news_detail.html"

    def get_context_data(self, **kwargs):
        c = super().get_context_data(**kwargs)
        return c