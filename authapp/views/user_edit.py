__all__ = ['ProfileEditView']


from authapp.forms import CustomUserChangeForm
from django.contrib.auth.mixins import UserPassesTestMixin
from django.urls import reverse_lazy
from django.contrib.auth import get_user_model
from django.views.generic import UpdateView


class ProfileEditView(UserPassesTestMixin, UpdateView):
    form_class = CustomUserChangeForm
    model = get_user_model()
    login_url = reverse_lazy('authapp:login')

    def test_func(self):
        return True if self.request.user.pk == self.kwargs.get("pk") else False

    def get_success_url(self):
        return reverse_lazy("authapp:profile_edit", args=[self.request.user.pk])
