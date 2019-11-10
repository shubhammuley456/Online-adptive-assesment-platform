<!---
Viewport is the browser window size. 1vw = 1% of viewport width. If the viewport is 50cm wide, 1vw is 0.5cm. 1 vw=1/2 cm 1px=0.0625 em
1 c 
total width:1290px
total height: 1022px

name:width-400px 31vw 1px=0.0775vw
         height-50px             3.875
         font-size:40px          3.1

-->
<%@page import="oaapDao.*"%>

<!doctype html>
<html lang="en">
  <head>
  <title>Online Adaptive Assessment Platform</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no,maximum-scale=1, user-scalable=0">

<!--Jquery CDN(Content Delivery Networks) links-->


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"><!--Google Icons Link-->

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
     

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" >

        <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" ></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" ></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" ><!--Link for Icons-->

     <link href="https://fonts.googleapis.com/css?family=Dosis" rel="stylesheet">
    
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


   <!--    <link rel="stylesheet" type="text/css" href="Home.css">-->
    <!---JQUERY LINK-->

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

   <link rel="stylesheet" media="screen and (min-width:0px) and  (max-width: 767px)"  type="text/css" href="Home2.css" />

  <link rel="stylesheet" media="screen and (min-width:768px) " type="text/css" href="Home.css"/>

  <script src="Home.js"></script>  
  <!--<link rel="stylesheet" media="screen and (min-width:1024px)" type="text/css" href="Home3.css"/>-->

  
<!-------------------------------------REGISTER--------VALIDATION----------------------->
      
<%

String login_status=""+(String)session.getAttribute("login_status");
String logout_status=""+(String)session.getAttribute("logout_status");
String reg_status=""+(String)session.getAttribute("reg_status");
String username=""+(String)session.getAttribute("username");


%>

 <input type="hidden"  id="login_status" name="login_status" value=<%=login_status%>>
 <input type="hidden"  id="logout_status" name="login_status" value=<%=logout_status%>>
<input type="hidden"  id="reg_status"  value=<%=reg_status%>>
 <input type="hidden"  id="login_status_username"  value=<%=username%>>

 <script>

login_status=document.getElementById("login_status");
logout_status=document.getElementById("logout_status");
reg_status=document.getElementById("reg_status");
var username=document.getElementById("login_status_username");


if(login_status.value=='true'){
alert('Login Successful');
document.getElementById('login').innerHTML=""+username.value.toUpperCase();
login_status.value='false';
}


else if(login_status.value=='false'){
alert('Login Failed');
}

if(logout_status.value=='true'){
alert('You are successfully logged out');
logout_status.value='false';

}

if(reg_status.value=="true"){
alert("Succesfully Registered");

}




 

console.log(login_status);






   $(document).ready(function(){
    $("#login").click(function(){
        $("#myModal").modal();
    });
 });


   $(document).ready(function(){

         var navbar_height=$('nav').outerHeight();
    
    $(".nav-link").click(function(e){
            
        var linkHref=$(this).attr('href');
       console.log(navbar_height);
       
      
        $('html,body').animate({scrollTop:$(linkHref).offset().top -navbar_height},1500);

  e.preventDefault();

    });


    $("#get_started").click(function(e){
         
        $('html,body').animate({scrollTop:$(link_modules).offset().top -navbar_height},1500);

  e.preventDefault();

    });

 
    

 });
 </script>

<%
oaapUserDao oud=new oaapUserDao();

 
  session.setAttribute("question_counter","1");//question counter counts the number upto 15
  session.setAttribute("count_easy","0");  //Easy table counter
  session.setAttribute("count_medium","0");//Medium Table counter
  session.setAttribute("count_hard","0");//Hard table counter
  session.setAttribute("correct_count_easy","0");//Easy questions correct
  session.setAttribute("correct_count_medium","0");//Medium questions correct
  session.setAttribute("correct_count_hard","0");//Hard questions correct
  session.setAttribute("difficulty","1");//Difficulty of subject
  session.setAttribute("question_count","0");//
   session.setAttribute("sub_question_counter","0");
  session.setAttribute("mark","0");//Marks
  session.setAttribute("correct_question","0");//correct_questions

