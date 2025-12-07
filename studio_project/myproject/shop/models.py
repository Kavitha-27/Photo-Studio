from django.db import models

class Shop(models.Model):
    user=models.ForeignKey('myapp.User',on_delete=models.CASCADE)
    photoshopname=models.CharField(blank=False)
    contactno=models.CharField(blank=False)
    last_update = models.DateTimeField(auto_now=True, blank=True)
    status = models.BooleanField(default=False)



