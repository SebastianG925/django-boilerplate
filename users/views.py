from users.models import User
from django.shortcuts import get_object_or_404
from ninja import NinjaAPI
from users.schemas import UserSchema

api = NinjaAPI()

@api.get("/user/{user_id}", response=UserSchema)
def get_user(request, user_id: int):
    user = get_object_or_404(User, id=user_id)
    return user

@api.get("/users", response=list[UserSchema])
def get_users(request):
    users = User.objects.all()
    return users
