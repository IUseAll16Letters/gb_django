__all__ = ['TeachersCourse']

from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from mainapp.models import TeachersCourse
from mainapp.admin.admin_mixins import DeleteUndeleteMixin


@admin.register(TeachersCourse)
class TeachersCourseAdmin(admin.ModelAdmin, DeleteUndeleteMixin):
    list_display = ["id", "__str__", "get_courses", "deleted"]
    actions = ("mark_deleted", "un_delete",)
    list_select_related = True

    def get_courses(self, obj):
        print(f">>>> \n ")
        print(dir(obj))
        print(f"<<<< \n")
        return ", ".join(i.name for i in obj.course.all())

    get_courses.short_description = _("Courses")
