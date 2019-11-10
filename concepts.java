   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no,maximum-scale=1, user-scalable=0">

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

  $(document).ready(function(){

         var navbar_height=$('nav').outerHeight();
    
    $(".nav-link").click(function(e){
            
        var linkHref=$(this).attr('href');
       console.log(navbar_height);
       
      
        $('html,body').animate({scrollTop:$(linkHref).offset().top -navbar_height},1500);

  e.preventDefault();

    });



  session.setAttribute("question_counter","1");//question counter counts the number upto 15
  session.setAttribute("count_easy","0");  //Easy table counter
  session.setAttribute("count_medium","0");//Medium Table counter
  session.setAttribute("count_hard","0");//Hard table counter
  session.setAttribute("correct_count_easy","0");//Easy questions correct
  session.setAttribute("correct_count_medium","0");//Medium questions correct
  session.setAttribute("correct_count_hard","0");//Hard questions correct
  session.setAttribute("difficulty","1");//Difficulty of subject
  session.setAttribute("question_count","0");//
  session.setAttribute("mark","0");//Marks
  session.setAttribute("correct_question","0");//correct_questions


<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="opacity:20%;background-color:#17181F;border-radius: 2px;  ">

  <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target"><!--Button is activated when browser's page is resized to small. All the items  
are binded into this navbar-toggler-->
  <span class="navbar-toggler-icon"></span>
  
</button>  

<div class="collapse navbar-collapse" id="collapse_target">

</div>

	<span class="navbar-brand "><i class="fab fa-asymmetrik"></i></span>
  <span class="navbar-text" style="   white-space: nowrap;font-size: 1em;font-family: Dosis;color: white;">Adaptive 

    <ul class="navbar-nav" style="margin-left: 13vw;display_block">
       	<li class="nav-item" >
         <a class="nav-link" id="nav_link_text" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;" href="">Home</a>	


	 <li class="nav-item">
      <a  class="nav-link" id="login" style=" white-space: nowrap;font-size:0.9em;font-family: Dosis;color: white;" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" href="#"> Sign in </a>
     <!-- <a class="nav-link" id="login" data-toggle="modal" >Login/Register</a>-->
     </li>


<div class="modal fade" id="myModal"  style="">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#bababa;text-align: center">
        <h4 class="modal-title" style="text-align: center;">Login</h4>
<a href="#" data-dismiss="modal"><i class="fa fa-close"></i></a>
        
      </div>

      <div class="modal-body" style="">
<!-------------------------------------LOGIN------------------------------------>

           
       </div>
      

      <div class="modal-footer" style="background-color:#bababa">
	 
	       
     
      </div>

      
      
    </div>
  </div>
</div>
 


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