float accuracy_score_aptitude=0;
float accuracy_score_reasoning=0;
float accuracy_score_technical=0;
float accuracy_score_java=0;

if(login_status!=null){
String uid=(String)session.getAttribute("uid");
 accuracy_score_aptitude=oud.oaapFetchSubjectAccuracy("aptitude",uid);
 accuracy_score_reasoning=oud.oaapFetchSubjectAccuracy("reasoning",uid);
 accuracy_score_java=oud.oaapFetchSubjectAccuracy("java",uid);
 accuracy_score_technical=oud.oaapFetchSubjectAccuracy("technical",uid);
}



 
 %>


  </head>
  <body style="">
 
 <div class="spinner-border text-primary" id="loader"></div>
 <!--first row_navbar-->

<!------------N--A--V---I---G--A--T--I---O---N_____B---A-----R------------------------------------------->

<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="opacity:20%;background-color:#17181F;border-radius: 2px;  ">

  <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target"><!--Button is activated when browser's page is resized to small. All the items  
are binded into this navbar-toggler-->
  <span class="navbar-toggler-icon"></span>
  
</button>  

<div class="collapse navbar-collapse" id="collapse_target">


 <span class="navbar-brand "><i class="fab fa-asymmetrik"></i></span>
  <span class="navbar-text" style="   white-space: nowrap;font-size: 1em;font-family: Dosis;color: white;">Adaptive Assessment Platform </span>
      
      <ul class="navbar-nav" style="margin-left: 13vw;display_block">
       	<li class="nav-item" >
         <a class="nav-link" id="nav_link_text" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;" href="">Home</a>	

       
       </li>

      
     <li class="nav-item">
 
 <a class="nav-link" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;" href="#link_contact_us">Contact</a>	

     <!-- <a class="nav-link" id="login" data-toggle="modal" >Login/Register</a>-->
     </li> 

      <li class="nav-item">
         <a class="nav-link" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;" href="#link_project_desc">Project Description</a>
      </li>

	       <li class="nav-item">
        <a class="nav-link" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;" href="#link_how _it_works">How it works</a>
      </li>
    

      <li class="nav-item dropdown">
      <a class="nav-link dropdown_toggle" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;" href="#" data-toggle="dropdown" data-target="#dropdown_target2">Notification</a>

             <div class="dropdown-menu bg-light" aria-labelledby="dropdown_target2">
              <a>New Modules Uploaded</a>
              <br>
			  <%
			      
			 %>
              <a>Your Aptitude score is <%=accuracy_score_aptitude %></a><br>
              <a>Your Resoning score is <%=accuracy_score_reasoning %></a><br>
              <a>Your Technical score is <%=accuracy_score_technical%></a><br>
              <a>Your Java score is <%=accuracy_score_java%></a><br>

              </div>
        </li>

     


     <li class="nav-item">
      <a  class="nav-link" id="login" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" href="#"> Sign in </a>
     <!-- <a class="nav-link" id="login" data-toggle="modal" >Login/Register</a>-->
     </li>

          <li class="nav-item">
      <a  class="nav-link" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;"  href="logout.jsp">Sign out</a>
     <!-- <a class="nav-link" id="login" data-toggle="modal" >Login/Register</a>-->
     </li>


        
      </ul>

</nav>
<!------------N--A--V---I---G--A--T--I---O---N_____B---A-----R------------------------------------------->

<!------------------------------M ---- O --- - D-------A -----L--------------------------------->
 
  <!------------------MODAL FOR SIGN IN ------------------------>
<div class="modal fade" id="myModal"  style="">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#bababa;text-align: center">
        <h4 class="modal-title" style="text-align: center;">Login</h4>
<a href="#" data-dismiss="modal"><i class="fa fa-close"></i></a>
        
      </div>

      <div class="modal-body" style="">
