from django.urls import path

from .views import *
from mainapp.apps import MainappConfig


app_name = MainappConfig.name

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('contacts/', ContactsPageView.as_view(), name='contacts'),
    path('doc_site/', DocPageView.as_view(), name='doc_site'),
    # Надо удалять? auth теперь на другйо вьюхе
    path('login/', LoginPageView.as_view(), name='login'),

    # Курсы, просмотр, рейтинг
    path(
        'courses/',
        CoursesListView.as_view(),
        name='courses'
    ),
    path(
        'courses/<int:pk>/detail',
        CoursesDetailView.as_view(),
        name='course_detail'
    ),
    path(
        'course/feedback/',
        CourseFeedbackProcessFormView.as_view(),
        name='course_feedback'
    ),

    # CURD для новостей
    path('news/', NewsListView.as_view(), name='news'),
    path(
        'news/create',
        NewsCreateView.as_view(),
        name='news_create'
    ),
    path(
        'news/<int:pk>/detail',
        NewsDetailView.as_view(),
        name='news_detail'
    ),
    path(
        'news/<int:pk>/update',
        NewsUpdateView.as_view(),
        name='news_update'
    ),
    path(
        'news/<int:pk>/delete',
        NewsDeleteView.as_view(),
        name='news_delete'
    ),

    # Фича редиректа на гугл
    path('google_redirect/<str:param>', redirect_page, name='google_redirect'),
]
