__all__ = ["CoursesAdmin"]

from django.contrib import admin
from django.db.models import Count, Avg
from mainapp.admin.admin_mixins import DeleteUndeleteMixin

from mainapp.models import Courses, Lessons, CourseFeedback


@admin.register(Courses)
class CoursesAdmin(admin.ModelAdmin, DeleteUndeleteMixin):
    list_display = ["id", "name", "average_rating", "total_lessons", "cost", "description_as_md"]
    list_editable = ["name", "description_as_md", "cost"]
    list_filter = ["name", "created"]
    ordering = ("pk", "-created")
    actions = ("mark_deleted", "un_delete", "time_updated")
    readonly_fields = ("created", "updated")

    _courses_have_lessons_data = None
    _courses_have_rating = None

    def get_courses_data(self):
        request = Lessons.objects.values('course_id').filter(deleted=False).annotate(lessons_total=Count("pk"))
        request: dict = {dataset['course_id']: dataset['lessons_total'] for dataset in request}

        if self._courses_have_lessons_data is None:
            self._courses_have_lessons_data = request
        else:
            self._courses_have_lessons_data.update(request)

    def get_courses_rating(self):
        request = CourseFeedback.objects.values('course_id').filter(deleted=False).annotate(
            average_rating=Avg('rating'))
        request: dict = {dataset['course_id']: round(dataset['average_rating']) for dataset in request}

        if self._courses_have_rating is None:
            self._courses_have_rating = request
        else:
            self._courses_have_rating.update(request)

    # Рандомно выбраный метод вызывается при заходе в админку, для вызова сборщика уроков
    def get_paginator(self, request, queryset, per_page, orphans=0, allow_empty_first_page=True):
        self.get_courses_data()
        self.get_courses_rating()
        return super().get_paginator(request=request, queryset=queryset,
                                     per_page=per_page, orphans=orphans, allow_empty_first_page=True
                                     )

    def total_lessons(self, obj):
        lessons = self._courses_have_lessons_data.get(obj.pk, 0)
        return lessons

    def average_rating(self, obj):
        rating = self._courses_have_rating.get(obj.pk, 0)
        return rating
