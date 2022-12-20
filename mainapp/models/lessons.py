__all__ = ['Lessons']

from django.db import models

from django.utils.translation import gettext_lazy as _


class Lessons(models.Model):
    course = models.ForeignKey('mainapp.Courses', on_delete=models.CASCADE)
    number = models.PositiveIntegerField(verbose_name='Lesson number')
    title = models.CharField(max_length=150, verbose_name='Name')
    description = models.TextField(verbose_name='Description', null=True, blank=True)

    description_as_md = models.BooleanField(verbose_name='As markdown', default=False)

    created = models.DateTimeField(auto_now_add=True, verbose_name='Created', editable=False)
    updated = models.DateTimeField(auto_now=True, verbose_name='Edited', editable=False)
    deleted = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f'{self.pk} {self.title}'

    def delete(self, *args):
        self.deleted = True
        self.save()

    class Meta:
        verbose_name = _("Lesson")
        verbose_name_plural = _("Lessons")
        ordering = ("course", )
