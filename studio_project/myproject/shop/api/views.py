from rest_framework.viewsets import ModelViewSet
from .serializers import ShopSerializer
from shop.models import Shop


class ImageViewSet(ModelViewSet):
    queryset = Shop.objects.all()
    serializer_class = ShopSerializer
    