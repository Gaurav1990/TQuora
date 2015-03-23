    $(document).ready(function(){

    
        
        $(".more").hide();
        console.log("hide more");
        $(".full-data").hide();
       // display_text();
        $(".more").click(function(){
            $(this).prev().hide();
            $(this).next().show();
            $(this).hide();
        });
        
        display_text();
        
        
        
        var ajax_call = function() {
        $.ajax({             //Ajax_call for Trending topics
           type: "POST",
           url: "/quora/trending-topics/",
           datatype:"Text",
           success: function(response) {
            trend = "";
            //console.log(response.a);
            for(i=0;i<response.a.length;i++) {
                console.log(response.a[i]['image']);
                picture = response.a[i]['image']
                trend = trend + "<p><img class='trending-topics-image' height='25' width = '25' src='/media/"+picture+"'>" + "<a href='/quora/topic-search/"+response.a[i]['topic']+"'>"+response.a[i]['topic']+"</a></p>"; 
            }
            $("#trend").html('');
            $("#trend").html(trend);
            },
           error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });   //end of trending topics.
         }
        var interval = 1000 * 60 * 5;
        setInterval(ajax_call, interval);
        ajax_call();



        $('.unlike').hide();
        var h = $('#question_id').height();
        var w = $('#question_id').width();
        console.log("this is height");
        console.log(h);
        h = h+10;
                
        $('#question-textarea').css({'width':w +'px', 'min-height' : h + 'px' ,'min-width':'710px'});
        

        $('#unlike_question').hide();
        $('.question-comment-div').hide();
        $('.answer-comment-div').hide();
        $("#editor").hide();
        $("#question_id").show();   
        $("#question-comment").click(function(e){
              $('.question-comment-div').toggle();
          
          
                  
        });
        
        
        $("#edit_button").click(function(e){
            $("#editor").toggle();
            $("#update_button").show();
            $("#question_id").hide();
            $("#edit_button").hide();
            
         });

         $("#cancel_button").click(function(e){
            $("#question_id").show();
            $("#editor").hide();
            $("#edit_button").show();
         }); 
        
         
    });
var more_data =function(current_obj){  
     current_obj.prev().hide();
     current_obj.next().show();
     current_obj.hide()
    };








var display_text= function() {
    
   $('.full-data').each(function(i){
       
        
        var str= $(this).html();
        var n=str.search("img");
        max_length = $(this).text().length;
      
        display = $(this).css("display");
      
             if(max_length >200 || n != -1 ){
           
           
               $(this).prev().show();
               $(this).prev().prev().css({"text-overflow":"ellipsis","white-space":"nowrap","overflow":"hidden"})
            }
      });
};    

/*
var ajax_call = function() {
      $.ajax({             //Ajax_call for Trending topics
        type: "POST",
        url: "/quora/trending-topics/",
        datatype:"Text",
        success: function(response) {
          trend = "";
          console.log(response.a);
          for(i=0;i<response.a.length;i++) {
            console.log(response.a[i]['topic']);
            picture = response.a[i]['image']
            trend = trend + "<p><img class='trending-topics-image' src='/media/"+picture+"'>" + "<a href='/quora/topic-search/"+response.a[i]['topic']+"'>"+response.a[i]['topic']+"</a></p>"; 
          }
          $("#trend").html('');
          $("#trend").html(trend);
        },
        error: function(rs, e) {
          alert(rs.responseText);
        }
      });   //end of trending topics.
    }
    var interval = 1000 * 60 * 5;
    setInterval(ajax_call, interval);

var more_data =function(current_obj){  
     current_obj.prev().hide();
     current_obj.next().show();
     current_obj.hide()
    };

var display_text= function() {
    
   $('.full-data').each(function(i){
        max_length = $(this).text().length;
        display = $(this).css("display");
       console.log("checkingg");
             if(max_length >100){
               $(this).prev().show();
               $(this).prev().prev().css({"text-overflow":"ellipsis","white-space":"nowrap","overflow":"hidden"})
            }
      });
};
*/
function like_toggle(obj) {
        $(obj).next().show();
        $(obj).hide();
}

