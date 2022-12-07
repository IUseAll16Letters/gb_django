__all__ = ['CoursesListView']

from django.views.generic import TemplateView


class CoursesListView(TemplateView):
    template_name = 'mainapp/courses_list.html'
