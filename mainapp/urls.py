from django.urls import path
from django.views.decorators.cache import cache_page

from mainapp.views import *
from mainapp.apps import MainappConfig


app_name = MainappConfig.name

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('rules_regulations', RulesRegulationsView.as_view(), name='rules_regulations'),
    path('contacts/', ContactsPageView.as_view(), name='contacts'),
    path('doc_site/', DocPageView.as_view(), name='doc_site'),
    #path('login/', LoginPageView.as_view(), name='login'),

    path(
        'courses/',
        (CoursesListView.as_view()),
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

    path('log_view/<int:tail>', LogView.as_view(), name='log_view'),
    path('log_download', LogDownloadView.as_view(), name='log_download'),
]
