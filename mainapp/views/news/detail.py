__all__ = ['NewsDetailView']

from django.core.cache import cache
from django.views.generic import DetailView

from mainapp.models import News


class NewsDetailView(DetailView):
    model = News
    template_name = "mainapp/news/news_detail.html"

    def get_context_data(self, **kwargs):
        cached_news = cache.get(f'news_object_{self.object.pk}')
        if cached_news is None:
            cache.set(f'news_object_{self.object.pk}', self.object)
            cached_news = cache.get(f'news_object_{self.object.pk}')
        context_obj_name = self.get_context_object_name(self.object)
        c = {'object': cached_news, context_obj_name: cached_news, 'view': self}

        # c = super().get_context_data(**kwargs)

        return c
