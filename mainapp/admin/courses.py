__all__ = ["CoursesAdmin"]

from django.contrib import admin
from mainapp.models import Courses


@admin.register(Courses)
class CoursesAdmin(admin.ModelAdmin):
    pass