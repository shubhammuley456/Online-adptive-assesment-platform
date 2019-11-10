<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--Jquery CDN(Content Delivery Networks) links-->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
     

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    


    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"><!--Link for Icons-->

<link href="https://fonts.googleapis.com/css?family=Dosis" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="admin_panel.css">
<!---------------------REGISTER--------VALIDATION----------------------->

  </head>



  <body>
  <% 
     String status=(String)session.getAttribute("admin_login_status");

if(status==null)
{
%>
<jsp:forward page="admin_panel_login.jsp"/>

<%
}
	 else if(status.equals("true"))
	 {

	 }

	 else
	 {
   %>
   <jsp:forward page="admin_panel_login.jsp"/>

  <%
   }
  %>




   .  <div class="container">

     <div class="row"  style="margin-top:50px;height: 150px;width: 
      1200px;
border-radius: 5px;">
 
     	<div class="col">
        <form action="admin_home_validate2.jsp">
     </div>
     			<div class="col">

     				<select name="admin_work" style="width: 300px;height: 70px;margin-top:85px;border: 1px solid #F60100;border-radius: 5px;font-family: Dosis ">
  <option value="queries" >View Users Queries</option>
  <option value="reg_users">View All Registered Users</option>
 <!-- <option value="active_users">View Active Users</option>-->

 
</select>
     				

     			</div>

     			<div class="col">
     				
     			</div>
     			<div class="col">
     				<button class="btn btn-success" type="submit" style="margin-top:85px;height:70px;width:90px;border: 1px solid ;border-radius: 7px ;">Go</button>

     			</div>

</form>

     		</div>



<br>
     <div class="row" style="margin-top:50px;height: 250px;width: 
      1200px;
border-radius: 5px;">
     	<div class="col">


               <form action="admin_home_validate.jsp">
     				<select name="subject" style="width: 300px;height: 70px;margin-top:85px;border: 1px solid #F60100;border-radius: 5px;font-family: Dosis">

  <option value="aptitude">Aptitude</option>
  <option value="reasoning">Reasoning</option>
  <option value="technical">Technical</option>
  <option value="java">Java</option>
</select>
</div>
     			<div class="col">
     				<select name="difficulty" style="width: 300px;height: 70px;margin-top:85px;border: 1px solid #F60100;border-radius: 5px;font-family: Dosis ">
  <option value="easy" >Easy</option>
  <option value="medium">Medium</option>
  <option value="hard">Hard</option>
</select>
     				

     			</div>

     			<div class="col">
     				<select name="operation" style="width: 300px;height: 70px;margin-top:85px;border: 1px solid #F60100;border-radius: 5px;font-family: Dosis ">
  <option value="insert" >Insert</option>
  <option value="update">Update/Delete</option>
  </select>
     				

     			</div>
     			<div class="col">
     				<button class="btn btn-success" type="submit" style="margin-top:85px;height:70px;width:90px;border: 1px solid ;border-radius: 7px ;">Go</button>

     			</div>

</form>

     		</div>

     	</div>
 </body>

</html>