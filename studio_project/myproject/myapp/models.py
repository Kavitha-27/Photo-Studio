from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    email = models.EmailField(blank=False, max_length=50, verbose_name="email address")
    contactno = models.CharField(max_length=25, blank=True)
    last_update = models.DateTimeField(auto_now=True, blank=True)

    groups = models.ManyToManyField(
        'auth.Group',
        verbose_name=('groups'),
        blank=True,
        related_name='customuser_set', 
        related_query_name='customuser',
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission',
        verbose_name=('user permissions'),
        blank=True,
        related_name='customuser_set', 
        related_query_name='customuser',
    )

    USERNAME_FIELD = "username"

