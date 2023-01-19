from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from django.views.generic import RedirectView
from mainapp.views import errors_handlers

from config import settings

urlpatterns = [
    path('administrations_section/', admin.site.urls),
    path('i18n/', include('django.conf.urls.i18n')),
    path('', RedirectView.as_view(url='mainapp/')),
    path('mainapp/', include('mainapp.urls', namespace='mainapp')),
    path('authapp/', include('authapp.urls', namespace='authapp')),
    path("social_auth/", include("social_django.urls", namespace="social")),
]

handler500 = errors_handlers.handler500

if settings.DEBUG:
    import debug_toolbar
    urlpatterns += (static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT))
    urlpatterns.append(path('__debug__/', include(debug_toolbar.urls)))
