__all__ = ['CourseFeedbackForm']

from django import forms

from mainapp import models as mainapp_m
from mainapp.models import RatingChoices


class CourseFeedbackForm(forms.ModelForm):

    def __init__(self, *args, course=None, user=None, **kwargs):
        ret = super().__init__(*args, **kwargs)
        if ret:
            for i in ret:
                print(i)
        if course and user:
            self.fields["course"].initial = course.pk
            self.fields["user"].initial = user.pk
        return ret

    class Meta:
        model = mainapp_m.CourseFeedback
        fields = ("course", "user", "feedback", "rating")
        widgets = {
            "course": forms.HiddenInput(),
            "user": forms.HiddenInput(),
            "rating": forms.RadioSelect(choices=RatingChoices.choices)
        }
