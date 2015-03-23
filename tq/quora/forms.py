from quora.models import Question, Answer, Topic
from django import forms
from django.forms import ModelForm


class AddQuestionForm(ModelForm):
    class Meta:
        model = Question
        exclude = ('updated_by', 'user', 'post', 'created_date',
                   'modified_date', 'modified_by')


class AddAnswerForm(forms.Form):
    description=forms.CharField(widget=forms.Textarea(attrs={'class':'answer-form','rows':'5'}))


class NewPasswordForm(forms.Form):

    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)
    
class TopicForm(forms.Form):
	tag = forms.CharField(max_length=100)
	desc = forms.CharField(max_length=200)
	pic = forms.FileField()


class PhotoForm(forms.Form):

    profile_pic = forms.FileField()