<!-------------------------------------LOGIN------------------------------------>


  
<!----------------------------LOGIN LOGIC-------------------------------------------->
       <form action="login.jsp" method="post" name="signin" onsubmit="return login_validation()">
        <label id="username_label" style=""><span class="fas fa-user "></span> Username</label><!--Username-->
		<br>
          <input type="text" name="username"  id="username" placeholder="Enter Username" style="">

                 <label id="username_error" style=""></label>

  
            <hr><!--------------New Line-------------->
              <label id="password_label"><span class="far fa-eye"></span> Password</label><!--password-->
			  <br>
               <input type="password" name="password" id="password" placeholder="Enter password">
               <label id="password_error" style=""></label>
             
             <hr>
                    <button class="btn btn-primary" onclick="signin()" style="margin-left:2vw;width: 18vw" >Login</button><a href="ForgotPassword.jsp" id="forgot_password"style="margin-left: 1vw;font-size: .8em;font-family: Dosis;color:blue;">Forgot Password?</a>
                    
	       </form>

           
       </div>
      

      <div class="modal-footer" style="background-color:#bababa">
	 
	       <label style="font-family:Dosis;font-size:0.8em;margin-right:12vw;">New User?</label>
         <hr>
       <button class="btn btn-success" id="register" data-toggle="modal" data-target="#myModal2" data-backdrop="static" data-keyboard="false" style="" >Sign up</button>
     
      </div>

      
      
    </div>
  </div>
</div>
 <!------------------MODAL FOR SIGN IN ------------------------------>

  
  <!-------------------------MODAL FOR Registration ------------------------------------>
<div class="modal fade" id="myModal2"  role="dialog" style="">
  <div class="modal-dialog modal-dialog-centered" style="">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#bababa;text-align: center">
        <h4 class="modal-title">Sign up</h4>
        <a href="#" data-dismiss="modal"><i class="fa fa-close"></i></a>

        
      </div>

      <div class="modal-body" style="" >
	  <form name="registrationform" action="register_user.jsp" method="post" onsubmit="return registration_validation()">
        <label id="username_label"><i class="fas fa-user "></i>&nbspName</label><!--Name-->
		<br>
           <input type="text" id="username" name="register_name" placeholder="Enter Name" onfocus="r_name()" onkeydown="r_name()" onkeyup="r_name()"><span id="val_name"></span>

                     <label id="name_error" style=""></label>
                     
                     <i class="" id="name_tick"></i>

                           <hr>
    
          <label id="username_label"> <i class="fa fa-envelope"></i>&nbspEmail-id</label><!------email-id/------>
		  <br>
       <input type="text"  id="username" name="register_email" placeholder="Enter email-id" onfocus="mail()" onkeydown="mail()" onkeyup="mail()">
                                 <label id="email_error" style=""></label>
                                 <i class="" id="email_tick"></i>
                           <hr>
                
            <label id="username_label"><span class="fa fa-phone"></span>&nbspMobile no.</label><!------Phone number------>
            <br>
				<input type="text" name="register_phone"  id="username" placeholder="Enter Mobile Number" onfocus="r_phoneno()" onkeydown="r_phoneno()" onkeyup="r_phoneno()" onchange="r_phoneno()"><span id="val_phoneno" ></span>
                        <label id="phoneno_error" style=""></label>
                            <i class="" id="phone_tick"></i>
                            <hr>
              
               <label id="username_label"><span class="fas fa-user "></span> &nbspUsername</label><!------Username------>
			   <br>
                  <input type="text" id="username" name="register_username"  placeholder="Enter Username"  onfocus="r_username()" onkeydown="r_username()" onkeyup="r_username()" onchange="r_username()"><span id="val_username"></span>
                                      <label id="username_error2" style=""></label>
                            <i class="" id="username2_tick"></i>
                             <hr>

                  <label id="username_label"><span class="far fa-eye"></span>&nbspPassword</label><!------Password------>
				  <br><input type="password"  id="password" name="register_password"   placeholder="Enter Password" onfocus="r_password()" onkeydown="r_password()" onkeyup="r_password()"><span id="val_password"></span>
                             <label id="password_error2" style=""></label>
                             <i class="" id="password2_tick"></i>
      

      </div>
      
      <div class="modal-footer" style="background-color:#bababa">

     <button type="submit" style="margin-left:-15vw" class="btn btn-primary" >Sign Up</button>
      </form>  
      </div>
      
      
    </div>
  </div>
