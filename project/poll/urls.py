from django.urls import path

from .views import poll_list

app_name = 'polls'
urlpatterns = [
    path('', poll_list, name='list'),
]
