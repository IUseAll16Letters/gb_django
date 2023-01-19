import os

from random import randrange
from celery import Celery
from mainapp.tasks import save_news_to_db

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")

# New app
celery_app = Celery(
    "braniac",
    broker=f'amqp://{os.getenv("RABBITMQ_DEFAULT_USER")}:{os.getenv("RABBITMQ_DEFAULT_PASS")}@localhost/',
)
celery_app.config_from_object("django.conf:settings", namespace="CELERY")
celery_app.autodiscover_tasks()


@celery_app.on_after_configure.connect
def setup_periodic_example(sender, **kwargs):
    sender.add_periodic_task(60.0, randomize_number.s('GUAKAMOLE MUCHACHOS'), name='~~ Heartbeat random number task (60 seconds)')
    sender.add_periodic_task(18000.0, get_news_wrapper.s(), name='+++ Get news and insert db task (5 hours)')


@celery_app.task
def get_news_wrapper():
    print(f'{save_news_to_db(10) = }')


@celery_app.task
def randomize_number(arg):
    print(f'Your lucky number is: {randrange(1, 100)}, and passed arg {arg = }')
