from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    creation_timestamp = models.DateTimeField(auto_now_add=True)
    last_updated_timestamp = models.DateTimeField(auto_now=True)
