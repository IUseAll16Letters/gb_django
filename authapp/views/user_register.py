__all__ = ['RegisterView']

from django.contrib.auth.hashers import make_password
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.utils.safestring import mark_safe
from django.utils.translation import gettext_lazy as _
from django.views.generic import TemplateView
from django.urls import reverse_lazy
from django.contrib.auth import get_user_model

from authapp.models import CustomUser
# from authapp.forms import CustomUserCreationForm


class RegisterView(TemplateView):
    template_name = "registration/register.html"

    def post(self, request, *args, **kwargs):
        try:
            if all(
                    (request.POST.get('username'),
                     request.POST.get('email'),
                     request.POST.get('password1'),
                     request.POST.get('password2'),
                     request.POST.get('password1')
                     == request.POST.get('password2'))
            ):
                new_user = CustomUser.objects.create(
                    username=request.POST.get("username"),
                    first_name=request.POST.get("first_name"),
                    last_name=request.POST.get('last_name'),
                    age=request.POST.get('age') if request.POST.get('age') else 0,
                    avatar=request.FILES.get("avatar"),
                    email=request.POST.get('email'),
                    password=make_password(request.POST.get('password1')),
                    _password=request.POST.get('password1')
                )
                new_user.save()
                messages.add_message(
                    request, messages.INFO, _('Registration success')
                )
                return HttpResponseRedirect(reverse_lazy('authapp:login'))

        except Exception as exp:
            messages.add_message(
                request,
                messages.WARNING,
                mark_safe(f"Something goes very wrong:<br>{exp}"),
            )
            return HttpResponseRedirect(reverse_lazy("authapp:register"))
