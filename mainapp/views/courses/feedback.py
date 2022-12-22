__all__ = ['CourseFeedbackProcessFormView']

from django.http import JsonResponse
from django.template.loader import render_to_string
from django.views.generic import CreateView
from django.contrib.auth.mixins import LoginRequiredMixin

from mainapp.models import CourseFeedback
from mainapp.forms import CourseFeedbackForm


class CourseFeedbackProcessFormView(LoginRequiredMixin, CreateView):
    model = CourseFeedback
    form_class = CourseFeedbackForm

    def form_valid(self, form):
        self.object = form.save()
        rendered_card = render_to_string(
            "mainapp/courses/includes/feedback_card.html", context={"item": self.object}
        )
        print(f'{rendered_card = }')
        return JsonResponse({"card": rendered_card})
