import graphene
from graphene_django.types import DjangoObjectType
from .models import Shop

class ShopType(DjangoObjectType):
    class Meta:
        model=Shop

class ShopQuery(object):
    all_shop=graphene.List(ShopType)

    def resolve_all_shop(self,info,**kwargs):
        return Shop.objects.all()
    
class CreateShop(graphene.Mutation):
    shop=graphene.Field(ShopType)

    class Arguments:
        user=graphene.ID(required=True)
        photoshopname=graphene.String(required=True)
        contactno=graphene.String(required=True)
        last_update = graphene.DateTime(required=True)
        status = graphene.Boolean(required=True)



    def mutate(self, info, user, photoshopname,contactno, status, last_update):
        shp=Shop(user_id=user,photoshopname=photoshopname,contactno=contactno,status=status, last_update=last_update)
        shp.save()
        return CreateShop(shop=shp)

class ShopMutation(graphene.ObjectType):
    create_shop=CreateShop.Field()

