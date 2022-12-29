__all__ = ['LogView']

import logging

from django.views.generic import TemplateView
from mainapp.utils import parse_log_file

logger = logging.getLogger(__name__)


class LogView(TemplateView):
    template_name = 'mainapp/log_view.html'

    def get_context_data(self, tail=1, **kwargs):
        if tail not in (1, 0):
            tail = 1
        c = super().get_context_data(**kwargs)
        c.update({"log": parse_log_file(logger, tail=tail).decode()})
        return c
