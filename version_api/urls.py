from django.urls import path
from .views import get_version

urlpatterns = [
    path('version/', get_version),
]