</div>
<!-------------------------MODAL FOR Registration -------------------------->
<!-----------------------------------M ---- O --- - D-------A -----L------------------------------------------>



<!----------------start------------R------O-------W----------1--------------------------------------------------->

<div class="container-fluid" style="background: url('sample.jpg') no-repeat fixed center;width:100%">
	<div class="row" style="" >

    	  <!--First row_image-->"
  <div class="col-12" id="row1" style="">

<h1 id="website_title" style="" >ONLINE ADAPTIVE ASSESSMENT PLATFORM</h1>
  	
<button class="btn btn-danger" id="get_started" style="">Get Started</button>  
  </div>
    
   
</div>
<!---------------end---------------R------O-------W----------1--------------------------------------------------->



<!-------------start------------------R------O-------W----------2--------------------------------------------------->
 <div class="row" id="link_modules" style=""> <!--second row-->
  <div class="col" id="modules_body" style="">
<h1 id="mock_title" style="">Mock Test Modules</h1>
<hr style="background-color:red">      

<!-----------------------------------------CAROUSEL------------------------------------------------->


<div id="carousel_slide" class="carousel slide" data-ride="carousel" style="">

  <!-- Indicators -->
  <ul class="carousel-indicators" id="carousel_indicators" style="">
    <li data-target="#carousel_slide" data-slide-to="0" class="active"></li>
    <li data-target="#carousel_slide" data-slide-to="1"></li>
      </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">

	<div class="carousel-item active">
<!----------------------------- C----A------R-------D-----1------------------------------------->

<div class="card" id="card_mock_module1">
 
  <h1 class="card-title" id="card_title" style="">Aptitude</h1> 

  <img style="" id="card-mock-img" class="card-img-top"  src="https://fi.ge.pgstatic.net/articles/processed/1443012669.1efe9004671444e39aef3c2d694c190b.jpg"  alt="Image" >

   <div class="card-block" id="card_block" style="">
    
   <p class="card-text" id="subject_accuracy" style="color:blue">Subject Accuracy: <%=accuracy_score_aptitude%>%</p> 
   <p class="card-text" id="card_catg" style="">Weigtage:3 Marks / Question</p>
   <p class="card-text" id="card_catg" style="">Minimum Score: 15 Marks</p>
   <p class="card-text" id="card_catg" style="">Maximum Score:  45 Marks</p>
   <p class="card-text" id="card_catg" style="">Duration: 2 Min / Question</p>


   </div>
<hr>
<form action="Exam_panel.jsp" method="post">
   <div class="card-block" id="card_footer">
   	<input type="hidden" name="mock_test" value="aptitude">
   <button type="submit" class="btn btn-success" id="button_begin">Begin</button>
  
   </div>
</form>

</div>

<!------------------------------------ C----A------R-------D-----1------------------------------------->
<!------------------>

<!------------------->


<!-------------------------------------C----A------R-------D-----2------------------------------------->

<div class="card" id="card_mock_module2" style="" >
  <h1 class="card-title"  id="card_title" style="">Reasoning</h1>
   <img style="" id="card-mock-img" class="card-img-top"  src="https://fi.ge.pgstatic.net/articles/processed/1443012669.1efe9004671444e39aef3c2d694c190b.jpg"  alt="Image" >

   <div class="card-block" id="card_block" >
    
   
    
   <p class="card-text" id="subject_accuracy" style="color:blue">Subject Accuracy: <%=accuracy_score_reasoning%>%</p> 
   <p class="card-text" id="card_catg" style="">Weigtage:3 Marks / Question</p>
   <p class="card-text" id="card_catg" style="">Minimum Score: 15 Marks</p>
   <p class="card-text" id="card_catg" style="">Maximum Score:  45 Marks</p>
   <p class="card-text" id="card_catg" style="">Duration: 2 Min / Question</p>


   </div>
