from django.db import models

class Storage(models.Model):
    shop=models.ForeignKey('shop.Shop', on_delete=models.CASCADE)
    photo = models.ImageField(upload_to="Photo_Storage")
    date = models.DateTimeField(auto_now=True, blank=True)
    last_update = models.DateTimeField(auto_now=True, blank=True)
    status = models.BooleanField(default=False)

