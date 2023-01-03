__all__ = ("TestCoursesMockCacheRequest", )

import pickle
from http import HTTPStatus
from unittest import mock

from django.test import TestCase
from django.urls import reverse

from mainapp.models import Courses


class TestCoursesMockCacheRequest(TestCase):
    fixtures = (
        "authapp/fixtures/001_admin_user.json",
        "mainapp/fixtures/002_course.json",
        "mainapp/fixtures/003_lessons.json",
        "mainapp/fixtures/004_teachers.json",
    )

    def test_page_open_detail(self):
        course_obj = Courses.objects.get(pk=2)
        path = reverse("mainapp:course_detail", args=[course_obj.pk])

        with open("mainapp/tests/fixtures/006_feedback_list_2.bin", "rb") as inpf,\
                mock.patch("django.core.cache.cache.get") as mocked_cache:
            print(mocked_cache.called)
            mocked_cache.return_value = pickle.load(inpf)
            print(mocked_cache.mock_calls)
            result = self.client.get(path)
            self.assertEqual(result.status_code, HTTPStatus.OK)
            self.assertTrue(mocked_cache.called)
