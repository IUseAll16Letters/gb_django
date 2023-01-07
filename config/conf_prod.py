import os

from .settings import *

DEBUG = False

del STATICFILES_DIRS
STATIC_ROOT = BASE_DIR / "static"
