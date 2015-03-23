from django.core.urlresolvers import reverse
from django.test.client import Client
from django.test import TestCase
from django.utils.importlib import import_module
from django.http import HttpRequest
from django.conf import settings
from quora.models import *
from accounts.models import *
import unittest
from django.test.client import RequestFactory
import datetime
import random
from quora import views

class QuoraTestCase(TestCase): #Login page
    
    def setUp(self):
        self.user = User.objects.create_user(
            'sanatan.nayak90@gmail.com',
            'sanatan.nayak90@gmail.com',
            'tarams'
        )

        self.userprofile = UserProfile.objects.create(user=self.user, user_desc="pilot", profile_pic="/home/sanatan/Desktop/s.jpeg", studied="Nothing",Email_id="sanatan.nayak90@gmail.com", address="bangalore")
        self.apost = Post.objects.create(post_type='A')
        self.qpost = Post.objects.create(post_type='Q')
        self.cpost = Post.objects.create(post_type='C')
        self.question = Question.objects.create(user=self.user, post=self.qpost, updated_by=self.user, tags="sanatan", title="what is sanatan", description="sop", created_date=datetime.datetime.now(), modified_date=datetime.datetime.now())
        self.topic = Topic.objects.create(topic="sanatan", description="what ra",initial_value=0, final_value=0)
        self.answer = Answer.objects.create(user=self.user, title=self.question ,post=self.apost,description="At my desk",vote=1,created_date=datetime.datetime.now(),liked_by="ranjan")
        self.comment = Comment.objects.create(user=self.user, post=self.cpost, comment="shutup", created_date=datetime.datetime.now(), liked_by="sanatan.nayak90@gmail.com")
        self.answer_stream = AnswerStream.objects.create(modified_by = self.user, answer = self.answer, operation= "A", modified_date=datetime.datetime.now())
        self.question_stream = QuestionStream.objects.create(modified_by = self.user, question = self.question, operation= "A", modified_date=datetime.datetime.now())
        self.client = Client()
        self.seq = User.objects.all()

                       
    def test_user(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        self.assertTrue(self.user in self.seq)
        self.assertRaises(ValueError)
        random.sample(self.seq,5)
    
    def test_login(self):
        response = self.client.get(reverse('views.home'))
        self.assertEqual(response.status_code,200)
        self.assertTemplateUsed(response, 'quora/home.html')    
        
    
    def test_scroll_home(self): # Home page
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.scroll_home'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'quora/home.html')

      
    def test_sorted_event_list(self):  # Sorted_event_list for the home page.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')

    
    def test_logout_view(self):  ## Logout view
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.logout_view'))
        self.assertRedirects(response, '/')
        self.assertEqual(response.status_code, 302)

    
    def test_setpass(self): # Set password After sign up through Gmail. 
        response = self.client.get(reverse('quora.views.setpass'), follow=True)
        self.assertRedirects(response,'/')
        response = self.client.post(reverse('quora.views.setpass'))
        self.assertRedirects(response,'/')
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.setpass'))
        self.assertEqual(response.status_code, 200)
        response = self.client.post(reverse('quora.views.setpass'))
        #self.assertRedirects(response,'/')
        self.assertTemplateUsed(response, 'setpassword.html')
    

    def test_saving_question(self): ## Adding Question view.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.saving_question'))
        self.assertEqual(response.status_code, 200)

    
    def test_question_description(self): 
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.question_description', kwargs={"tags":self.question.tags,"title":self.question.slug_title}))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'quora/question_detail.html')
        
        
    def test_user_settings(self): # user setting page view
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        #request = self.factory.post('/quora/user-settings/')
        #response = user_settings(request)
        #resp = self.client.post(reverse('quora.views.user_settings',kwargs={id: 1}))
        response = self.client.post('/quora/user-settings/')
        self.assertEqual(response.status_code, 200)


    def test_change_password(self): # change password in settings view
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.change_password'))
        self.assertEqual(response.status_code, 200)
        response = RequestFactory().get('/quora/change/')
        print response
        self.assertTemplateUsed(response, 'quora/settings.html')

    def test_answer_delete(self): # View for deleting answer in question_detail page.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.post(reverse('quora.views.answer_delete',kwargs={'a_id': 1}))
        self.assertEqual(response.status_code, 200)


    def test_all_unanswered_question(self): # view for all unanswered questions.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.all_unanswered_question'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'quora/unanswered_questions.html')



    def test_display_comments(self): # View for adding comments for answer.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.display_comments',kwargs={'a_id': 1}))
        self.assertEqual(response.status_code, 200)

    def test_comment_delete(self): #view for deleting answer comments.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.comment_delete',kwargs={'a_id': 1,'c_id':1}))
        self.assertEqual(response.status_code, 200)

    def test_auto_search(self): # view for search box options.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.auto_search'))
        self.assertEqual(response.status_code, 200)

    def test_question_topic_search(self): # view for topic and question list in add question and create topic form.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.question_topic_search'))
        self.assertEqual(response.status_code, 200)
        
    
    def test_search_results(self): # view for results of search box.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.post(reverse('quora.views.search_results'))
        self.assertRedirects(response, '/quora/home/')
        self.assertEqual(response.status_code, 302)
    

    def test_question_comment(self): # view for comment for question.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.question_comment', kwargs = {'q_id': 1} ) )
        self.assertEqual(response.status_code, 200)

    
    def test_search_topic(self): # view for searched topic in search box.
        self.client.login(username='sanatan.nayak90@gmail.com',password='tarams') 
        response = self.client.get(reverse('quora.views.search_topic',kwargs={'topic':'sanatan'}))
        self.assertEqual(response.status_code, 200)
    

    def test_question_comment_delete(self): # view for deleting question comments.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.question_comment_delete', kwargs = {'q_id': 1,'c_id':1} )    )
        self.assertEqual(response.status_code, 200)
    
    
    def test_edit_question(self): # view for editing question.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.post(reverse('quora.views.edit_question',kwargs={'q_id': 1}))
        self.assertEqual(response.status_code, 302)
        
    
    def test_question_stream_delete(self): # view for deleting question_stream in home page.
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.question_stream_delete',kwargs = {'q_id':1} ) )
        self.assertEqual(response.status_code, 200)
        
    
    def test_answer_stream_delete(self): # view for deleting answer_stream in home page. 
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.answer_stream_delete', kwargs = {'q_id': 1} ) )
        self.assertEqual(response.status_code, 200)
    
    
    def test_like(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.like',kwargs={'a_id': 1}))
        self.assertEqual(response.status_code, 200)

    
    def test_unlike(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.unlike',kwargs={'a_id': 1}))
        self.assertEqual(response.status_code, 200)
    
    
    def test_comment_like(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.comment_like',kwargs={'c_id': 1}))
        self.assertEqual(response.status_code, 200)
    
    def test_comment_unlike(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.comment_unlike',kwargs={'c_id': 1}))
        self.assertEqual(response.status_code, 200)
    
    
    def test_comment_answer_like(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.comment_answer_like',kwargs={'c_id': 1}))
        self.assertEqual(response.status_code, 200)
        
    
    def test_comment_answer_unlike(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.comment_answer_unlike',kwargs={'c_id': 1}))
        self.assertEqual(response.status_code, 200)
        
    
    def test_new_password(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.new_password'))
        self.assertEqual(response.status_code, 200)   
        
    
    def test_fresh_password(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.fresh_password'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'quora/new.html')
        
    
    def test_create_topic(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.create_topic'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'quora/topic.html')    
        
    
    def test_email_prefrences(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.email_prefrences'))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'quora/email.html') 
        
    
    def test_user_details(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.user_details',kwargs={'u_id': 1}))
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'quora/user_detail.html')

    
    def test_add_user_desc(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.add_user_desc',kwargs={'u_id': 1}))
        self.assertEqual(response.status_code, 200)
        
    
    def test_trending_topics(self):
        self.client.login(username='sanatan.nayak90@gmail.com', password='tarams')
        response = self.client.get(reverse('quora.views.trending_topics'))
        self.assertEqual(response.status_code, 200)
    
