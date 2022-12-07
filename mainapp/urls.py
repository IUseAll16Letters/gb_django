from django.urls import path

from .views import *
from mainapp.apps import MainappConfig


app_name = MainappConfig.name

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('contacts/', ContactsPageView.as_view(), name='contacts'),
    path('courses/', CoursesListView.as_view(), name='courses'),
    path('doc_site/', DocPageView.as_view(), name='doc_site'),
    path('news/', NewsPageView.as_view(), name='news'),
    path('news/<int:page>', NewsPageView.as_view(), name='news'),
    path('login/', LoginPageView.as_view(), name='login'),
    path('google_redirect/<str:param>', redirect_page, name='google_redirect'),
]
