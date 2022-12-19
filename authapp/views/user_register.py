__all__ = ['RegisterView']

from authapp.forms import CustomUserCreationForm
from django.views.generic import CreateView
from django.urls import reverse_lazy
from django.contrib.auth import get_user_model


class RegisterView(CreateView):
    model = get_user_model()
    form_class = CustomUserCreationForm
    success_url = reverse_lazy("mainapp:index")
