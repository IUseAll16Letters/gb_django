import os
import datetime

from .settings import *

DEBUG = False

SECRET_KEY = os.getenv('DJANGO_SECRET_KEY')
with open('c.txt', 'a') as f:
    f.write(str(datetime.datetime.now()) + '\n' + SECRET_KEY + '\n')
    f.write('>>>' + str(datetime.datetime.now()) + '\n' + DATABASES['default']['NAME'] + '\n')

del STATICFILES_DIRS
STATIC_ROOT = BASE_DIR / "static"
