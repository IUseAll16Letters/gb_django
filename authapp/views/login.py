__all__ = ['CustomLoginView']

from django.contrib import messages
from django.contrib.auth.views import LoginView

from django.utils.safestring import mark_safe               # was ist das?
from django.utils.translation import gettext_lazy as _      # translation


class CustomLoginView(LoginView):

    def get_context_data(self, **kwargs):
        messages.add_message(self.request, messages.INFO, mark_safe(f'test message!'))
        context = super().get_context_data(**kwargs)
        return context

    def form_valid(self, form):
        ret = super().form_valid(form)
        username = self.request.user.get_full_name() \
            if self.request.user.get_full_name() \
            else self.request.user.get_username()
        print(username)
        message = _(f"Login success!<br>Hi, %{username}")
        messages.add_message(self.request, messages.INFO, mark_safe(message))
        return ret

    def form_invalid(self, form):
        for _unused, msg in form.error_messages.items():
            messages.add_message(
                self.request,
                messages.WARNING,
                mark_safe(f"Something goes very wrong:<br>{msg}"),
            )
        return self.render_to_response(self.get_context_data(form=form))