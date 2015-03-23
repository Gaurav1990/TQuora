from django.shortcuts import render_to_response,redirect
from django.contrib.auth import logout
from django.contrib.auth import authenticate, login
from django.views.decorators.csrf import csrf_exempt

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
#dthandler = lambda obj: obj.isoformat() if isinstance(obj, datetime.datetime) else None
from django_socketio import events
from django_socketio.channels import SocketIOChannelProxy
from django.contrib.auth.decorators import user_passes_test, login_required

    

@csrf_exempt
@login_required(login_url='/')
def scroll_home(request): # Home page
    complete_answers = Answer.objects.all();
    try:
        user = User.objects.get(id = request.user.id)
    except:
        user = None
    #if user is not None:
    try:
        profile = UserProfile.objects.get(user_id = request.user.id)
    except:
        pass
    sorted_list,questions_list = sorted_event_list(request) 
  
    event_list = []
    paginator = Paginator(questions_list, 10)
    page = request.GET.get('page')
    
    try:
        question = paginator.page(page)
    except PageNotAnInteger:
        question = paginator.page(1)
    except EmptyPage:
        question = paginator.page(paginator.num_pages)
    if request.is_ajax():
        #print "json call"
        el = []
        im = []
        for item in question :
            el.append(item)
        if question.has_next :
            return HttpResponse(simplejson.dumps({"event_list":el}), mimetype="application/json" )
        return HttpResponse("")
    return render_to_response('quora/home.html',locals())
    #else:
    #    return HttpResponseRedirect('/')


def sorted_event_list(request):  # Sorted_event_list for the home page.
    logger.debug("entry of home view")
    questions = []
    question_list = {}
    final_list = []
    image = ""
    answer_event = AnswerStream.objects.all()
    question_event = QuestionStream.objects.all()
    for item in answer_event:
        question_list[item] = {"modified_time" : item.modified_date}
    for item in question_event:
        question_list[item] = {"modified_time" : item.modified_date}
    prior_event = sorted(question_list.keys(), key=lambda k: question_list[k]["modified_time"], reverse=True)
    for item in prior_event:
       
        if item in answer_event:
            if item.operation == "C":
                state = "Comment"
            else:
                state = "Answer"
            try:
                post = Answer.objects.get(id=item.answer_id).title
            except:
                pass
            try:
                pic = Topic.objects.get(topic=post.tags).picture
            except:
                pic = None
            if pic:
                image = pic
            else:
                image = None
            x = Answer.objects.filter(title_id=post.id).count()
            answer = Answer.objects.get(id=item.answer_id)
            comm_count = Comment.objects.filter(post_id=answer.post_id).count()
            like_numbers = Like.objects.filter(answer_id=answer.id, likes=1).count()
            answers = answer.description
            soup = BeautifulSoup(answers)
            for img in soup.findAll('img'):
                img['height'] = 100 
                img['width'] = 100
            small_img = soup.prettify()
            vote = answer.vote
            ans_id = answer.id
            try:
                liked = Like.objects.get(user_id=request.user.id, likes="1",answer_id=answer.id )
                
            except:
                liked = None
            if liked:
                like_user = True
            else:
                like_user = False
            try:
                userprofile_desc = UserProfile.objects.get(user_id = answer.user_id)
                user = User.objects.get(id = answer.user_id)
                username = user.first_name + " " + user.last_name
                desc = userprofile_desc.user_desc
                if desc is None:
                    desc = ""
                user_img = userprofile_desc.profile_pic
            except:
                username = ""
                desc = ""
                user_img = ""
            try:
                userprofile_full_detail = userprofile_desc.user_full_detail
            except:
                userprofile_full_detail = ""
            d = {   'tags': post.tags,
                    'title': post.title,
                    'slug_tags': post.slug_tags,
                    'slug_title': post.slug_title,
                    'count': x,
                    'id': post.id,
                    'vote':vote,
                    'description': post.description,
                    'user_id': item.modified_by_id,
                    'state': state,
                    "person": request.user.id,
                    "id":item.id,
                    "type":"answer",
                    "image":str(image),
                    "date":str(item.modified_date),
                    'answer':answers,
                    'comm_count':comm_count,
                    "like_numbers":like_numbers,
                    "userprofile_desc":username,
                    "userprofile_description":desc,
                    "userprofile_full_detail":userprofile_full_detail,
                    "user_img":str(user_img),
                    "ans_id":ans_id,
                    "liked":like_user,
                    "small_img":small_img,
                    }
            questions.append(d)

        else:
            if item.operation == "C":
                state = "Comment"
            else:
                state = "Question"
            post = Question.objects.get(id=item.question_id)
            try:
                pic = Topic.objects.get(topic=post.tags).picture
            except:
                pic = None
            image = None
            if pic:
                image = pic
            try:
                x = Answer.objects.filter(title_id=post.id).count()
                answer = Answer.objects.get(id=item.answer_id)
                answers = answer.description
                soup = BeautifulSoup(answers)
                for img in soup.findAll('img'):
                    img['height'] = 100 
                    img['width'] = 100
                small_img = soup.prettify()
                
                vote = answer.vote
                ans_id = answer.id 
                comm = Comment.objects.filter(post_id=answer.post_id)
                comm_count = Comment.objects.filter(post_id=answer.post_id).count()
                like_numbers = Like.objects.filter(answer_id=answer.id, likes=1).count()
                userprofile_desc = UserProfile.objects.get(user_id = answer.user_id)
                user = User.objects.get(id = answer.user_id)
                username = user.first_name + " " + user.last_name
                desc = userprofile_desc.user_desc
                if desc is None:
                    desc = ""
                user_img = userprofile_desc.profile_pic
                userprofile_full_detail = userprofile_desc.user_full_detail
                try:
                    liked = Like.objects.get(user_id=request.user.id, likes="1")
                except:
                    liked = None
                if liked:
                    like_user = True
                else:
                    like_user = False    
                
            except:
                answers = []
                vote = 0
                small_img = ""
                comm_count = ""
                like_numbers = []
                user_img = ""
                desc = ""
                username = ""
                like_user = False
                ans_id = ""
                userprofile_full_detail = ""
                pass   
          
            d = {   'tags': post.tags,
                    'title': post.title,
                    'slug_tags': post.slug_tags,
                    'slug_title': post.slug_title,
                    'count': x,
                    'id': post.id,
                    'description': post.description,
                    'user_id': item.modified_by_id,
                    'state': state,
                    "person": request.user.id,
                    "id":item.id,
                    "type":"question",
                    "image":str(image),
                    "date":str(item.modified_date),
                    'answer':answers,
                    'vote':vote,
                    "ans_id":ans_id,
                    "user_img":str(user_img),
                    'comm_count':comm_count,
                    "like_numbers":like_numbers,
                    "userprofile_desc":username,
                    "userprofile_description":desc,
                    "userprofile_full_detail":userprofile_full_detail,
                    "liked":like_user,
                    "small_img":small_img,
            }
            questions.append(d)
    return prior_event,questions

