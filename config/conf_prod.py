import os

from .settings import *

DEBUG = False

SECRET_KEY = os.getenv("DJANGO_SECRET_KEY")

del STATICFILES_DIRS
STATIC_ROOT = BASE_DIR / "static"
