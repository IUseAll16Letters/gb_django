import os

from random import randrange
from celery import Celery


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")

# New app
celery_app = Celery("braniac")
celery_app.config_from_object("django.conf:settings", namespace="CELERY")
celery_app.autodiscover_tasks()


@celery_app.on_after_configure.connect
def setup_periodic_example(sender, **kwargs):
    sender.add_periodic_task(5.0, randomize_number.s('GUAKAMOLE MUCHACHOS'), name='time every 5')


@celery_app.task
def randomize_number(arg):
    print(f'Your lucky number is: {randrange(1, 100)}, and passed arg{arg = }')
