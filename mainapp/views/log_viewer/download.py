__all__ = ['LogDownloadView']

from django.views import View
from django.conf import settings
from django.http import FileResponse
from django.contrib.auth.mixins import UserPassesTestMixin


class LogDownloadView(UserPassesTestMixin, View):

    def test_func(self):
        return self.request.user.is_superuser

    def get(self, *args, **kwargs):
        return FileResponse(open(settings.LOG_FILE, 'rb'))
