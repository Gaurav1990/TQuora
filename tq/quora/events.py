
from django.shortcuts import get_object_or_404
from django.utils.html import strip_tags
from django_socketio import events
import datetime
from quora import views
from quora.models import Question, Post, Answer, Comment, Like, Comment_likes, AnswerStream, QuestionStream, Topic , UserProfile
from BeautifulSoup import BeautifulSoup

timestamp_original = datetime.datetime.now()
print "abhishek"


@events.on_message()
def message(request, socket, context, message):
    """
    Event handler for a room receiving a message. First validates a
    joining user's name and sends them the list of users.
    """
    print "event message"
    global timestamp_original
    new_list = []
    item_list = []
    timestamp_recent = datetime.datetime.now() 
    q_stream = QuestionStream.objects.filter(modified_date__gte=timestamp_original)
    a_stream = AnswerStream.objects.filter(modified_date__gte=timestamp_original)
    new_list.extend(q_stream)
    new_list.extend(a_stream)
    new_length = len(new_list)
    for item in new_list:
        if item in a_stream:
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
   
            userprofile_desc = UserProfile.objects.get(user_id = answer.user_id)
            username = userprofile_desc.user_name
            desc = userprofile_desc.user_desc
            user_img = userprofile_desc.profile_pic
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
            item_list.append(d)
            joined = {"action": "join", "name": item_list}
            socket.send_and_broadcast(joined)

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
                
            if pic:
                image = pic
            else:
                image = None
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
                username = userprofile_desc.user_name
                desc = userprofile_desc.user_desc
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
            item_list.append(d)
            joined = {"action": "join", "name": item_list}
            socket.send(joined)
    timestamp_original = timestamp_recent
    print "increase comet server"          


@events.on_finish()
def finish(request, socket, context):
    """
    Event handler for a socket session ending in a room. Broadcast
    the user leaving and delete them from the DB.
    """
    pass