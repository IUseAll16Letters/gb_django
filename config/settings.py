"""
Django settings for config config.

Generated by 'django-admin startproject' using Django 3.2.16.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.2/ref/settings/
"""
import os
from pathlib import Path
from dotenv import load_dotenv
from django.utils.translation import gettext_lazy as _


# Build paths inside the config like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

load_dotenv()
load_dotenv(BASE_DIR / 'config/.env_social')

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

SECRET_KEY = "django-insecure-m4#o!)_32%$llif6peg++cz(yr_1lr-_!eio14z0_ziajycb29"
NEWS_API_KEY = os.getenv('NEWS_API_KEY')

DEBUG = os.getenv("DJANGO_DEBUG", False)

ALLOWED_HOSTS = ['*']

if DEBUG:
    INTERNAL_IPS = [
        '127.0.0.1',
    ]


INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'social_django',
    'django_extensions',
    'debug_toolbar',  # django-debug-toolbar  | django-redis | sudo apt install redis-server
    'markdownify.apps.MarkdownifyConfig',
    'crispy_forms',
    'django_celery_beat',

    'mainapp',
    'authapp',
]


MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',                    # Localization
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]
MIDDLEWARE += ['debug_toolbar.middleware.DebugToolbarMiddleware', ] if DEBUG else MIDDLEWARE


ROOT_URLCONF = 'config.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            BASE_DIR / "templates",
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.template.context_processors.media',              # context processor for media
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'social_django.context_processors.backends',
                'social_django.context_processors.login_redirect',
            ],
        },
    },
]

WSGI_APPLICATION = 'config.wsgi.application'


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.getenv("POSTGRES_DB"),
        'USER': os.getenv("POSTGRES_USER"),
        'PASSWORD': os.getenv("POSTGRES_PASSWORD"),
        'HOST': 'localhost',                                        # 172.20.0.10
        'PORT': '5432',
    },
}

AUTH_USER_MODEL = 'authapp.CustomUser'

AUTHENTICATION_BACKENDS = [
    'social_core.backends.github.GithubOAuth2',
    'social_core.backends.vk.VKOAuth2',
    'social_core.backends.vk.VKAppOAuth2',
    'django.contrib.auth.backends.ModelBackend',
]

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
 ]

CSRF_COOKIE_SECURE = False

# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'
LANGUAGES = (
    ('en-us', _('English')),
    ('ru', _('Russian')),
)

DEFAULT_CHARSET = 'utf-8'
TIME_ZONE = 'Europe/Moscow'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = 'static/'

STATICFILES_DIRS = [
    BASE_DIR / 'static',
]

MEDIA_URL = "media/"
MEDIA_ROOT = BASE_DIR / "media"

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'

# My Custom settings and keys

LOGIN_REDIRECT_URL = 'mainapp:index'
LOGOUT_REDIRECT_URL = 'mainapp:index'

# SOCIAL_AUTH_LOGIN_ERROR_URL = 'mainapp:index'

SOCIAL_AUTH_GITHUB_KEY = os.getenv("SOCIAL_AUTH_GITHUB_KEY")
SOCIAL_AUTH_GITHUB_SECRET = os.getenv("SOCIAL_AUTH_GITHUB_SECRET")

SOCIAL_AUTH_VK_OAUTH2_KEY = os.getenv("SOCIAL_AUTH_VK_OAUTH2_KEY")
SOCIAL_AUTH_VK_OAUTH2_SECRET = os.getenv("SOCIAL_AUTH_VK_OAUTH2_SECRET")
SOCIAL_AUTH_VK_OAUTH2_API_VERSION = os.getenv("SOCIAL_AUTH_VK_OAUTH2_API_VERSION")

CRISPY_TEMPLATE_PACK = "bootstrap4"  # form style pack

LOG_FILE = BASE_DIR / "var" / "log" / "main_log.log"

# TODO: change loggign type for celery calls
LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "console": {
            "format": "[%(asctime)s] | %(levelname)s | %(name)s | (%(lineno)d) | %(message)s"
        },
    },
    "handlers": {
        "file": {
            "level": "INFO",
            "class": "logging.FileHandler",
            "filename": LOG_FILE,
            "formatter": "console",
        },
        "console": {"class": "logging.StreamHandler", "formatter": "console"},
    },
    "loggers": {
        "django": {"level": "INFO", "handlers": ["file", "console"]},
        "mainapp": {"level": "DEBUG", "handlers": ["file"]},
    },
}

CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://127.0.0.1:6379",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        },
    }
}


# Redis as message broker
# CELERY_BROKER_URL = "redis://127.0.0.1:6379"
# CELERY_RESULT_BACKEND = "redis://127.0.0.1:6379"

# RabbitMq as message broker
CELERY_BROKER_URL = f'amqp://{os.getenv("RABBITMQ_DEFAULT_USER")}:{os.getenv("RABBITMQ_DEFAULT_PASS")}@localhost:5672'

CELERY_BEAT_SCHEDULER = 'django_celery_beat.schedulers:DatabaseScheduler'

EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
# EMAIL_FILE_PATH = "var/email-messages/"

# currently using yandex as smtp service
EMAIL_HOST = os.getenv('EMAIL_HOST')
EMAIL_PORT = os.getenv('EMAIL_PORT')
EMAIL_HOST_USER = os.getenv('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = os.getenv('EMAIL_HOST_PASSWORD')
EMAIL_USE_TLS = False
EMAIL_USE_SSL = True
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER
SERVER_EMAIL = EMAIL_HOST_USER

LOCALE_PATHS = [BASE_DIR / "locale"]