function unlike_toggle(obj) {
        $(obj).prev().show();
        $(obj).hide();
}

editable = true;

$(document).on(
{
    mouseenter: function() 
    {
       
     if (editable)
     {
        current_ele = $(this);
        u_id = current_ele.find(".on_hover").prev().val();
       
        editable = false;
        $.ajax({
                    type: "POST",
                    url: "/quora/user_detail_on_hover/"+u_id+ "/",
                    datatype:"Text",
                    success: function(response)
                    {
                            
                            str1 = "<div class='sub'><ul class='sub-options'><div class='div11'><a href='/quora/user_detail/"+u_id+"'>";

                            if(response.user_pic == "")
                            {
                                str2 = "<img src='/media/profile_imgs/man.png/' width='25' height = '25'>";
                            }
                            else
                            {
                                str2 = "<img src='/media/"+response.user_pic+"/' width='25' height = '25' >";
                            }


                            str3 = "</a></div><div class='div22'><a href='/quora/user_detail/"+u_id+"'>"+response.user_name+"</a><br> <span class='user_full_desc'>"+response.user_full_detail+"</span></div></ul></div>";

                            str = str1+str2+str3;
                            console.log(current_ele);
                            current_ele.append(str);
                           
//current_ele.on('mouseenter', function() {
    current_ele.find(".sub").slideToggle(400);
//});

                            
                    },
                    error: function(rs, e) 
                    {
                        alert(rs.responseText);
                    }
        });
    }//End if editable 



    },
    mouseleave: function()
    {
        
        if (!editable) {
            editable = true;
            
            $(".menu").find(".sub").remove();
        }
    }
}
, '.menu');

function comment_answer_like_method(obj,comment_id)
{

   $.ajax({
                type: "POST",
                url: "/quora/comment/answer/like" + "/" + comment_id + "/",
                //data: {'slug': $(this).attr('name'), 'csrfmiddlewaretoken': '{{csrf_token}}' },
                datatype:"Text",
                success: function(response) {
                    
                like_toggle(obj);
                $(obj).parent().parent().children().eq(1).html(response.liked);
                
                $(obj).parent().parent().children().eq(2).html(response.first_2_users_str);


                display = $(obj).parent().parent().children().eq(4).css("display");
                if (response.liked > 2 && display == "none")
                {
                    $(obj).parent().parent().children().eq(3).show();
                       
                }
                
                if (response.liked > 2)
                {
                $(obj).parent().parent().children().eq(4).html(response.liked_by);

                }
                   
                if (response.liked == 3)
                {
                       $(obj).parent().parent().children().eq(2).hide();
                         $(obj).parent().parent().children().eq(3).hide();
                       $(obj).parent().parent().children().eq(4).show();   
                         
                }




                       $("#comment_id").hide();
                          $('#id-ans-'+comment_id+'').hide();
                        $('#id-ans-'+comment_id+'').next().show();
                },
                error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });


}



function comment_answer_unlike_method(obj,comment_id)
{

   $.ajax({
                type: "POST",
                url: "/quora/comment/answer/unlike" + "/" + comment_id + "/",
                //data: {'slug': $(this).attr('name'), 'csrfmiddlewaretoken': '{{csrf_token}}' },
                datatype:"Text",
                success: function(response) {
                unlike_toggle(obj);
                $(obj).parent().parent().children().eq(1).html(response.liked);
                
                $(obj).parent().parent().children().eq(2).html(response.first_2_users_str);


                display = $(obj).parent().parent().children().eq(4).css("display");
                if (response.liked > 2 && display == "none")
                {
                    $(obj).parent().parent().children().eq(3).show();
                       
                }

                if (response.liked > 2)
                {
                
                    $(obj).parent().parent().children().eq(4).html(response.liked_by);
                }
                if (response.liked == 2)
                {
                          $(obj).parent().parent().children().eq(2).show();
                          $(obj).parent().parent().children().eq(3).hide();
                          $(obj).parent().parent().children().eq(4).hide();
                }
                
                $('#id-ans-'+comment_id+'').show();                
                $('#id-ans-'+comment_id+'').next().hide();
                $("#comment_id").hide();
            },
        error: function(rs, e)
                {
                    alert(rs.responseText);
                }
          });


}


