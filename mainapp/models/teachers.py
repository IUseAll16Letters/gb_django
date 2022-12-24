__all__ = ['TeachersCourse']

from django.db import models
from django.utils.translation import gettext_lazy as _


class TeachersCourse(models.Model):
    course = models.ManyToManyField('mainapp.Courses')

    name_first = models.CharField(max_length=100, verbose_name='Name')
    name_second = models.CharField(max_length=100, verbose_name='Surname')
    birthday = models.DateField(verbose_name='Birthday')

    deleted = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f'{self.pk:>03} {self.name_first} {self.name_second}'

    def delete(self, *args):
        self.deleted = True
        self.save()

    class Meta:
        verbose_name = _("Teacher")
        verbose_name_plural = _("Teachers")
