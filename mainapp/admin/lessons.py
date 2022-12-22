__all__ = ['LessonAdmin']

from datetime import datetime
from django.contrib import admin, messages
from django.utils.translation import gettext_lazy as _

from mainapp.models import Lessons
from mainapp.admin.admin_mixins import DeleteUndeleteMixin


@admin.register(Lessons)
class LessonAdmin(admin.ModelAdmin, DeleteUndeleteMixin):
    list_display = ["id", "get_course_name", "number", "title", "deleted"]
    ordering = ["course__name", "number"]
    list_filter = ["course", "created", "deleted"]
    list_per_page = 8
    actions = ["mark_deleted", "un_delete", "time_updated"]
    search_fields = ["title", "description"]
    readonly_fields = ("created", "updated")

    def get_course_name(self, obj):
        return obj.course.name

    get_course_name.short_description = _("Course")  # Custom field name <fname>.short_description = _gtlzy("Name")

    def time_updated(self, request, queryset):
        print(request.__class__, queryset.__class__)
        count = queryset.update(updated=datetime.now())
        message = _(f"Updated time at: {count}")
        messages.add_message(request, messages.INFO, message)
    #
    # mark_deleted.short_description = _("Mark deleted")
    # un_delete.short_description = _("Remove deletion")