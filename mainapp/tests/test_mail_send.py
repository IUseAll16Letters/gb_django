__all__ = ('TestTaskMailSend', )

from django.test import TestCase
from django.core import mail

from authapp.models import CustomUser
from mainapp.tasks import send_feedback_mail


class TestTaskMailSend(TestCase):
    fixtures = (
        'authapp/fixtures/001_admin_user.json',
    )

    def test_mail_is_sent(self):
        # Note! This is a default replacement for tests
        # ->> settings.EMAIL_BACKEND = 'django.core.mail.backends.locmem.EmailBackend' <<-
        message = 'This is test message'
        user_obj = CustomUser.objects.first()
        send_feedback_mail(message_form={"user_id": user_obj.id, "message": message})
        self.assertEqual(mail.outbox[0].body, message)
