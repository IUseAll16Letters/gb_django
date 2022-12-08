__all__ = ['Teachers']

from django.db import models


class Teachers(models.Model):
    course = models.ManyToManyField('mainapp.Courses')
    name_first = models.CharField(max_length=100, verbose_name='Name')
    name_second = models.CharField(max_length=100, verbose_name='Surname')
    birthday = models.DateField(verbose_name='Birthday')
    deleted = models.BooleanField(default=False)

    def __str__(self) -> str:
        return f'{self.pk} {self.name_first} {self.name_second} del:{self.deleted}'

    def delete(self, *args):
        self.deleted = True
        self.save()
