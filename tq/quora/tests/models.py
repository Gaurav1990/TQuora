from django.test import TestCase
from quora.models import UserProfile

class UserProfileTestCase(TestCase):
    fixtures = ['test_data.json']
    
    def setUp(self):
        self.user = User.objects.create_user('ranjan',
                                             'ranjan.prabhu@tarams.com', 'prabhu')
        self.post = UserProfile.objects.create(
                user=self.user,
                user_desc="Test1",
                user_name="Test2",
                profile_pic="Test3",
                studied="Test4",
                Email_id="test5@tarams.com"
                address="Test6")
                
        self.c = Client()

     def test_post_creation(self):
        """
        Tests that we can create a Post
        """
        self.assertEqual(self.post.user_desc, "Test1")
        self.assertEqual(self.post.user, self.user)

    def test_user_can_read(self):
        """
        Tests that a user is allowed to read.
        """
        self.c.login(username='ranjan', password='prabhu')
        #response = self.c.get('/news/get_post/1/')
        self.assertEqual(response.status_code, 200)
        self.assertNotEqual(response.content, '{}')






'''
class UserProfile(models.Model):
    user = models.ForeignKey(User, unique = True)
    user_desc = models.CharField(max_length=1000)
    user_name = models.CharField(max_length=1000)
    profile_pic = models.FileField(upload_to='profile_imgs')
    studied = models.CharField(max_length=1000)
    Email_id = models.EmailField()  # to add another email id 
    address = models.TextField()

class Post(models.Model):
    post_type = models.CharField(max_length=1)
    

class Topic(models.Model):
	topic = models.CharField(max_length=50)
	description = models.CharField(max_length=200, blank=True)
	picture = models.FileField(upload_to="topic_pics")
	initial_value = models.IntegerField(blank=True)
	final_value = models.IntegerField(blank=True)

class Question(models.Model):
    user = models.ForeignKey(User)
    post = models.ForeignKey(Post)
    updated_by = models.EmailField()
    tags = models.CharField(max_length=50)
    slug_tags = models.SlugField(max_length=255)
    title = models.CharField(max_length=200)
    slug_title = models.SlugField(max_length=255, unique= True)
    description = models.TextField()
    created_date = models.DateTimeField(auto_now_add=True)
    modified_date = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return "%s %s" % (self.tags, self.title)

    def save(self, *args, **kwargs):
        self.slug_tags = slugify(self.tags)
        self.slug_title = slugify(self.title)
        super(Question, self).save(*args, **kwargs)

class Answer(models.Model):
    user = models.ForeignKey(User)
    title = models.ForeignKey(Question)
    post = models.ForeignKey(Post)
    description = models.TextField()
    vote = models.BooleanField()
    created_date = models.DateTimeField(auto_now_add=True)
    image = models.FileField(upload_to="answer_pics", blank=True)
    liked_by = models.CharField(max_length=2000)

class Comment(models.Model):
    user = models.ForeignKey(User)
    post = models.ForeignKey(Post)
    comment = models.TextField()
    created_date = models.DateTimeField(auto_now_add=True)
    liked_by = models.CharField(max_length=2000)


class Like(models.Model):
    user = models.ForeignKey(User)
    answer = models.ForeignKey(Answer)
    likes = models.IntegerField()

class Comment_likes(models.Model):
    user = models.ForeignKey(User)
    comment = models.ForeignKey(Comment)
    likes = models.IntegerField()
    

class Follow(models.Model):
	follow = models.ForeignKey(User, null=True, related_name="follow_user")
	follower = models.ForeignKey(User, null=True, related_name="follower_user")


class AnswerStream(models.Model):
	modified_by = models.ForeignKey(User)
	answer = models.ForeignKey(Answer)
	operation = models.CharField(max_length='1')
	modified_date = models.DateTimeField(auto_now_add=True)
	

class QuestionStream(models.Model):
	modified_by = models.ForeignKey(User)
	question = models.ForeignKey(Question)
	operation = models.CharField(max_length='1')
	modified_date = models.DateTimeField(auto_now_add=True)

'''

	
