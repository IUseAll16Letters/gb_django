__all__ = ["CoursesAdmin"]

from django.contrib import admin
from django.db.models import Count, Q, Sum
from mainapp.models import Courses, Lessons


@admin.register(Courses)
class CoursesAdmin(admin.ModelAdmin):
    list_display = ["id", "name", "total_lessons", "description_as_md", "cost"]
    list_editable = ["name", "description_as_md", "cost"]
    list_filter = ["name", "created"]
    ordering = ("pk", "-created")
    readonly_fields = ("created", "updated")

    courses_have_lessons_data = None

    # TODO optimize this trunk
    def get_courses_data(self):
        if self.courses_have_lessons_data is None:
            request = Lessons.objects.values('course_id').annotate(lessons_total=Count("pk"))
            request = {dataset['course_id']: dataset['lessons_total'] for dataset in request}
            self.courses_have_lessons_data = request
        else:
            request = Lessons.objects.values('course_id').annotate(lessons_total=Count("pk"))
            request = {str(dataset['course_id']): dataset['lessons_total'] for dataset in request}
            print(request)
            self.courses_have_lessons_data.update(**request)

    # Метод вызывается при заходе в админку, в нём вызывается сборщик уроков
    def get_paginator(self, request, queryset, per_page, orphans=0, allow_empty_first_page=True):
        self.get_courses_data()
        return super().get_paginator(request=request, queryset=queryset,
                                     per_page=per_page, orphans=orphans, allow_empty_first_page=True
                                     )

    def total_lessons(self, obj):
        return self.courses_have_lessons_data.get(obj.pk)
