from rest_framework.viewsets import ModelViewSet
from .serializers import StorageSerializer
from storage.models import Storage


class ImageViewSet(ModelViewSet):
    queryset = Storage.objects.all()
    serializer_class = StorageSerializer
    