@csrf_exempt
@login_required(login_url='/')
def logout_view(request):  ## Logout view
    logout(request)
    return HttpResponseRedirect(reverse('views.home'))


@csrf_exempt
@login_required(login_url='/')
def setpass(request): # Set password After sign up through Gmail.
    try: 
        user = User.objects.get(id = request.user.id)
    except:
        user = None
    if user is None:
        return HttpResponseRedirect('/')
    else:
        try:
            profile = UserProfile.objects.get(user_id = request.user.id)
        except:
            pass
        if request.method == "POST":
            password = request.POST.get('password')
            username = request.POST.get('username')
            if password and username:
                user = User.objects.get(email=username)
                user.set_password(str(password))
                user.save()
                return HttpResponseRedirect('/quora/home/')
            else:
                return render_to_response('setpassword.html', locals())    
        else:
            return render_to_response('setpassword.html', locals())


@csrf_exempt
@login_required(login_url='/')
def saving_question(request): ## Adding Question view.
    user = User.objects.get(id = request.user.id)
    try:
        profile = UserProfile.objects.get(user_id = request.user.id)
    except:
        pass
    if request.method == "POST":
        exist_title = []
        tag = request.POST.get('tags')
        question_title = request.POST.get('tag')
        desc = request.POST.get('description')
        exist_question = Question.objects.all()
        for item in exist_question:
            exist_title.append(item.title)
        if question_title in exist_title:
            return render_to_response('adding_question.html', locals())
        if tag and question_title:
            post_model = Post(post_type='Q')
            post_model.save()
            question = Question.objects.create(
                                user=request.user,
                                post=post_model,
                                updated_by=request.user.username,
                                tags=tag,
                                title=question_title,
                                description=desc,
                                )
            question.save()
            
            try:
                new_topic = Topic.objects.get(topic=tag)
            except:
                new_topic = None
            if new_topic:
                new_topic.final_value += 5
                new_topic.save()
            else:
                create_topic = Topic.objects.create(
                					topic=tag,
                                    initial_value=0,
                                    final_value=0,
                					)
                create_topic.save()
            question_stream = QuestionStream.objects.create(
        							modified_by=request.user,
        							question=question,
        							operation="A",
        							)
            question_stream.save()
            return HttpResponseRedirect('/quora/home/')
        else:
            state = ""
            return render_to_response('adding_question.html', locals())
    else:
        form = AddQuestionForm()
        state = ""
        return render_to_response('adding_question.html', locals())


