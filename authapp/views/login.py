__all__ = ['CustomLoginView']

from django.contrib import messages
from django.contrib.auth.views import LoginView

from django.utils.safestring import mark_safe               # was ist das?
from django.utils.translation import gettext_lazy as _      # translation


class CustomLoginView(LoginView):

    def form_valid(self, form):
        print('\n>>>>')
        print(form.__class__)
        print(dir(form))
        print(f'{form.declared_fields = }')
        print(f'{form.fields = }')
        print(f'{form.files = }')
        print(f'{form.get_user() = }')
        print(f'{form.hidden_fields() = }')
        print(f'{form.is_valid() = }')
        print(f'{form.request = }')
        print(f'{form.username_field = }')
        print(f'{form.visible_fields = }')
        print('\n<<<<<')
        ret = super().form_valid(form)
        username = self.request.user.get_full_name() \
            if self.request.user.get_full_name() \
            else self.request.user.get_username()
        message = _(f"Login success!<br>Hi, %{username}")
        messages.add_message(self.request, messages.INFO, mark_safe(message))
        return ret

    def form_invalid(self, form):
        print(dir(form))
        print(f'{form.data = }')
        print(f'{form.declared_fields = }')
        print(f'{form.fields = }')
        print(f'{form.get_user() = }')

        print(form.error_messages)
        print(f'{form.username_field = }')
        for _unused, msg in form.error_messages.items():
            print(msg)
            messages.add_message(
                self.request,
                messages.WARNING,
                mark_safe(f"Something goes very wrong:<br>{msg}"),
            )
        return self.render_to_response(self.get_context_data(form=form))
