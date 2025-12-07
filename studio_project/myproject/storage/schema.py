import graphene
from graphene_django.types import DjangoObjectType
from .models import Storage

class StorageType(DjangoObjectType):
    class Meta:
        model=Storage

class StorageQuery(object):
    all_storage=graphene.List(StorageType)

    def resolve_all_storage(self,info,**kwargs):
        return Storage.objects.all()
    
class CreateStorage(graphene.Mutation):
    storage=graphene.Field(StorageType)

    class Arguments:
        shop=graphene.String()
        photo=graphene.String()
        date=graphene.DateTime()
        status=graphene.Boolean()
        last_update=graphene.DateTime()

    def mutate(self, info,shop, photo,date, status, last_update):
        store=Storage(shop_id=shop,photo=photo,date=date,status=status, last_update=last_update)
        store.save()
        return CreateStorage(Storage=store)

class StorageMutation(graphene.ObjectType):
    create_storage=CreateStorage.Field()

