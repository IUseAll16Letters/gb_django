import os
import datetime

from .settings import *

DEBUG = False

SECRET_KEY = os.getenv('DJANGO_SECRET_KEY')

DATABASES["default"]["HOST"] = "172.20.0.10"

del STATICFILES_DIRS
STATIC_ROOT = BASE_DIR / "static"
