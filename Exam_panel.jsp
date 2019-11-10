<%@page  import="java.sql.*" %>
<%@page import="checker.*"%>
<%@page import="oaapDao.*"%>

<!----------->
<!doctype html>
<html lang="en">
  <head>
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
   <script src="Exam_panel.js"></script>


<link rel="stylesheet" media="screen and (min-width:0px) and  (max-width: 767px)"  type="text/css" href="Exam_panel2.css" />
<link rel="stylesheet" media="screen and (min-width:768px) and (max-width : 1023px)" type="text/css" href="Exam_panel.css"/>
<link rel="stylesheet" media="screen and (min-width:1024px) and (max-width : 2000px)" type="text/css" href="Exam_panel3.css"/>
  

  </head>
  <body>
<%

long startTime = System.currentTimeMillis();




%>

<script>

timer();
function timer(){
var counter=0;
var timeleft=125;


function convertSeconds(s){
var min=Math.floor(s/60);
var sec=s%60;
if(sec<10){
sec="0"+sec;
if(min<1){
 document.getElementById("timer").style['color']="#F60100";

}
}

return min+":"+sec;
}


setInterval(function timeIt(){
	var rem=timeleft-counter;
	var time=convertSeconds(rem);
	
document.getElementById("timer").innerHTML=time;
counter++;

if(counter==timeleft){
counter=0;


  //  document.getElementById("timer").submit();
   document.getElementById("timer_form").submit();

	//document.getElementById("examinationpanel2").action = "examinationpanel2.jsp";
//window.location.href="http://localhost:8091/OnlineExamination_JSP/examinationpanel2.jsp";

}
},1000);
}

</script>



<%


 QuestionAnswerJavaBean qajb=new QuestionAnswerJavaBean();
oaapUserDao oud=new oaapUserDao();
  increment increment=new increment();

    String question_counter="";
    String mock_test_sub=request.getParameter("mock_test");
    String status=(String)session.getAttribute("login");
	 String sub_track="";
	 String count_easy=null;
	 String count_medium=null;
	 String count_hard=null;
	 String sub_question_counter=null;
	 String correct_count=null;
	 String difficulty=null; 
	int sno=0;
  
   
if(status==null)
{
%>
<jsp:forward page="Home.jsp"/>

<%
}

 else if(status.equals("login")){

  session.setAttribute("subject",mock_test_sub);			
    question_counter= (String)session.getAttribute("question_counter");
      sub_question_counter= (String)session.getAttribute("sub_question_counter");
        difficulty= (String)session.getAttribute("difficulty");
          correct_count = (String)session.getAttribute("correct_question");

if(Integer.parseInt(question_counter)<=15){

CheckDifficulty check=new CheckDifficulty();
  System.out.println("county"+sub_question_counter);
  int level=check.difficultyCheck(Integer.parseInt(sub_question_counter), Integer.parseInt(correct_count), Integer.parseInt(difficulty));

if(level==1)
{	

  sub_track="ooa_"+mock_test_sub+"_easy";
    count_easy=(String)session.getAttribute("count_easy");
	System.out.println(sub_track+count_easy);
     qajb=oud.oaapQuestionFetch(mock_test_sub,"easy",Integer.parseInt(count_easy)+1);
       session.setAttribute("count_easy",increment.inc(Integer.parseInt(count_easy))+"");
	   	System.out.println(sub_track+increment.inc(Integer.parseInt(count_easy)));

}

else if(level==2)
{
  sub_track="ooa_"+mock_test_sub+"_medium";
   count_medium=(String)session.getAttribute("count_medium");
    qajb=oud.oaapQuestionFetch(mock_test_sub,"medium",Integer.parseInt(count_medium)+1);
    session.setAttribute("count_medium",increment.inc(Integer.parseInt(count_medium))+"");
}

else if(level==3)
{
  sub_track="ooa_"+mock_test_sub+"_hard";
    count_hard=(String)session.getAttribute("count_hard");
     qajb=oud.oaapQuestionFetch(mock_test_sub,"hard",Integer.parseInt(count_hard)+1);
        session.setAttribute("count_hard",increment.inc(Integer.parseInt(count_hard))+"");
  }

int buffer= Integer.parseInt(sub_question_counter);

if(buffer==3)
{
 session.setAttribute("sub_question_counter","1");
   session.setAttribute("correct_question","0");
 } 
 
 else{
int temp=increment.inc(buffer);
  session.setAttribute("sub_question_counter",temp+"");
}


if(qajb.getStatus()==1)
{
  String answer=qajb.getAnswer();
    session.setAttribute("answer",answer);
}

 session.setAttribute("question_counter",""+increment.inc(Integer.parseInt(question_counter)));
    session.setAttribute("difficulty",""+level);
}
else{



%>

<jsp:forward page="summary.jsp"/>

<%
}
}
else{
%>
<jsp:forward page="Home.jsp"/>

<%
 }
