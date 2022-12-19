__all__ = ['News']

from django.db import models
from django.utils.translation import gettext_lazy as _


class News(models.Model):
    title = models.CharField(max_length=255, verbose_name='Title')
    description = models.CharField(max_length=150, verbose_name='Preview', null=True)
    author = models.CharField(max_length=50, verbose_name='Author', default='Unknown author')
    content = models.TextField(blank=True, null=True, verbose_name='Content')
    content_as_md = models.BooleanField(default=False, verbose_name='As markdown')
    url = models.CharField(max_length=255, verbose_name='Source', default='no_url')
    source = models.CharField(max_length=55, verbose_name='Source name', default='unknown_source')

    image_url = models.CharField(max_length=150, null=True, default='no_image.svg', verbose_name='Image')

    created = models.DateTimeField(auto_now_add=True, verbose_name='Created', editable=False)
    updated = models.DateTimeField(auto_now=True, verbose_name='Edited', editable=False)
    deleted = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f'{self.title[:25]}...'

    def delete(self, *args):
        self.deleted = True
        self.save()

    class Meta:
        verbose_name = _("News")
        verbose_name_plural = _("News")
        ordering = ('-created', )
