from django.contrib.auth.models import User 
from accounts.models import UserProfile
from openid.consumer.consumer import SUCCESS
from django.core.mail import mail_admins
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
 
class GoogleBackend:
    def authenticate(self, openid_response):
        if openid_response is None:
            return None
        if openid_response.status != SUCCESS:
            return None
 
        google_email = openid_response.getSigned('http://openid.net/srv/ax/1.0',  'value.email')
        google_firstname = openid_response.getSigned('http://openid.net/srv/ax/1.0', 'value.firstname')
        google_lastname = openid_response.getSigned('http://openid.net/srv/ax/1.0', 'value.lastname')
        print "we are inside"   
        #print google_firstname
        #print google_lastname
        #print google_email
                
        try:
            #user = User.objects.get(username=google_email)
            # Make sure that the e-mail is unique.
            user = User.objects.get(email=google_email)
            print "Existed"
        except:
            print "Not Existed"
            user = User(username = google_email, first_name = google_firstname, last_name = google_lastname,  email = google_email)
            
            try:
                #print "hello"
                user.firstname = google_firstname
                user.lastname = google_lastname
                #print "India"
                #print user.firstname
            except:
                pass
            user.save()
            
            #user_pro = UserProfile(user = user , user_name = user.first_name + " " + user.last_name)
            #print "Thsi"
            #print user_pro.user_name
            #user_pro.save()
            #return user
        #print "going inside userprofile"   
        try:        
            user_pro = UserProfile(user = user)
            user_pro.save()
        except:
            pass
        return user
        
    def get_user(self, user_id):
 
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None