@csrf_exempt
@login_required(login_url='/')
def question_description(request, tags, title):
    
    user = User.objects.get(id = request.user.id)
    try:
        profile = UserProfile.objects.get(user_id = request.user.id)
        profile_img = os.path.basename(profile.profile_pic.name)
    except:
        pass
    userprofile = UserProfile.objects.all()
    logger.debug("inside question view")
    print "inside question_description"
    question = Question.objects.get(slug_title=title)
    image = Topic.objects.get(topic=question.tags).picture
    answers = Answer.objects.filter(title_id=question.id)
    no_of_answer = answers.count()
    no_of_comment = Comment.objects.filter(post_id=question.post_id).count()
    req = request.user.username
    liked = Like.objects.all()
    comment_like = Comment_likes.objects.all()
    query = Question.objects.get(slug_title=title)
    related = Question.objects.filter(tags=query.tags)
    related_questions = deque(maxlen=5)
    number = related.count()
    for x in range(0, number):
        item = random.choice([x for x in related if x not in related_questions])
        related_questions.append(item)
    if request.method == 'POST':
        form_ans = AddAnswerForm(request.POST)
        post_model = Post(post_type='A')
        post_model.save()
        if (len(request.POST.get('answer')) == 0):
            return HttpResponse(simplejson.dumps({"len":0}),mimetype="application/json")
        
        answer = Answer.objects.create(user=request.user,
                                title=question,
                                post=post_model,
                                vote=0,
                                description=request.POST.get('answer'),
                                
                          
                            )
        answer.save()
        
        matches = re.findall(r'<.*?>', answer.description)
        print matches
        for m in matches:
            if m.startswith('<img'):
                answer.vote = 1
        answer.save()


        topic = Topic.objects.get(topic=question.tags)
        topic.final_value += 5
        topic.save()
        stream=AnswerStream.objects.create(
            				modified_by=request.user,
            				answer=answer,
            				operation="A",
            				)
        stream.save()
        answer_model = Answer.objects.all()
        
        form_ans = AddAnswerForm()
        comments = Comment.objects.all()

        likes = Like(user=request.user, answer=answer, likes=0)
        likes.save()
        liked = Like.objects.all()
        ans_list = []
        for ans in answers:
            ans_dict = {}
            answer_comment = Comment.objects.filter(
                        post_id=ans.post_id).count()
            list_user_names = []
            like_objects = Like.objects.filter(answer_id=ans.id, likes=1)
            str_names = ""
            first_2_users_str = ""
            
            try:
                liked_upto = ans.liked_by
            except:
                liked_upto = []    
            liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
            if liked_upto[0] == "":
                del liked_upto[0]
            str_names = "  ,  ".join(liked_upto)
            first_2_users = liked_upto[0:2]
            first_2_users_str = "  ,  ".join(first_2_users)
            
            ans_dict = {"number": len(like_objects),
                            "id": ans.id,
                            "vote":ans.vote,
                            "user_id": ans.user_id,
                            "user": ans.user,
                            "title_id": ans.title_id,
                            "post_id": ans.post_id,
                            "description": ans.description,
                            "liked_by":ans.liked_by,
                            "profile":profile,
                            "created_date": ans.created_date,
                            "str_names": str_names,
                            "first_2_users_str":first_2_users_str,
                            "answer_comment": answer_comment}
            ans_list.append(ans_dict)
        list_like_model = []
        for comment in comments:
            dict_like = {}
            list_users = []
            str_users = ""
            comment_likes = Comment_likes.objects.filter(
                    comment_id=comment.id, likes=1)
            first_2_users_str = ""
            str_names = ""

            try:
                liked_upto = comment.liked_by
            except:
                liked_upto = []    
            liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
            if liked_upto[0] == "":
                del liked_upto[0]
            str_names = "  ,  ".join(liked_upto)
            first_2_users = liked_upto[0:2]
            first_2_users_str = "  ,  ".join(first_2_users)




            dict_like = {"id": comment.id,
                         "user_id": comment.user_id,
                         "user": comment.user,
                         "post_id": comment.post_id,
                         "comment": comment.comment,
                         "profile":profile,
                         "created_date": comment.created_date,
                         "total_likes": len(comment_likes),
                         "first_2_users_str":first_2_users_str,
                         "str_users": str_names}
            list_like_model.append(dict_like)
           
            #no_of_comment = len(list_like_model)
        total_answers = str(len(answers)) + "  Answers"
        if profile_img =="":
            profile_img = "man.png"
        return HttpResponse(simplejson.dumps(
                                       { "desc": answer.description,
                                         "profile_img":profile_img,
                                         "num_answers": total_answers,
                                         "len": len(answer.description),
                                        "f_name":profile.user.first_name+" "+profile.user.last_name,
                                        "a_id":answer.id,
                                        "answer_created_date":str(answer.created_date),
                                        }),mimetype="application/json")
    else:
        form_ans = AddAnswerForm()
        comments = Comment.objects.all()
        liked = Like.objects.all()
        ans_list = []
        for ans in answers:
            ans_dict = {}
            answer_comment = Comment.objects.filter(
                                    post_id=ans.post_id).count()
            list_user_names = []
            like_objects = Like.objects.filter(answer_id=ans.id, likes=1)
            str_names = ""
            first_2_users_str = ""
            
            try:
                liked_upto = ans.liked_by
            except:
                liked_upto = []    
            liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
            if liked_upto[0] == "":
                del liked_upto[0]
            str_names = "  ,  ".join(liked_upto)
            first_2_users = liked_upto[0:2]
            first_2_users_str = "  ,  ".join(first_2_users)


            ans_dict = {"number": len(like_objects),
                        "id": ans.id,
                        "user_id": ans.user_id,
                        "user": ans.user,
                        "vote":ans.vote,
                        "title_id": ans.title_id,
                        "post_id": ans.post_id,
                        "description": ans.description,
                        "created_date": ans.created_date,
                        "str_names": str_names,
                        "profile":profile,
                        "liked_by":ans.liked_by,
                        "first_2_users_str":first_2_users_str,
                        "answer_comment": answer_comment}
            ans_list.append(ans_dict)
        list_like_model = []
        for comment in comments:
            dict_like = {}
            list_users = []
            str_users = ""
            comment_likes = Comment_likes.objects.filter(
                                            comment_id=comment.id, likes=1)
            first_2_users_str = ""
            str_names = ""

            try:
                liked_upto = comment.liked_by
            except:
                liked_upto = []    
            liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
            if liked_upto[0] == "":
                del liked_upto[0]
            str_names = "  ,  ".join(liked_upto)
            first_2_users = liked_upto[0:2]
            first_2_users_str = "  ,  ".join(first_2_users)
            
            dict_like = {"id": comment.id,
                         "user_id": comment.user_id,
                         "user": comment.user,
                         "post_id": comment.post_id,
                         "comment": comment.comment,
                         "profile":profile,
                         "created_date": comment.created_date,
                         "total_likes": len(comment_likes),
                         "first_2_users_str":first_2_users_str,
                         "str_users": str_names}
            list_like_model.append(dict_like)
        return render_to_response('quora/question_detail.html', locals())


