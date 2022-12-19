from django.contrib import admin

from mainapp.models import News
from mainapp.admin.admin_mixins import DeleteUndeleteMixin


@admin.register(News)
class NewsAdmin(admin.ModelAdmin, DeleteUndeleteMixin):
    list_display = ("id", "title", "author", "url", "source")
    list_display_links = ("id", )
    ordering = ("-created", "author")

    search_fields = ("title", "content", "author", "source")
