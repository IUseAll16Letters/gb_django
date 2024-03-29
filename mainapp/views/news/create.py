__all__ = ["NewsCreateView"]

from django import forms

from django.urls import reverse_lazy
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.views.generic import CreateView

from mainapp.models import News


class NewsCreateView(PermissionRequiredMixin, CreateView):
    model = News
    fields = "__all__"
    success_url = reverse_lazy("mainapp:news")
    permission_required = ('mainapp.add_news', )
    template_name = "mainapp/news/news_form.html"

    def get_context_data(self, **kwargs):
        c = super().get_context_data(**kwargs)
        return c

    class Meta:
        widgets = {
            "user": forms.HiddenInput()
        }