@csrf_exempt
@login_required(login_url='/')
def user_settings(request): # user setting page view
    user = User.objects.get(id = request.user.id)
    try:
        profile = UserProfile.objects.get(user_id = request.user.id)
    except:
        pass
    return render_to_response('quora/settings.html', locals())


@csrf_exempt
@login_required(login_url='/')
def change_password(request): # change password in settings view
    try:
        user = User.objects.get(id = request.user.id)
    except:
        user = None
    if user is None:
        return HttpResponseRedirect('/')
    else:
        try:
            profile = UserProfile.objects.get(user_id = request.user.id)
        except:
            pass
        if request.method == "POST":
            new_password = request.POST.get('change')
            print new_password
            print "hi"
            
            if new_password:
                print new_password
                register = User.objects.get(username=request.user.username)
                register.set_password(str(new_password))
                register.save()
            else:
                pass
            return render_to_response('quora/settings.html', locals())
        else:
            return render_to_response('quora/settings.html', locals())
    


@csrf_exempt
@login_required(login_url='/')
def answer_delete(request, a_id): # View for deleting answer in question_detail page.
    answer = Answer.objects.get(id=a_id)
    question = answer.title
    answer.delete()
    topic = Topic.objects.get(topic=question.tags)
    if topic.final_value >=5:
        topic.final_value -=5
        topic.save()
    else:
        topic.final_value = 0
        topic.save()
    num_answers = Answer.objects.filter(title_id=question.id)
    answer_len_str = str(len(num_answers)) + "  Answers"
    try:
        answer_stream = AnswerStream.objects.get(answer=answer, operation="A")
    except:
        answer_stream = None
    if answer_stream:
        answer_stream.delete()
    return HttpResponse(simplejson.dumps({"num_answers": answer_len_str}),
                         mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def all_unanswered_question(request): # view for all unanswered questions.
    user = User.objects.get(id = request.user.id)
    try:
        profile = UserProfile.objects.get(user_id = request.user.id)
    except:
        pass
    query = Answer.objects.all().query
    query.group_by = ['title_id']
    ans = QuerySet(query=query, model=Answer)
    all_questions = Question.objects.filter(
                            ~Q(id__in=[item.title_id for item in ans]))
    event_list = []
    paginator = Paginator(all_questions, 10)
    page = request.GET.get('page')
  
    try:
        question = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        question = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        question = paginator.page(paginator.num_pages)
    if request.is_ajax():
        print "json call"
        el = []
        for item in question:
            e = {}
            e = {"e_name": item.title}
            el.append(e)
        if question.has_next:
            print "next"
            page = int(page) + 1
            print page
            return HttpResponse(simplejson.dumps({"event_list": el,
                             "page_num": page}), mimetype="application/json")
        return HttpResponse("")
    return render_to_response('quora/unanswered_questions.html', locals())


@csrf_exempt
@login_required(login_url='/')
def display_comments(request, a_id): # View for adding comments for answer.
    vars = {}
    profile = UserProfile.objects.get(user_id = request.user.id)
    profile_img = os.path.basename(profile.profile_pic.name)
    answer = Answer.objects.get(id=a_id)
    if request.method == "POST":
        comment = request.POST.get('answer_comment')
      
        if len(comment) == 0:
            return HttpResponse(simplejson.dumps({"len": len(comment)}),
                                 mimetype="application/json")
        post_model = Post.objects.get(id=answer.post_id)
        comment_ans = Comment(user=request.user,
                                post=post_model,
                                comment=comment,
                              )
        comment_ans.save()
        question = Question.objects.get(id=answer.title_id)
        topic = Topic.objects.get(topic=question.tags)
        topic.final_value += 5
        topic.save()
        comment_like_model = Comment_likes(user=request.user,
                                        comment=comment_ans,
                                        likes=0)
        comment_like_model.save()
        comm = Comment.objects.filter(post=post_model)
        if profile_img =="":
            profile_img = "man.png"
        
        return HttpResponse(simplejson.dumps(
        { "comment_by": profile.user.first_name+" "+profile.user.last_name,
        "comment": comment_ans.comment,
        "created_date": str(comment_ans.created_date),
        "comment_like_id": comment_ans.id,
        "num_comments": len(comm),
        "profile_img":profile_img,
        }),mimetype="application/json")
    else:
        return HttpResponse(simplejson.dumps(vars),
                             mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def comment_delete(request, a_id, c_id): #view for deleting answer comments.
    answer = Answer.objects.get(id=a_id)
    question = Question.objects.get(id=answer.title_id)
    topic = Topic.objects.get(topic=question.tags)
    if topic.final_value >= 5:
        topic.final_value -= 5
        topic.save()
    else:
        topic.final_value = 0
        topic.save()
    post_model = Post.objects.get(id=answer.post_id)
    comment = Comment.objects.get(id=c_id)
    try:
        answer_stream = AnswerStream.objects.get(modified_date=comment.created_date)
    except:
        answer_stream = None
    comm = Comment.objects.filter(post=post_model)
    comment.delete()
    if answer_stream:
        answer_stream.delete()
    return HttpResponse(simplejson.dumps({"num_comments": len(comm)}),
                         mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def auto_search(request): # view for search box options.
    try:
        search_value = request.POST.get('value')
    except:
        search_value = None
    if search_value != None:
        value = search_value
        extra_query = Question.objects.filter(title__icontains=value)
        query = extra_query.query
        query.group_by = ['tags']
        query = QuerySet(query=query, model=Question)
        question_list = []
        new_query = []
        
        for item in extra_query:
            new_query.append(item.title)
        for item in query:
            question_list.append(item.tags)
        question_list.extend(new_query)
        return HttpResponse(simplejson.dumps( {"question_list": question_list}),
            mimetype="application/json")
    else:
        question_list = []
        return HttpResponse(simplejson.dumps( {"question_list": question_list,}),
        mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def question_topic_search(request): # view for topic and question list in add question and create topic form.
    vars = {}
    try:
        value = request.POST.get('value')
    except:
        value = None
    if value != None:
        query = Question.objects.filter(tags__icontains=value).query
        query.group_by = ['tags']
        query = QuerySet(query=query, model=Question)
        question = Question.objects.filter(title__icontains=value)
        topic_list = []
        question_list = []
        for item in query:
            topic_list.append(item.tags)
        for item in question:
            question_list.append(item.title)

        return HttpResponse(simplejson.dumps( {"question_list": question_list,"topic_list":topic_list}),
                mimetype="application/json")
    else:
        return HttpResponse(simplejson.dumps(vars),
                mimetype="application/json")

@csrf_exempt
@login_required(login_url='/')
def search_results(request): # view for results of search box.
    if request.method=="POST":
        tags = []
        title = []
        question = Question.objects.all()
        for item in question:
            title.append(item.title)
            tags.append(item.tags)   
        step = request.POST.get('tags')
        if step in title :
            item = Question.objects.get(title=step)
       
            return HttpResponseRedirect(os.path.join('/quora/question/', item.slug_tags, item.slug_title))
        elif step in tags:
            return HttpResponseRedirect(os.path.join('/quora/topic-search',step))
        else:
            return HttpResponseRedirect('/quora/home/')
    else:
        return HttpResponseRedirect('/quora/home/') 


@csrf_exempt
@login_required(login_url='/')
def search_topic(request,topic): # view for searched topic in search box.
    user = User.objects.get(id = request.user.id)
    try:
        profile = UserProfile.objects.get(user_id = request.user.id)
    except:
        pass
    sorted_list,required_list = sorted_event_list(request) 
    questions_list = []
    for item in required_list:
        if item["tags"]==topic:
            questions_list.append(item)
        else:
            pass
    paginator = Paginator(questions_list, 10)
    page = request.GET.get('page')
    print "page: ",page
    try:
        question = paginator.page(page)
    except PageNotAnInteger:
        question = paginator.page(1)
    except EmptyPage:
        question = paginator.page(paginator.num_pages)
    if request.is_ajax():
        print "json call"
        el = []
        im = []
        for item in question :
            el.append(item)
        if question.has_next :
            return HttpResponse(simplejson.dumps({"event_list":el}), mimetype="application/json")
        return HttpResponse("")
    return render_to_response('quora/home.html',locals())                   
                
           
@csrf_exempt
@login_required(login_url='/')
def question_comment(request, q_id): # view for comment for question.
    vars = {}
    profile = UserProfile.objects.get(user_id = request.user.id)
    profile_img = os.path.basename(profile.profile_pic.name)
    question = Question.objects.get(id=q_id)
    if request.method == "POST":
        topic = Topic.objects.get(topic=question.tags)
        topic.final_value += 5
        topic.save()
        comment = request.POST.get('ques_comment')
        post_model = Post.objects.get(id=question.post_id)
        if (len(comment) == 0):
            return HttpResponse(simplejson.dumps({"len": len(comment),}),mimetype="application/json")
        comment_ans = Comment(user=request.user,
                                post=post_model,
                                comment=comment,
                                )
        comment_ans.save()
        comment_like_model = Comment_likes(user=request.user,
                                        comment=comment_ans,
                                        likes=0)
        comment_like_model.save()
        if profile_img =="":
            profile_img = "man.png"
        comm = Comment.objects.filter(post=post_model)
        return HttpResponse(simplejson.dumps(
                            {"comment_by": profile.user.first_name+" "+profile.user.last_name,
                             "len": len(comment),
                             "comment": comment_ans.comment,
                             "created_date": str(comment_ans.created_date),
                             "comment_like_id": comment_ans.id,
                             "profile_img":profile_img,
                     
                             "num_comments": len(comm)}),mimetype="application/json")
    else:
        return HttpResponse(simplejson.dumps(vars),mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def question_comment_delete(request, q_id, c_id): # view for deleting question comments.
    question = Question.objects.get(id=q_id)
    topic = Topic.objects.get(topic=question.tags)
    if topic.final_value >= 5:
        topic.final_value -= 5
        topic.save()
    else:
        topic.final_value = 0
        topic.save()
    post_model = Post.objects.get(id=question.post_id)
    comment = Comment.objects.get(id=c_id)
    try:
        question_stream = QuestionStream.objects.get(modified_date=comment.created_date)
    except:
        question_stream = None
    comm = Comment.objects.filter(post=post_model)
    comment.delete()
    return HttpResponse(simplejson.dumps({"num_comments": len(comm)}),
                         mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def edit_question(request, q_id): # view for editing question.
    try:
        question = Question.objects.get(id=q_id)
    except:
        pass
    if request.method == "POST":
        try:
            title = request.POST.get('edit_ques')
        except:
            title = question.title
        try:
            topic = Topic.objects.get(topic=question.tags)
            topic.final_value += 5
            topic.save() 
            question.title = title
            question.updated_by = request.user.username
            question.save()
        except:
            pass
        return HttpResponseRedirect(os.path.join("/quora/question",
                        question.slug_tags, question.slug_title))
    else:
        return HttpResponseRedirect(os.path.join("/quora/question",
                         question.slug_tags, question.slug_title))


@csrf_exempt
@login_required(login_url='/')
def question_stream_delete(request, q_id): # view for deleting question_stream in home page.
    vars = {}
    delete_post = QuestionStream.objects.get(id=q_id)
    delete_post.delete()
    return HttpResponse(simplejson.dumps(vars),
                mimetype="application/json")
    
    
@csrf_exempt
@login_required(login_url='/')
def answer_stream_delete(request, q_id): # view for deleting answer_stream in home page. 
    vars = {}
    delete_post = AnswerStream.objects.get(id=q_id)
    delete_post.delete()
    return HttpResponse(simplejson.dumps(vars),
                mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def like(request, a_id):
    
    answer = Answer.objects.get(id=a_id)
    question = Question.objects.get(id=answer.title_id)
    topic = Topic.objects.get(topic=question.tags)
    topic.final_value += 5
    topic.save() 
    try:
        voteup = Like.objects.get(answer=answer, user=request.user)
        voteup.likes = 1
    except:
        voteup = Like(user=request.user, answer=answer, likes=1)
    voteup.save()
    like_objects = Like.objects.filter(answer_id=a_id, likes=1)
    liked_upto = answer.liked_by
    liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
    if liked_upto[0] == "":
        del liked_upto[0]
    liked_upto.insert(0,request.user.username)
    str_names = "  ,  ".join(liked_upto)
    answer.liked_by = str_names
    answer.save()    
    first_2_users = liked_upto[0:2]
    first_2_users_str = "  ,  ".join(first_2_users)
    return HttpResponse(simplejson.dumps({"liked_by": str_names,
             "liked": len(like_objects),"first_2_users_str":first_2_users_str,}), mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def unlike(request, a_id):
    answer = Answer.objects.get(id=a_id)
    question = Question.objects.get(id=answer.title_id)
    topic = Topic.objects.get(topic=question.tags)
    if topic.final_value >= 5:
        topic.final_value -= 5
        topic.save()
    else:
        topic.final_value = 0
        topic.save()
    try:
        votedown = Like.objects.get(answer=answer, user=request.user)
        votedown.likes = 0
    except:
        votedown = Like(user=request.user, answer=answer, likes=0)
    votedown.save()
    like_objects = Like.objects.filter(answer_id=a_id, likes=1)

    liked_upto = answer.liked_by
    liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]    
    del liked_upto[0]
    str_names = "  ,  ".join(liked_upto)
    answer.liked_by = str_names
    answer.save()    
    first_2_users = liked_upto[0:2]
    first_2_users_str = "  ,  ".join(first_2_users)   
    return HttpResponse(simplejson.dumps({"liked_by": str_names,
                 "liked": len(like_objects),"first_2_users_str":first_2_users_str,}), mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def comment_like(request, c_id):
    comment_model = Comment.objects.get(id=c_id)
    try:
        comment_like_model = Comment_likes.objects.get(comment_id=c_id,
                                             user=request.user)
        comment_like_model.likes = 1
    except:
        comment_like_model = Comment_likes(user=request.user,
                                        comment=comment_model,
                                        likes=1)
    comment_like_model.save()

    comment_likes = Comment_likes.objects.filter(comment_id=c_id, likes=1)
    first_2_users_str = ""
    str_names = ""

    liked_upto = comment_model.liked_by
    liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
    if liked_upto[0] == "":
        del liked_upto[0]
    liked_upto.insert(0,request.user.username)
    str_names = "  ,  ".join(liked_upto)
    comment_model.liked_by = str_names
    comment_model.save()    
    first_2_users = liked_upto[0:2]
    first_2_users_str = "  ,  ".join(first_2_users)

    return HttpResponse(simplejson.dumps({"liked_by": str_names,
            "liked": len(comment_likes) , "first_2_users_str":first_2_users_str}), mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def comment_unlike(request, c_id):
    comment = Comment.objects.get(id=c_id)
    try:
        comment_like_model = Comment_likes.objects.get(
                                comment_id=c_id, user=request.user)
        comment_like_model.likes = 0
    except:
        comment_like_model = Comment_likes(user=request.user,
                                        comment=comment,
                                        likes=0)
    comment_like_model.save()

    comment_likes = Comment_likes.objects.filter(comment_id=c_id, likes=1)
    first_2_users_str = ""
    str_names = ""

    liked_upto = comment.liked_by
    liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
    del liked_upto[0]
    str_names = "  ,  ".join(liked_upto)
    comment.liked_by = str_names
    comment.save()    
    first_2_users = liked_upto[0:2]
    first_2_users_str = "  ,  ".join(first_2_users) 
    
    return HttpResponse(simplejson.dumps({"liked_by": str_names,
            "liked": len(comment_likes) , "first_2_users_str":first_2_users_str}), mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def comment_answer_like(request, c_id):
    comment = Comment.objects.get(id=c_id)
    try:
        comment_like_model = Comment_likes.objects.get(comment_id=c_id,
                                     user=request.user)
        comment_like_model.likes = 1
    except:
        comment_like_model = Comment_likes(user=request.user,
                                        comment=comment,
                                        likes=1)
    comment_like_model.save()
    comment_likes = Comment_likes.objects.filter(comment_id=c_id, likes=1)
    list_user_names = []
    first_2_users_str = ""
    str_names = ""

    liked_upto = comment.liked_by
    liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
    if liked_upto[0] == "":
        del liked_upto[0]
    liked_upto.insert(0,request.user.username)
    str_names = "  ,  ".join(liked_upto)
    comment.liked_by = str_names
    comment.save()    
    first_2_users = liked_upto[0:2]
    first_2_users_str = "  ,  ".join(first_2_users)

    return HttpResponse(simplejson.dumps({"liked_by": str_names,"first_2_users_str":first_2_users_str,
             "liked": len(comment_likes)}), mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def comment_answer_unlike(request, c_id):
    comment = Comment.objects.get(id=c_id)
    try:
        comment_like_model = Comment_likes.objects.get(comment_id=c_id,
                                                        user=request.user)
        comment_like_model.likes = 0
    except:
        comment_like_model = Comment_likes(user=request.user,
                                        comment=comment,
                                        likes=0)
    comment_like_model.save()
    comment_likes = Comment_likes.objects.filter(comment_id=c_id, likes=1)
    list_user_names = []
    first_2_users_str = ""
    str_names = ""

    liked_upto = comment.liked_by
    liked_upto = [str(i) for i in liked_upto.strip('{}').split(',')]
    del liked_upto[0]

    str_names = "  ,  ".join(liked_upto)
    comment.liked_by = str_names
    comment.save()    
    first_2_users = liked_upto[0:2]
    first_2_users_str = "  ,  ".join(first_2_users) 

    return HttpResponse(simplejson.dumps({"liked_by": str_names,"first_2_users_str":first_2_users_str,
             "liked": len(comment_likes)}), mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def new_password(request):
    if request.method == "POST":
        username = request.POST.get('username')
        try:
            if username == "":
                val = "Please enter your email address in the Email box below, then click \"Forgot Password\"" 
                msg = "empty"  
                return HttpResponse(simplejson.dumps({"val": val,"msg":msg,}), mimetype="application/json") 
            user = User.objects.get(email = username)
            val = "Instructions on how to reset your password were sent to " + username
            msg = "sent"
            link = "http://127.0.0.1:8000/quora/fresh/"
            send_mail("RESET PASSWORD", link, "medicalcare.project@gmail.com",
                [user.email])
            return HttpResponse(simplejson.dumps({"val": val,"msg":msg,}), mimetype="application/json")
        except:
            val = "There isn't an account on record for the email address " + username
            msg = "not-exist"
            return HttpResponse(simplejson.dumps({"val": val,"msg":msg,}), mimetype="application/json")
    else:
        val = 'Please enter your email address in the Email box below, then click "Forgot Password"'
        msg = ""
        return HttpResponse(simplejson.dumps({"val": val,"msg":msg,}), mimetype="application/json") 


@csrf_exempt
@login_required(login_url='/')
def fresh_password(request):
    if request.method == "POST":
        form = NewPasswordForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['username']
            user = User.objects.get(email=email)
  
            user.set_password(str(form.cleaned_data['password']))
            user.save()
            return HttpResponseRedirect(reverse('views.home'))
        else:
            lform = form
            return render_to_response('quora/new.html', locals())
    else:
        form = NewPasswordForm()
        state = "Please enter your new password"
        return render_to_response('quora/new.html', locals())


@csrf_exempt
@login_required(login_url='/')
def create_topic(request):
    user = User.objects.get(id = request.user.id)
    try:
        profile = UserProfile.objects.get(user_id = request.user.id)
    except:
        pass
    if request.method == "POST":
        created_topic = request.POST.get('tag')
        if created_topic:
            try:
                new_topic = Topic.objects.get(topic=created_topic)
            except:
                new_topic = None
            if new_topic:
                new_topic.description=request.POST.get('about')
                new_topic.picture = request.FILES.get('pic')
                new_topic.save()
                print "with picture"
            else:
                new_topic = Topic.objects.create(
                           topic=request.POST.get('tag'),
                           description=request.POST.get('about'),
                           initial_value="0",
                           final_value="0",
                           )
                new_topic.picture = request.FILES.get('pic')
                new_topic.save()
                print "with picture"
            return HttpResponseRedirect('/quora/home/')
        else:
            return render_to_response('quora/topic.html',locals())    
    else:
        return render_to_response('quora/topic.html',locals()) 

@login_required(login_url='/')
def email_prefrences(request):

        user = User.objects.get(id = request.user.id)
        try:
            profile = UserProfile.objects.get(user_id = request.user.id)
        except:
            pass

        return render_to_response('quora/email.html',locals())  

@csrf_exempt
@login_required(login_url='/')
def user_details(request,u_id):
    user = User.objects.get(id = u_id)
    #print user.first_name + " "+user.last_name
    user_pro = UserProfile.objects.get(user = user)
    if user_pro.user_desc is None:
        user_pro.user_desc = ""
        user_pro.save()
    user_complete_name = user.first_name+" "+user.last_name
    #question_count = Question.objects.filter(user_id = u_id).count()
    #nswer_count = Answer.objects.filter(user_id = u_id).count()
    questions = Question.objects.filter(user_id = u_id)
    answers = Answer.objects.filter(user_id = u_id)
    #user_profile = UserProfile.objects.get(user_id = u_id)
    list_answer = []
    try:
        profile = UserProfile.objects.get(user_id = request.user.id)
    except:
        pass
    
    for answer in answers:
        temp_list_inside_list = []
        soup = BeautifulSoup(answer.description)
        for img in soup.findAll('img'):
            img['height'] = 100 
            img['width'] = 100
        small_img = soup.prettify()
        temp_list_inside_list.append(answer.title.title)        
        temp_list_inside_list.append(answer.title.tags)        
        temp_list_inside_list.append(small_img)
        temp_list_inside_list.append(answer.description)
        list_answer.append(temp_list_inside_list)        
        

    if request.method == 'POST':
        form = PhotoForm(request.POST, request.FILES)   
        if form.is_valid():
            #print "2"
            profile = UserProfile.objects.get(user_id = request.user)
            try:
                profile.profile_pic.delete()
            except:
                pass
            profile.profile_pic = request.FILES['profile_pic']
            profile.save()
            
            
            return render_to_response('quora/user_detail.html',locals())        
        else:
            #print "3"
            form= PhotoForm
        return render_to_response('quora/user_detail.html',locals())    
    else:
        #print "loading form"
        form = PhotoForm()
        #print "1"
        return render_to_response('quora/user_detail.html',locals()) 

    return render_to_response('quora/user_detail.html',locals()) 


@csrf_exempt
def add_user_desc(request,u_id):
    try:
        user = User.objects.get(id = u_id)
    except:
        pass
    first_name_user = request.POST.get('first_name_user')
    last_name_user = request.POST.get('last_name_user')
    user_description = request.POST.get('desc')
    
    try:
        user_pro = UserProfile.objects.get(user_id = u_id)
        user_pro.user_desc = user_description
        user_pro.save()
        user.first_name = first_name_user
        user.last_name = last_name_user
        user.save()
        
    except:
        user_pro = UserProfile(user_id = u_id, Email_id = user.email , user_desc = user_description)
        user_pro.save()
    user_name = user.first_name+" "+user.last_name       
    return HttpResponse(simplejson.dumps({'email_id':user_pro.Email_id,'user_desc':user_pro.user_desc , 'user_name':user_name,}), mimetype="application/json")


@csrf_exempt
@login_required(login_url='/')
def trending_topics(request):
    li = []
    topics = Topic.objects.all()
    sorting_list = {}
    for item in topics:
        value = item.final_value-item.initial_value
        sorting_list[item] = {"value":value}
        item.initial_value = item.final_value
        item.save()
    new_topics = sorted(sorting_list.keys(), key=lambda k: sorting_list[k]["value"], reverse=True)
    trend_topics = new_topics[:5]
    for item in trend_topics:
        dic = {}
        dic["topic"] = item.topic

        if item.picture:    
            dic["image"] = str(item.picture)    
        else:
            dic["image"] = "topic_pics/blank.jpg"
        li.append(dic)
    print li
    return HttpResponse(simplejson.dumps({'a' :li }), mimetype="application/json")
           


@csrf_exempt
@login_required(login_url='/')
def adding_full_detail_of_user(request,u_id):
    user_full_detail = request.POST.get('full_desc')
    user = User.objects.get(id = u_id)
    vars = {}
    try:
        user_pro = UserProfile.objects.get(user_id = u_id)
        user_pro.user_full_detail = user_full_detail
        user_pro.save()
    except:
        pass        
    return HttpResponse(simplejson.dumps({'user_detailed':user_pro.user_full_detail}), mimetype="application/json")

@csrf_exempt
@login_required(login_url='/')
def user_on_hover(request,u_id):
    print u_id
    user_pro = UserProfile.objects.get(user_id = u_id)
    
    if user_pro.user_full_detail is None:
        user_pro.user_full_detail = ""
        user_pro.save()
    return HttpResponse(simplejson.dumps({'user_name':user_pro.user.first_name+" "+user_pro.user.last_name,'user_desc':user_pro.user_desc,'user_full_detail':user_pro.user_full_detail,'user_pic':str(user_pro.profile_pic)}), mimetype="application/json")      
    
    