function comment_like_method(obj,comment_id)
{

   $.ajax({
                type: "POST",
                url: "/quora/comment/like"+"/"+comment_id + "/" ,
                //data: {'slug': $(this).attr('name'), 'csrfmiddlewaretoken': '{{csrf_token}}' },
                datatype:"Text",
                success: function(response) {
                like_toggle(obj);
                $(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().html(response.liked);
                
                $(obj).parent().parent().prev().prev().prev().prev().prev().prev().html(response.first_2_users_str);
                   

                display = $(obj).parent().parent().prev().prev().prev().prev().css("display");
                if (response.liked > 2 && display == "none")
                {
                    $(obj).parent().parent().prev().prev().prev().prev().prev().show();
                       
                }
                if (response.liked > 2)
                {
                         $(obj).parent().parent().prev().prev().prev().prev().html(response.liked_by);

                }
                   
                if (response.liked == 3)
                {
                       $(obj).parent().parent().prev().prev().prev().prev().prev().prev().hide();
                        $(obj).parent().parent().prev().prev().prev().prev().prev().hide();
                       $(obj).parent().parent().prev().prev().prev().prev().show();   
                         
                      
                       
                }
                
                $('#id-'+comment_id+'').hide();
                $('#id-'+comment_id+'').next().show();
                $("#comment_id").hide();
          
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });
}


function comment_unlike_method(obj,comment_id)
{

   $.ajax({
                type: "POST",
                url: "/quora/comment/unlike"+"/"+comment_id + "/" ,
                //data: {'slug': $(this).attr('name'), 'csrfmiddlewaretoken': '{{csrf_token}}' },
                datatype:"Text",
                success: function(response) {
                unlike_toggle(obj);    
                $('#id-'+comment_id+'').show();
                $('#id-'+comment_id+'').next().hide();   

                  $(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().html(response.liked);
                
                $(obj).parent().parent().prev().prev().prev().prev().prev().prev().html(response.first_2_users_str);

                display = $(obj).parent().parent().prev().prev().prev().prev().css("display");
                if (response.liked > 2 && display == "none")
                {
                    $(obj).parent().parent().prev().prev().prev().prev().prev().show();
                       
                }

                if (response.liked > 2)
                {
                
                    $(obj).parent().parent().prev().prev().prev().prev().html(response.liked_by);
                }


                display = $(obj).parent().prev().prev().prev().css("display");

                if (response.liked == 2)
                {
                        $(obj).parent().parent().prev().prev().prev().prev().prev().prev().show();     
                        $(obj).parent().parent().prev().prev().prev().prev().prev().hide();
                        $(obj).parent().parent().prev().prev().prev().prev().hide();
                }
                
                $("#comment_id").hide();
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });


}

function like_method(obj,ans_id)
{
    $.ajax({
                type: "POST",
                url: "/quora/like"+"/"+ans_id + "/" ,
                datatype:"json",
                success: function(response) {
                
                like_toggle(obj);
                $(obj).parent().prev().prev().prev().prev().prev().prev().html(response.liked);
                $(obj).parent().prev().prev().prev().prev().prev().html(response.first_2_users_str);
                //$(obj).prev().parent().prev().prev().html(response.liked_by);
                 display = $(obj).parent().prev().prev().prev().css("display");
                if (response.liked > 2)
                {
                    $(obj).parent().prev().prev().prev().html(response.liked_by); 
                       
                }

             if (response.liked > 2 && display == "none")
                {
                         
                         $(obj).parent().prev().prev().prev().prev().show();
                }
                   
                if (response.liked == 3)
                {
                      $(obj).parent().prev().prev().prev().prev().prev().hide();
                      $(obj).parent().prev().prev().prev().show();   
                      $(obj).parent().prev().prev().prev().prev().hide();   
                       
                }

                
                
                //$(obj).parent().prev().prev().val(response.liked);
                $('#id-ans-ajax-'+ans_id+'').next().show();
                $('#id-ans-ajax-'+ans_id+'').hide();
                $("#ans_id").hide();
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });
}


function unlike_method(obj,ans_id)
{
    $.ajax({
                type: "POST",
                url: "/quora/unlike"+"/"+ans_id + "/",
        
                datatype:"Text",
                success: function(response) {
                console.log(response);
                console.log($(obj).parent().prev().prev().prev().prev());
                unlike_toggle(obj);
                $(obj).parent().prev().prev().prev().prev().prev().prev().html(response.liked);
                $(obj).parent().prev().prev().prev().prev().prev().html(response.first_2_users_str);
                if (response.liked > 2)
                {
                        $(obj).parent().prev().prev().prev().html(response.liked_by); 
                }


                display = $(obj).parent().prev().prev().prev().css("display");
                if (response.liked > 2 && display == "none")
                {
                   $(obj).parent().prev().prev().prev().prev().show();
                }
                if (response.liked == 2)
                {
                   $(obj).parent().prev().prev().prev().hide();
                    $(obj).parent().prev().prev().prev().prev().hide();
                   $(obj).parent().prev().prev().prev().prev().prev().show()
                }
                   
          
                
                
                //$(obj).parent().prev().prev().val(response.liked);
                $('#id-ans-ajax-'+ans_id+'').show();
                $('#id-ans-ajax-'+ans_id+'').next().hide();
                $("#ans_id").hide();
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });
}

function answer_comment_show(obj)
{
//console.log(obj);
 $(obj).parent().next().toggle();
}
function question_comment_show(obj)
{
console.log(obj);
 $(obj).next().toggle();
}

function comment_question_show(obj,q_id,u_id)
{

$.ajax({
                type: "POST",
                url: "/quora/comment-question"+"/"+q_id + "/",
                data: {'ques_comment': $(obj).prev().val()},
                datatype:"Text",
                success: function(response) {
                  



                str1 = "";
                if(response.profile_img == "")
                {
                    str1 = "<img src='/media/profile_imgs/man.png/' width='25' height = '25'>"+response.comment_by;
                }
                else
                {
                    str1 = "<img  src='/media/profile_imgs/"+response.profile_img+"/' height='25' width='25'/>"+response.comment_by;
                }



                    if (response.len != 0)
                    {
                
                str = "<span><hr><div class='menu div2'><input type='hidden' name='"+u_id+"' value='"+u_id+"'><a class='usernames on_hover' href='/quora/user_detail/"+u_id+"/'><img  src='/media/profile_imgs/"+response.profile_img+"/' height='25' width='25'/>"+response.comment_by+"</a></div>&nbsp;&nbsp;&nbsp;<span class='voters'>0</span>vote(s) given by<span class='voters'></span><span></span><span></span><span></span><span></span><p>"+response.comment+"</p><p><span><button class = 'like submit-links' id = 'id-"+response.comment_like_id+"' onclick= 'comment_like_method(this,"+response.comment_like_id+");' >Like</button><button class = 'unlike submit-links' id = 'unlike_question' onclick='comment_unlike_method(this,"+response.comment_like_id+");'>Unlike</button><input onclick = 'comment_question_delete(this,"+q_id+","+response.comment_like_id+");' class='submit-links input-submit'  type='submit' value='Delete'>"+response.created_date+"</span></p> </span>"
                


                $(obj).parent().next().prepend(str);
                $(obj).prev().val("");
                $('#id-'+response.comment_like_id+'').next().hide();
                $(obj).parent().parent().prev().children().html(response.num_comments);
                
            $("#ans_id").hide();
                    }
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });

}


function comment_answer_show(obj,a_id,u_id)
{

$.ajax({
                type: "POST",
                url: "/quora/comment"+"/"+a_id + "/",
                data: {'answer_comment': $(obj).prev().val()},
                datatype:"Text",
                success: function(response) {
              
                if (response.len != 0)
                 {
                str = "<span><hr><p><span class='usernames'><div class='menu div2'><input type='hidden' name='"+u_id+"' value='"+u_id+"'><a class='usernames on_hover' href=/quora/user_detail/"+u_id+"'><img  src='/media/profile_imgs/"+response.profile_img+"/' height='25' width='25'/>"+response.comment_by+"</a></div></span><span class='voters'>0</span> vote(s) given by<span class = 'voters'></span></p><p><span>"+response.comment+"</span></p><p>  <button class = 'like submit-links' id = 'id-ans-"+response.comment_like_id+"' onclick='comment_answer_like_method(this,"+response.comment_like_id+");'>Like</button><button class = 'unlike submit-links' onclick='comment_answer_unlike_method(this,"+response.comment_like_id+");'>Unlike</button><input onclick = 'comment_answer_delete(this,"+a_id+","+response.comment_like_id+");' class='submit-links input-submit' type='submit' value='Delete'>"+response.created_date+"</span></p></span>"
                $(obj).parent().next().prepend(str);
                $(obj).prev().val("");
                $('#id-ans-'+response.comment_like_id+'').next().hide();
                $(obj).parent().parent().prev().children().children().html(response.num_comments);
                 $('#id-ans-'+response.comment_like_id+'').next().hide();
            $("#ans_id").hide();
}            
},
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });

}

function comment_question_delete(obj,q_id,c_id)
{


$.ajax({
                type: "POST",
                url: "/quora/question-delete/comment"+"/"+q_id + "/" +c_id + "/",
                //data: {'answer_comment': $(obj).prev().val()},
                datatype:"Text",
                success: function(response) {
                $(obj).parent().parent().parent().parent().parent().prev().children().html(response.num_comments);
                $(obj).parent().parent().parent().parent().remove();            
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });


}

function comment_answer_delete(obj,a_id,c_id)
{

$.ajax({
                type: "POST",
                url: "/quora/comment/delete"+"/"+a_id + "/" +c_id + "/",
                datatype:"Text",
                success: function(response) {
               $(obj).parent().parent().parent().parent().prev().children().children().html(response.num_comments);
               $(obj).parent().parent().remove();

            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });


}

function delete_answer(obj,a_id)
{

$.ajax({
                type: "POST",
                url: "/quora/answer/delete"+"/"+a_id + "/",
                datatype:"Text",
                success: function(response) {
                      $(obj).parent().parent().parent().prev().prev().prev().html(response.num_answers);
                     
                      $(obj).parent().parent().remove();
                    
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });

}

function add_answer(obj,tag,title,q_id,u_id)
{
//comet();
console.log("inside add_answer ajx");
//console.log("/quora/question"+"/"+tag+"/"+title+"/");
console.log($(obj).prev().children().next().children().html());
$.ajax({
                type: "POST",
                url: "/quora/question"+"/"+tag+"/"+title+"/",
                data: {'answer': $(obj).prev().children().next().children().html()},
                datatype:"Text",
                success: function(response) {
                console.log("success");
        if(response.len != 0){
            /*
                    str = "<span><hr><div class='menu div2'><input type='hidden' name='"+u_id+"' value='"+u_id+"'>
                    <a class='usernames on_hover' href='/quora/user_detail/"+u_id+"'>"+response.f_name+"</a></div>
                    <span  class='votes_likes'>0</span>vote(s) given by<span class='usernames voters half-data'></span>
                    <span class='more_button'></span><span class= 'usernames voters full_str'></span><span class='input_hidden_type'>
                    </span><div class='demo'>"+response.desc+"</div><p>
                    <button class='submit-links answer-comment' id = 'ans_com' onclick='answer_comment_show(this);'><span>0</span>
                     +Comment</button><input onclick = 'delete_answer(this,"+response.a_id+");' 
                     class='submit-links input-submit'  type='submit' value='Delete'><button class='like submit-links' 
                     onclick='like_method(this,"+response.a_id+");' id = 'id-ans-ajax-"+response.a_id+"'>Like</button>
                     <button class='unlike submit-links' onclick='unlike_method(this,"+response.a_id+");' 
                     id = 'id-unlike-"+response.a_id+"'>UnLike</button>"+response.answer_created_date+"</p>
                     <div class='answer-comment-div'><p>"+response.f_name+"<input type='text' name = 'answer_comment'>
                     <input onclick = 'comment_answer_show(this,"+response.a_id+","+u_id+");' 
                     type='submit' class='submit-links input-submit' value='comment'></p><span></span></div></span>"
                      
*/
console.log("this is img:"+response.profile_img);
if(response.profile_img == "")
{
    str11 = "<img class='pic'  src='/media/profile_imgs/man.png/'' height='25' width='25'/>";
}
else
{
    str11 = "<img class='pic'  src='/media/profile_imgs/"+response.profile_img+"/' height='25' width='25'/>";
}

str = "<span><hr><div class='menu div2'><input type='hidden' name='"+u_id+"' value='"+u_id+"'><a class='usernames on_hover' href='/quora/user_detail/"+u_id+"'>"+response.f_name+"</a></div>"+str11+"<span  class='votes_likes voters'>0</span>vote(s) given by<span class='usernames voters half-data'></span><span class='more_button'></span><span class= 'usernames voters full_str full-data'></span><span class='input_hidden_type'></span><div class='demo'>"+response.desc+"</div><p><button class='submit-links answer-comment' id = 'ans_com' onclick='answer_comment_show(this);'><span>0</span>+Comment</button><input onclick = 'delete_answer(this,"+response.a_id+");' class='submit-links input-submit'  type='submit' value='Delete'><button class='like submit-links' onclick='like_method(this,"+response.a_id+");' id = 'id-ans-ajax-"+response.a_id+"'>Like</button><button class='unlike submit-links' onclick='unlike_method(this,"+response.a_id+");' id = 'id-unlike-"+response.a_id+"'>UnLike</button>"+response.answer_created_date+"</p><div class='answer-comment-div'><p>"+response.f_name+"<input type='text' name = 'answer_comment'><input onclick = 'comment_answer_show(this,"+response.a_id+","+u_id+");' type='submit' class='submit-links input-submit' value='comment'></p><span></span></div></span>";
                       $(obj).parent().prev().prev().html(response.num_answers);
                        $(obj).parent().next().prepend(str);
                        
                       
                        $('#id-ans-ajax-'+response.a_id+'').next().hide();
                        $('.answer-comment-div').hide();
                        $(obj).prev().children().next().children().html("");
        }  },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });



}

function home_like_method(obj,a_id)
{
console.log("entry")
 $.ajax({
                type: "POST",
                url: "/quora/like"+"/"+a_id + "/" ,
                datatype:"json",
                success: function(response) {
                console.log("success");
                $(obj).parent().parent().children().eq(2).children().eq(0).children().eq(0).html(response.liked);
                like_toggle(obj);
                $("#ans_id").hide();
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });

}

function home_unlike_method(obj,a_id)
{

  console.log("unlike rtlyjryojoirtyhoirjb9n4mjoibu5hni9njbouhnbuy8onhyutio");
  $.ajax({
                type: "POST",
                url: "/quora/unlike"+"/"+a_id + "/",
                datatype:"json",
                success: function(response) {                     
                $(obj).parent().parent().children().eq(2).children().eq(0).children().eq(0).html(response.liked);
                unlike_toggle(obj);
                $("#ans_id").hide();
            },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });


}
function home_page_post_delete(obj){
    console.log("home_page_delete");
    
    $("#dialog").dialog({
        modal: true,
        autoOpen: false
    });
    var id = $(obj).attr('id');
    var url = $(obj).attr('url');
    $("#dialog").dialog('option', 'buttons', 
        {"Delete": function() {
            $.ajax({
                url :url,
                data: {'id': id},
                success: function(response) {
                      $(obj).parent().parent().parent().remove();
                }  
                   
            });
            $(this).dialog("close");       
            },
        
        "Cancel": function() {
            $(this).dialog("close");
        }
        
    });
    $("#dialog").dialog("open");
    return false;

}

function getData(obj,val)
        {
        console.log("home page");
        $.ajax({
                type: "POST",
                url: "/quora/live-search/",
                data: {'value': $(obj).val()},
                datatype:"Text",
                success: function(response) {
         console.log(response.question_list);
 
             var availableTags = response.question_list;


        $("#search").autocomplete({
              source: availableTags
        });
        },
        error: function(rs, e) 
                {
                    alert(rs.responseText);
                }
          });


        }



