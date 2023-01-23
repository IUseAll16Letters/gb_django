__all__ = ['ContactsPageView']

from django.contrib import messages
from django.core.cache import cache
from django.http import HttpResponseRedirect
from django.views.generic import TemplateView
from django.utils.translation import gettext_lazy as _
from django.urls import reverse_lazy

from mainapp.forms import MailFeedbackForm
from mainapp.tasks import send_feedback_mail


class ContactsPageView(TemplateView):
    template_name = 'mainapp/contacts.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.user.is_authenticated:
            context["form"] = MailFeedbackForm(
                user=self.request.user
            )
        return context

    def post(self, *args, **kwargs):
        if self.request.user.is_authenticated:
            cache_lock_flag = cache.get(
                f"mail_feedback_lock_{self.request.user.pk}"
            )
            if not cache_lock_flag:
                print("SETTING LOCK FLAG!")
                cache.set(
                    f"mail_feedback_lock_{self.request.user.pk}",
                    "lock",
                    timeout=3600,
                )
                messages.add_message(
                    self.request, messages.INFO, _("Message sent")
                )
                send_feedback_mail.delay(
                    {
                        "user_id": self.request.POST.get("user_id"),
                        "message": self.request.POST.get("message"),
                    }
                )
                # send_mail(
                #     "TechSupport Help",  # заголовок
                #     'HELLO FRIEND! FROM DJANGO!',  # тело сообщения
                #     settings.DEFAULT_FROM_EMAIL,  # from
                #     [settings.DEFAULT_FROM_EMAIL, ],  # ch1ck3n@mail.ru
                #     fail_silently=False,
                # )
            else:
                messages.add_message(
                    self.request,
                    messages.WARNING,
                    _("SendMessageTimeout"),
                )
            return HttpResponseRedirect(reverse_lazy("mainapp:contacts"))
        print('USER NOT AUTHED!S')