<hr>
<form action="Exam_panel.jsp" >
   <div class="card-block" id="card_footer">
   	<input type="hidden" name="mock_test" value="reasoning">
 <button type="submit" class="btn btn-success" id="button_begin" >Begin</button>
 

   </div>
</form>

</div>
 
<!-------------------------------------C----A------R-------D-----2------------------------------------->


<!-------------------------------------C----A------R-------D-----3------------------------------------->

<div class="card" id="card_mock_module3" style="">
  <h1 class="card-title"  id="card_title" style="">Technical</h1>
   <img style="" id="card-mock-img" class="card-img-top"  src="https://fi.ge.pgstatic.net/articles/processed/1443012669.1efe9004671444e39aef3c2d694c190b.jpg"  alt="Image" >

   <div class="card-block"  id="card_block">
    
    
   <p class="card-text" id="subject_accuracy" style="color:blue">Subject Accuracy: <%=accuracy_score_technical%>%</p> 
   <p class="card-text" id="card_catg" style="">Weigtage:3 Marks / Question</p>
   <p class="card-text" id="card_catg" style="">Minimum Score: 15 Marks</p>
   <p class="card-text" id="card_catg" style="">Maximum Score:  45 Marks</p>
   <p class="card-text" id="card_catg" style="">Duration: 2 Min / Question</p>

   </div>
<hr>
<form action="Exam_panel.jsp" >
   <div class="card-block" id="card_footer">
   	<input type="hidden" name="mock_test" value="technical">
   <button type="submit" class="btn btn-success" id="button_begin">Begin</button>
 

   </div>
</form>

</div>
<!-------------------------------------C----A------R-------D-----3------------------------------------->	
	</div>
  
	
	<div class="carousel-item">
     
<!-------------------------------------C----A------R-------D-----4-------------------------------------->

  <div class="card" id="card_mock_module1" style="">
  <h1 class="card-title" id="card_title" style="">Java</h1>
   <img style="" id="card-mock-img" class="card-img-top"  src="https://fi.ge.pgstatic.net/articles/processed/1443012669.1efe9004671444e39aef3c2d694c190b.jpg" alt="Image" >

   <div class="card-block" id="card_block" >
    
    
   <p class="card-text" id="subject_accuracy" style="color:blue">Subject Accuracy: <%=accuracy_score_java%>%</p> 
   <p class="card-text" id="card_catg" style="">Weigtage:3 Marks / Question</p>
   <p class="card-text" id="card_catg" style="">Minimum Score: 15 Marks</p>
   <p class="card-text" id="card_catg" style="">Maximum Score:  45 Marks</p>
   <p class="card-text" id="card_catg" style="">Duration: 2 Min / Question</p>

   </div>
<hr>
<form action="Exam_panel.jsp" method="post">
   <div class="card-block" id="card_footer">
   	<input type="hidden" name="mock_test" value="java">
  <button type="submit" class="btn btn-success" id="button_begin">Begin</button>
   

   </div>
</form>

</div>




</div>
    
	
  </div>


<!--------------------- Left and right controls -------------->
  <a class="carousel-control-prev" href="#carousel_slide" data-slide="prev" style="margin-top: 4.875vw;">
    <span class="	fas fa-angle-left"  style="color:black"></span><!--carousel-control-prev-icon-->
  </a>
  <a class="carousel-control-next" href="#carousel_slide" data-slide="next"
  style="margin-top: 4.875vw;">
    <span class="fas fa-angle-right" style="color:black"></span><!--carousel-control-next-icon-->
  </a>
   <!--------------------- Left and right controls -------------->
  

</div>


<!--------------------------------------CAROUSEL---------------------------------------------------->

<!--===========================C-----A------R-------D------S===========================================-->

  </div>
  </div>
<!------------------end---------------R------O-------W----------2--------------------------------------------------->



