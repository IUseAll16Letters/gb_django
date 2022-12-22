__all__ = ['CoursesListView']

from django.views.generic import ListView
from mainapp.models import Courses


class CoursesListView(ListView):
    model = Courses
    paginate_by = 10
    template_name = 'mainapp/courses/courses_list.html'

    def get_queryset(self):
        qs = super().get_queryset().filter(deleted=False)
        print(f'{qs = }')
        return qs

    def get_context_data(self, **kwargs):
        c = super().get_context_data(**kwargs)
        print('>>>>')
        for k, v in c.items():
            print(f'{k}: {v}')
        print('>>>>')
        return c
