<p id="high-upon-high"></p>
<br/>
<div>
    <a href="#">
        <img src="readme_front/heading.JPG">
    </a>
    <h3 align="center">Django project for geekbrains</h3>
        <p align="center">
            A simple website to practice some django architecture skills on.
        </p>
        <p align="center" >
            <a href="#scheme">Structure scheme</a>
        </p>
    <br>
</div>

# Project overall description
## Purpose
The main purpose of this course is to take more than <a href="https://gb.ru">Geekbrains</a> can offer, and learn a lot of features such as celery, celery cron, django-rest (by 23.01.23 still not implemented, well done, Pavel) and many more tasty stuff.
This exact project (including huge part of the frontend) was provided by  learning platform as a part of a Pythoing developer course.
You can also find my async client-server application in one of my repos: https://github.com/IUseAll16Letters/gb_client_server.
<br>As a result I've deployed a website on one of <a href="https://selectel.ru/">Selectel</a> VDS'es, god bless them for that!
You can check it on: http://185.137.234.221/, if the hosting is still paid.

## Description (logics + routing)
 - mainapp: The main application that handles all the learning platform logics
   - Courses: list_view + details_view. Details page is cached with redis;
   - News: list_view + details_view + few edit views. Celery beat goes for recent news to <a href="https://newsapi.org/">news api API</a>;
   - Contacts: template_view. That carries functionality of sending the email to admin for register users, using Celery;
   - Index: welcome page of the website
 - authapp: Authentication application
   - Login/Logout: default login/logout logics
   - Register/Edit: Default registration and edit page, having permissions_required_mixin logics, nothing special
 - social: Oauth authentication
 - i18n: Translation mechanism, implemented for all main pages

## Technology stack
### Python and its infrastructure (as daemons):
![](https://img.shields.io/badge/python-3.10-blue)![](https://img.shields.io/badge/django-3.2-blue)
![](https://img.shields.io/badge/nginx-1.18-blue)![](https://img.shields.io/badge/gunicorn-20.1-blue)
### Tests:
![](https://img.shields.io/badge/selenium-4.7.2-blue)
### Task managers (as daemons):
![](https://img.shields.io/badge/celery-5.2.7-green)
![](https://img.shields.io/badge/celery_beat-green)
### Docker containers (compose'd):
![](https://img.shields.io/badge/postgres-13.3-blue)
![](https://img.shields.io/badge/pgAdmin-4.5-blue)
![](https://img.shields.io/badge/redis-7.0.5:alpine-red)
![](https://img.shields.io/badge/rabbitMQ-3.10.7-orange)
<div align="center">
    <a id="scheme" href="">
        <img src="readme_front/docker_scheme.drawio.png">
    </a>
</div>


# Getting deployed
### It is important to note that there are many env variables required for this project to work (usually stored at .gunicornenv and others .env files).
1. For postgres and django (shell + gunicorn level), including news api key for <a href="https://newsapi.org/">News api I use</a>:
```shell
$ DJANGO_SECRET_KEY, DJANGO_DEBUG, NEWS_API_KEY, POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWORD
```
And some Ouath stuff (gunicorn level)
```shell
$ SOCIAL_AUTH_GITHUB_KEY, SOCIAL_AUTH_GITHUB_SECRET, SOCIAL_AUTH_VK_OAUTH2_KEY, SOCIAL_AUTH_VK_OAUTH2_SECRET, SOCIAL_AUTH_VK_OAUTH2_API_VERSION
```
2. For PGadmin (shell level):
```shell
$ PGADMIN_DEFAULT_EMAIL, PGADMIN_DEFAULT_PASSWORD, PGADMIN_CONFIG_SERVER_MODE
```
3. For SMTP working correctly (gunicorn level):
```shell
$ EMAIL_HOST, EMAIL_PORT, EMAIL_HOST_USER, EMAIL_HOST_PASSWORD
```
4. For rabbit mq (shell level)
```shell
$ RABBITMQ_SECURE_PASSWORD, RABBITMQ_LOGS, RABBITMQ_DEFAULT_USER, RABBITMQ_DEFAULT_PASS
```

## Now we are trully getting deployd!
1. Clone the repo
    ```shell
   $ git clone git@github.com:IUseAll16Letters/gb_django.git
   ```
2. Install required dependencies
   ```shell
   $ cd gb_django && python3.10 -m venv venv && source venv/bin/activate && pip install -r req.txt && mkdir -p /var/log/
   ```
3. Time to start docker containers!
   ```shell
   $ docker-compose up -d
   ```
4. Apply migrations and load news fixture
   ```shell
   $ python manage.py migrate && python manage.py loaddata ./mainapp/fixtures/001_news.json
   ```
5. Make messages translation .mo file
   ```shell
   $ django-admin compilemessages
   ```
   Install gettext if required
   ```shell
   $ sudo apt install gettext
   ```
6. Time to release all your daemons! <br>
   Copy systemd configuration files ```.service``` and ```.socket``` from ./dev to: ```$ /etc/systemd/system```<br>
   Then install nginx
   ```shell
   $ sudo apt install nginx
   ```
   copy braniaclms to /etc/nginx/sites-available and check if settings are correct
   ```shell
   $sudo nginx -t
   ```
   After that create a soft link for nginx
   ```shell
   $ sudo ln -s /etc/nginx/sites-available/braniaclms /etc/nginx/sites-enabled/braniaclms 
   ```
### Attention
   The configs are used for user named "django" having sudo permissions. Change for your local user in case of necessary

7. Starting daemons
   ```shell
   $ sudo systemctl enable celeryd.service && sudo systemctl start celeryd.service 
   $ sudo systemctl enable celerybeat.service && sudo systemctl start celerybeat.service
   $ sudo systemctl enable gunicorn.socket && sudo systemctl start gunicorn.socket
   $ sudo systemctl enable gunicorn.service && sudo systemctl start gunicorn.service
   ```
8. If you did everything correct - it means that it's time to congratz both of us with the server deployment!

<div align="right">
   <a href="#high-upon-high">High upon high</a>
</div>
