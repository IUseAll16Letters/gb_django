from django.contrib import admin

from mainapp.models import News
from mainapp.admin.admin_mixins import DeleteUndeleteMixin


class CourseNameTextFilter(admin.SimpleListFilter):
    parameter_name = 'title'
    title = "News title"
    template = 'admin/textinput_filter.html'

    def lookups(self, request, model_admin):
        return ((), )

    def choices(self, changelist):
        all_choice = next(super().choices(changelist))
        all_choice['query_parts'] = (
            (k, v)
            for k, v in changelist.get_filters_params().items()
            if k != self.parameter_name
        )
        yield all_choice

    def queryset(self, request, queryset):
        if self.value() is not None:
            title = self.value()
            return queryset.filter(title__contains=title)
        return queryset


@admin.register(News)
class NewsAdmin(admin.ModelAdmin, DeleteUndeleteMixin):
    list_display = ("id", "title", "author", "url", "source")
    list_display_links = ("id", )
    list_filter = (CourseNameTextFilter, "author")
    ordering = ("-created", "author")

    search_fields = ("title", "content", "author", "source")
