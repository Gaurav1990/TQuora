#from django.shortcuts import render_to_response
from django.shortcuts import render_to_response,redirect
from django.contrib.auth import logout
from django.contrib.auth import authenticate, login
from django.views.decorators.csrf import csrf_exempt
#from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from collections import deque
import random
from django.contrib.auth.models import User
from quora.forms import AddQuestionForm, AddAnswerForm, NewPasswordForm, TopicForm, PhotoForm
from quora.models import Question, Post, Answer, Comment, Like, Comment_likes, AnswerStream, QuestionStream, Topic 
from accounts.models import UserProfile
from django.db.models.query import QuerySet
from django.db.models import Q
from time import gmtime, strftime
import os
from django.core.mail import send_mail
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import logging
import json as simplejson
import re
from BeautifulSoup import BeautifulSoup
logger = logging.getLogger(__name__)
dthandler = lambda obj: obj.isoformat() if isinstance(obj, datetime.datetime) else None
from django_socketio import events
from django_socketio.channels import SocketIOChannelProxy
from django.contrib.auth.decorators import user_passes_test, login_required

@csrf_exempt
def home(request):
    if request.user.is_authenticated():
        print "what"
        return redirect('/quora/home/')
    else:
        print "hell"
        try:
            user = User.objects.get(id = request.user.id)
        except:
            user = None    
	    try:
	        profile = UserProfile.objects.get(user_id = request.user.id)
	    except:
	        pass
	    
	    if request.method == "POST":
	        username = request.POST.get('username')
	        password = request.POST.get('password')
	        user = authenticate(username=username, password=password)
	        if user:
	            if user.is_active:
	                login(request, user)
	                return HttpResponseRedirect('/quora/home/')
	                
	        else:
	            state = "Username or Password is not correct"
	            return render_to_response("login.html",locals())
	    else:          
	        return render_to_response("login.html",locals())
