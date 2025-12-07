import json
import graphene
from graphene_django import DjangoObjectType
from graphene.relay.node import Node
from django.db.models import Q


from .models import (
    User
 )


class UserType(DjangoObjectType):
    class Meta:
        model = User
        


class UsersQuery(object):
    all_user= graphene.List(UserType)
    # get_employee_detail = graphene.Field(EmployeeType, id=graphene.String())

    
    def resolve_all_user(self, info, **kwargs):
        return User.objects.all()
    
    # def resolve_get_employee_detail(self, info, id,**kwargs):
    #     _, raw_pk = Node.from_global_id(id)
    #     return Employee.objects.get(id=raw_pk)
    
    
class CreateUser(graphene.Mutation):
    user = graphene.Field(UserType)

    class Arguments:
        email = graphene.String()
        contactno = graphene.String()
        last_update=graphene.DateTime()
    def mutate(self, info,email,contactno,department):
        usr = User(email = email,contactno = contactno,department=department)
        usr.save()
        return CreateUser(user = usr)