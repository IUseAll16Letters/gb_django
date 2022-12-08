__all__ = ['News']

from django.db import models


class News(models.Model):
    title = models.CharField(max_length=255, verbose_name='Title')
    preview = models.CharField(max_length=500, verbose_name='Preview')
    content = models.TextField(blank=True, null=True, verbose_name='Content')
    content_as_md = models.BooleanField(default=False, verbose_name='As markdown')

    created = models.DateTimeField(auto_now_add=True, verbose_name='Created', editable=False)
    updated = models.DateTimeField(auto_now=True, verbose_name='Edited', editable=False)
    deleted = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f'{self.pk} {self.title[:15]}... del:{self.deleted}'

    def delete(self, *args):
        self.deleted = True
        self.save()
