import os
import logging
import smtplib

from random import randrange
from typing import Dict, Union
from celery import shared_task
from config import settings

from django.contrib.auth import get_user_model
from django.core.mail import send_mail


logger = logging.getLogger(__name__)


@shared_task
def send_feedback_mail(message_form: Dict[str, Union[int, str]]) -> None:
    logger.info(f"Send message: '{message_form}'")
    model_user = get_user_model()
    user_obj = model_user.objects.get(pk=message_form["user_id"])
    try:
        send_mail(
            "TechSupport Help",               # title
            message_form["message"],          # body
            os.getenv("EMAIL_HOST_USER"),     # from
            [settings.DEFAULT_FROM_EMAIL, ],  # to: ch1ck3n@mail.ru
            fail_silently=False,
        )
    except smtplib.SMTPSenderRefused as msg:
        logger.error(f'Failed to send email to: {user_obj.email} with error {msg}')

    return None


@shared_task
def i_pee_freely(*args, **kwargs) -> int:
    a, b = randrange(1, 100), randrange(1, 100)
    print(f'I.P.Freely! {a = } {b = } {args = } {kwargs = }')
    return a + b

