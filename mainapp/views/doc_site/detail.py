__all__ = ['DocPageView']

from django.views.generic import TemplateView


class DocPageView(TemplateView):
    template_name = 'mainapp/doc_site.html'