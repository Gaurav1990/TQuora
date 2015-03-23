from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class UserProfile(models.Model):
    user = models.ForeignKey(User, unique = True)
    user_desc = models.CharField(max_length=1000, null=True)
    #user_name = models.CharField(max_length=1000)
    user_full_detail = models.CharField(max_length=1000,null=True)
    profile_pic = models.FileField(upload_to='profile_imgs')
    studied = models.CharField(max_length=1000)
    Email_id = models.EmailField()  # to add another email id 
    address = models.TextField()