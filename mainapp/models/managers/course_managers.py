__all__ = ['CoursesManager', 'AllCoursesManger']

from django.db import models


class CoursesManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(deleted=False)


class AllCoursesManger(models.Manager):
    def get_queryset(self):
        return super().get_queryset()
