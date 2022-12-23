__all__ = ['CourseFeedbackAdmin']

from mainapp.models import CourseFeedback
from mainapp.admin.admin_mixins import DeleteUndeleteMixin

from django.contrib import admin
from django.utils.translation import gettext_lazy as _


@admin.register(CourseFeedback)
class CourseFeedbackAdmin(admin.ModelAdmin, DeleteUndeleteMixin):
    list_display = ("id", "course", "user", "feedback", "rating", "deleted")
    list_editable = ("rating", )
    list_display_links = ("user", "id", )
    readonly_fields = ("created", )
    actions = ("mark_deleted", "un_delete", "time_updated")

    ordering = ('id', )

