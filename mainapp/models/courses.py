__all__ = ['Courses']

from django.db import models
from django.utils.translation import gettext_lazy as _


class Courses(models.Model):
    name = models.CharField(max_length=255, verbose_name='Name')
    description = models.TextField(verbose_name='Description', null=True, blank=True)
    description_as_md = models.BooleanField(verbose_name='As markdown', default=False)

    cost = models.DecimalField(max_digits=8, decimal_places=2, verbose_name='Cost', default=0)

    image = models.CharField(max_length=25, default='no_image.svg', verbose_name='Image')

    created = models.DateTimeField(auto_now_add=True, verbose_name='Created', editable=False)
    updated = models.DateTimeField(auto_now=True, verbose_name='Edited', editable=False)
    deleted = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f'{self.pk} {self.name} del:{self.deleted}'

    def delete(self, *args):
        self.deleted = True
        self.save()

    class Meta:
        verbose_name = _("Course")
        verbose_name_plural = _("Courses")
        ordering = ("-created", )
