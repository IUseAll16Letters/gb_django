import http
from http import HTTPStatus

from django.test import TestCase, Client
from django.urls import reverse

from mainapp.models import News


class TestMainPage(TestCase):

    def test_page_open_index(self):
        path = reverse('mainapp:index')
        result = self.client.get(path)
        self.assertEqual(result.status_code, HTTPStatus.OK, msg=f'Expected 200, got {result}')

    def test_index_post(self):
        path = reverse('mainapp:index')
        result = self.client.post(path)
        self.assertEqual(result.status_code, HTTPStatus.METHOD_NOT_ALLOWED)


class TestPageNews(TestCase):
    fixtures = (
        'authapp/fixtures/001_admin_user.json',
        'mainapp/fixtures/001_news.json',
    )

    def setUp(self) -> None:
        super().setUp()
        self.use_redis = True
        self.client_with_auth = Client()
        self.client.login()
        login_path = reverse("authapp:login")
        self.client_with_auth.post(
            login_path, data={'username': 'admin@admin.ru', 'password': 'admin'}
        )

    def test_page_open_news(self):
        if not self.use_redis:
            self.assertEqual(True, True, f'Skipping test')
            return 1

        path = reverse('mainapp:news')
        result = self.client.get(path)
        self.assertEqual(result.status_code, HTTPStatus.OK, msg=f'Expected 200, got {result}')

    def test_page_open_news_list(self):
        path = reverse("mainapp:news")
        result = self.client.get(path)
        self.assertEqual(result.status_code, HTTPStatus.OK)

    def test_page_open_news_detail(self):
        news_obj = News.objects.first()
        path = reverse("mainapp:news_detail", args=(news_obj.pk, ))
        result = self.client.get(path)
        self.assertEqual(result.status_code, HTTPStatus.OK)

    def test_page_open_create_news_deny_access(self):
        path = reverse("mainapp:news_create")
        result = self.client.get(path)
        self.assertEqual(result.status_code, HTTPStatus.FOUND)

    def test_page_open_create_news_by_admin(self):
        path = reverse("mainapp:news_create")
        result = self.client_with_auth.get(path)
        self.assertEqual(result.status_code, HTTPStatus.OK)

    def test_create_news_fail(self):
        path = reverse("mainapp:news_create")
        result = self.client.post(
            path, data={"title": "NewTestNews001", "description": "NewTestNews001", "content": "NewTestNews001", },
        )
        self.assertEqual(result.status_code, http.HTTPStatus.FOUND)

    def test_create_in_web(self):
        news_before_creation = News.objects.count()

        path = reverse("mainapp:news_create")
        data = {"title": "NewTestNews001", "description": "NewTestNews001", "content": "NewTestNews001",
                'author': 'Unknown author', 'url': 'no_url', 'source': 'unknown_source', 'image_url': 'not_found.gif',
                }
        result = self.client_with_auth.post(
            path, data=data,
        )
        self.assertEqual(result.status_code, http.HTTPStatus.FOUND)
        self.assertGreater(News.objects.count(), news_before_creation)

    def test_page_open_update_deny_access(self):
        news_obj = News.objects.first()

        path = reverse("mainapp:news_update", args=[news_obj.pk])
        result = self.client.get(path)
        self.assertEqual(result.status_code, HTTPStatus.FOUND)

    def test_page_open_update_by_admin(self):
        news_obj = News.objects.first()

        path = reverse("mainapp:news_update", args=[news_obj.pk])
        result = self.client_with_auth.get(path)
        self.assertEqual(result.status_code, HTTPStatus.OK)

    def test_update_in_web(self):
        new_title = "NewTestTitle001"
        news_obj = News.objects.first()
        self.assertNotEqual(news_obj.title, new_title)
        path = reverse("mainapp:news_update", args=[news_obj.pk])
        result = self.client_with_auth.post(
            path,
            data={
                "title": new_title, "description": news_obj.description, "content": news_obj.content,
                "author": news_obj.author, 'url': news_obj.url, 'source': news_obj.source,
                'image_url': news_obj.image_url,
            },
        )
        self.assertEqual(result.status_code, HTTPStatus.FOUND)
        news_obj.refresh_from_db()
        self.assertEqual(news_obj.title, new_title)

    def test_delete_deny_access(self):
        news_obj = News.objects.first()

        path = reverse("mainapp:news_delete", args=[news_obj.pk])
        result = self.client.post(path)
        self.assertEqual(result.status_code, HTTPStatus.FOUND)

    def test_delete_in_web(self):
        news_obj = News.objects.first()

        path = reverse("mainapp:news_delete", args=[news_obj.pk])
        self.client_with_auth.post(path)
        news_obj.refresh_from_db()
        self.assertTrue(news_obj.deleted)
