<%@page  import="java.sql.*" %>
<%@page  import="oaapDao.*" %>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no,maximum-scale=1, user-scalable=0">

<!--Jquery CDN(Content Delivery Networks) links-->

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"><!--Google Icons Link-->

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script><!---JQUERY LINK-->

    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script><!---JQUERY LINK-->
     

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"><!--Link for Icons-->

<link href="https://fonts.googleapis.com/css?family=Dosis" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="summary.css">

   <script src="summary.js"></script>
 
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
 
 //$(window).on('load',function(){
   //     $('#subject_accuracy_modal').modal('show');
    //});
</script>

</head>
<body>
<%

oaapUserDao oud=new oaapUserDao();
String uid=(String)session.getAttribute("uid");

float correct_count_easy=Float.valueOf((String)session.getAttribute("correct_count_easy"));
float correct_count_medium=Float.valueOf((String)session.getAttribute("correct_count_medium"));
float correct_count_hard=Float.valueOf((String)session.getAttribute("correct_count_hard"));

String count_easy=(String)session.getAttribute("count_easy");
System.out.println(count_easy);
String count_medium=(String)session.getAttribute("count_medium");
System.out.println(count_medium);
String count_hard=(String)session.getAttribute("count_hard");
System.out.println(count_hard);

float notattempted=15-(correct_count_easy+correct_count_medium+correct_count_hard);

double percentile=(Double.valueOf((String)session.getAttribute("mark"))/45.0)*100.0;
String result="";

float accuracy_score=(float)(correct_count_easy*1.0+correct_count_medium*2.0+correct_count_hard*4.0);
accuracy_score =(float)((accuracy_score/45.0)*95.0);

accuracy_score=(accuracy_score+oud.oaapFetchSubjectAccuracy((String)session.getAttribute("subject"),uid))/2;

session.setAttribute("subject_accuracy",""+accuracy_score);

oud.updateStats((String)session.getAttribute("subject"),uid,accuracy_score);



if(percentile>=90.0&&percentile<=100.0){
result="Outstanding";
}
else if(percentile>=80.0&&percentile<90.0){
result="Excellent";
}
else if(percentile>=70.0&&percentile<80.0){
result="Very Good";
}
else if(percentile>=60.0&&percentile<70.0){
result="Good";
}
else if(percentile>=50.0&&percentile<60.0){
result="Fair";
}
else if(percentile>=40.0&&percentile<50.0){
result="Average";
}
else if(percentile>=30.0&&percentile<40.0){
result="Pass";
}
else if(percentile<30.0){
result="Fail";
}

%>
     
<div class="container" style="">



<div class="row"><!---MAIN DIV-->
           <div class="col"  id="main_header">
        
				<h1 style="text-align:center;padding-right:30vw;" id="main_title">S U M M A R Y</h1>
            </div>
        </div>
    
	<div class="row">
<table class="table table-hover">
	
<tbody>

  
      <tr>
        <td>Name</td>
        <td><%= (String)session.getAttribute("name")%></td>
       
      </tr>
    
	<tr>
        <td>Subject</td>
        <td><%= (String)session.getAttribute("subject")%></td>
       
      </tr>

    <tr>
        <td>Correct</td>
        <td><%=(int)(correct_count_easy+correct_count_medium+correct_count_hard)%></td>
       
      </tr>
         
		 <tr>
        <td>Incorrect</td>
        <td><%=15-(int)(correct_count_easy+correct_count_medium+correct_count_hard)%></td>
       
      </tr>

          <tr>
        <td>Not Attempted</td>
        <td><%=(int)notattempted%></td>
       
      </tr>

<tr>
        <td>Easy Question Solved</td>
        <td><%=count_easy%></td>
       
      </tr>

	  <tr>
        <td>Medium Question Solved</td>
        <td><%=count_medium%></td>
       
      </tr>

	  <tr>
        <td>Hard Question Solved</td>
        <td><%=count_hard%></td>
       
      </tr>

      <tr>
        <td>Percentile</td>
        <td><%=percentile%>%</td>
       
      </tr>

	    <tr>
        <td>Remarks</td>
        <td><%=result%></td>
       
      </tr>

  <tr>
        <td>Subject Accuracy</td>
        <td><%=accuracy_score%></td>
       
      </tr>

	    <tr>
        <td>   <form action="Home.jsp">
        <button class="btn btn-success" style="margin-top:10px;margin-left:450px;height: 60px;width: 200px">Return to Home</button>
       </form>
     </td>
       
      </tr>





        

</tbody>
</table>



         
      
    
</div>

</div>    
</body>


</html>