<!----------------start----------R------O-------W----------3--------------------------------------------------
div class="row"> <!--third row-
  <div class="col-lg-6" style="background-color:#66A5AD;height:200px;text-align:center;color: white;font-size: 50px ">Row third:</div>
    <div class="col-lg-6" style="background-color:#003B46;height:200px "></div>
  </div>
-----------------end---------------R------O-------W----------3--------------------------------------------------->



<!---------------------start-----------R------O-------W----------4--------------------------------------------------->
<div class="row" id="link_project_desc"> <!--second row-->
  <div class="col" id="proj_desc_col" style="" >

<br>
<br>

<!--<div class="col" style="max-width:100%;height: 38.75vw;border 0.2vw solid #65A5AD;">-->
  <h1 class="card-title" id="proj_desc_title" style=""    >Project Description</h1>
   
   <div class="card-block">
       
<p class="card-text" id="project_desc" style=""  >Aspirants/Students can be assessed on different fields using this website. Fields can be Reasoning, Aptitude, Technical MCQ, Coding etc. This will be an online platform with questions at different levels (Difficulty).  Candidate would start at assessment with a medium difficulty question and depending on its response, the platform should decide the next level of questions to be shown (level would increase or decrease as per response). Each question would be assigned a weightage and time duration.
</p>
 
   </div>



  </div>
  </div>
<!---------------------end------------R------O-------W----------4--------------------------------------------------->

<!---------------------start-----------R------O-------W----------4--------------------------------------------------->
<div class="row" id="link_how_it_works"> <!--second row-->
  <div class="col" id="how_works_col"  style="" >

<br>
<br>

<!--<div class="" style="max-width:100%;height: 38.75vw;border 0.2vw solid #65A5AD;">-->
  <h1 class="card-title" id="how_works_title"  style="">How it Works</h1>
   
   <div class="card-block">
<blockquote><p class="card-text" id="how_works_desc" style="">Aspirants/Students can be assessed on different fields using this website. Fields can be Reasoning, Aptitude, Technical MCQ, Coding etc. This will be an online platform with questions at different levels (Difficulty).  Candidate would start at assessment with a medium difficulty question and depending on its response, the platform should decide the next level of questions to be shown (level would increase or decrease as per response). Each question would be assigned a weightage and time duration.
</p></blockquote>
 
   </div>

<!--</div>-->



  </div>
  </div>
<!---------------------end------------R------O-------W----------4--------------------------------------------------->






  <!-------------------start-----------R------O-------W----------5--------------------------------------------------->
   <footer>
   <div class="row" style="" id="link_contact_us"> <!--second row-->
  <div class="col" id="contact_us_col" style="" >
<br>
<br>

<!--<div class="" style="border 1vw solid white;max-width:100%;max-height: inherit;box-sizing:border-box;border 0.2vw solid #65A5AD; "><!---max height:inherit,box-sizing:border-box;-->
  <h1 class="card-title"  id="contact_us_title" style="">Contact Us</h1>
   <br>
   <br>
   <div class="row"style="width:100%">
 <div class="col" style="width:50%">
    
<form action="queries.jsp">
  <label class="card-text"  id="contact_us_name" style="" >Name &nbsp&nbsp&nbsp</label> 

    <input type="text" name="contact_name" id="contact_us_name_input" style="">
  
  <br>
  
  <label class="card-text" id="contact_us_email"  style="" >Email &nbsp&nbsp&nbsp</label> 

    <input type="text" name="contact_email" id="contact_us_email_input" style="">

 <hr>
     <div class="card-block">

    </div>
   
   	</div>

    <br>
   <br>
 <div class="col">

  <textarea id="contact_us_textarea" type="text" name="contact_message" style="" placeholder="Have any Queries, Suggestion or anything else. Let us know..." ></textarea>
  <button type="submit" class="btn btn-success" id="contact_us_submit" style="">Submit</button>
  </form>
   
   </div>
</div>







<!--</div>-->



  </div>
  </div>

<footer>
   <!----------------------end-----------R------O-------W----------5--------------------------------------------------->


</div>

</div> 



  </body>
</html>