%>


  


  <div class="container-fluid" style="">

<div class="row" id="" style="">
    <div class="row" id="exam_panel_header" style="">
      <div class="col" id="exam_panel_headerL" style="">
       <div class="row">
        <div class="col" id="header_username" style=""><%=(String)session.getAttribute("username")%></div>
         <div class="col" id="header_subject" style=""><%=(String)session.getAttribute("subject")%></div>
          
       </div>
	 </div>

      <div class="col" id="exam_panel_headerR" style="">
          <div class="row">
              <div class="col" style="">
                  <p id="timer"  style=""></p>

              </div>
		 
		         <form action="summary.jsp">
            <div class="col" id="header_endexam" style="">
                  <button class="btn btn-primary" style="">End Exam</button>
               </div>
			   </form>
 
 </div>
</div>

<!--------------------ACCURACY METER---------------------

<div class="row" id="progressive_struc"><!--Progressbar Structure
  <div class="row" id="progressbar"><!--Progressbar Dynamic
     <p id="level">Novice</p><!--Difficulty Level-
     <p id="percentcount">0</p><--Accuracy Percentage
  </div>
</div>
-->
</div>
</div>
      

<!--<button onclick="myprogressivebar()">Click</button>
<button  onclick="easy_inc()">Easy</button>
<button  onclick="medium_inc()">Medium</button>
<button  onclick="hard_inc()">Hard</button>
<!--------------------ACCURACY METER--------------------->



<div class="container" id="exam_panel_exam_header" style="">
 <h4 style="font-family:Dosis;color:black"><%=sub_track%></h4> 
<div class="row"  >
   
	<div class="row" style="position:relative;">
        <div class="col">

              <form  action="aptitude_check.jsp" method="post"  id="timer_form">
                <div class="row" id="question_card" style="">
  
				   
				   <div class="col" id="question_div" style="">
            <p id="question_text"> 
            Q<%=Integer.parseInt(question_counter)%>:<%=qajb.getQuestion()%> </div>
                </p>

               </div>

              <div class="row" id="option_header" style="">
                <div class="col-md-6 col-12" id="option" style=" ">

                  <div class="radio">
  <label><input type="radio" name="answer_option" value="A">  <%=qajb.getA()%></label>
</div>

        

                 </div>
                <div class="col-md-6 col-12"  id="option" style=" ">

                  <div class="radio">
  <label><input type="radio" name="answer_option" value="B"><%=qajb.getB()%></label>
</div>
                  
                 </div>
  
             </div>
                
                <div class="row" id="option_header" style="">
                <div class="col-md-6 col-12" id="option" style="">
                  
                 <div class="radio">
                 <label><input type="radio" name="answer_option" value="C"> <%=qajb.getC()%></label>
                    </div>

                </div>

                <div class="col-md-6 col-12" id="option" style=" ">
                   
                   <div class="radio">
                      <label><input type="radio" name="answer_option" value="D"><%=qajb.getD()%></label> 
                        </div>
                 </div>
  
             </div>
           <input type="hidden" name="mock_test" value=<%=mock_test_sub%>>

		    <div class="row" id="exam_panel_buttons">
          <div class="col-12" id="submit_button_div">
             <button class="btn btn-success" type="submit" id="submit_button">Next</button>
             </div>

          </form>
			
        <!-- <div class="col-6" id="skip_button_div">  -->
          
             <!---  <button class="btn btn-danger" id="skip_button">Skip</button>-->
        <!--  </div>-->

                  
      
            </div>

        </div> 
         
      
      </div>
        </div>    
</div>
</div>    
</div>
<%


%>

  </body>


</html>