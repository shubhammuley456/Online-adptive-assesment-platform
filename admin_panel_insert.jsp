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
    
    <link rel="stylesheet" type="text/css" href="admin_panel_insert.css">
   

<!---------------------REGISTER--------VALIDATION----------------------->

  </head>

  <body>


  <% 
  String subject=request.getParameter("subject");
  String difficulty=request.getParameter("difficulty");  
 System.out.println(subject);
 System.out.println(difficulty);
  %>
     <div class="container">

      <div class="row" style="margin-top:40px;margin-left:-20px;height:300px;">

<div class="row"  >
 
                   
          <div class="row">
            <div class="col">
             
             <!----------------RADIO---------------------
             
            <div class="radio">
             <label><input type="radio" name="optradio">Option 2</label>
              </div>

              <div class="radio">
              <label><input type="radio" name="optradio" checked>Option 1</label>
               </div>
            
            <div class="radio">
             <label><input type="radio" name="optradio">Option 2</label>
              </div>
             
              
              <div class="radio disabled">
               <label><input type="radio" name="optradio" disabled>Option 3</label>
                 </div>


             ----------------RADIO--------------------->


             <form action="admin_insert.jsp">

             <div class="row" id="question_card" style="">

                <div class="col" style="padding-left:20px;">
               
               <textarea class="form-control" name="question" style="resize: none;height: 75px;width: 700px" placeholder="Question"></textarea>

                </div>

             </div>

             <div class="row" id="option_col">

              <div class="col" id="option">
                <input type="text" name="A" id="option_input" placeholder="A">
              </div>
              
              <div class="col" id="option">
                 <input type="text" name="B" id="option_input" placeholder="B">
              </div>
               
             </div>

                <div class="row" style="margin-left:53%;max-width: 50%">
                
                 <div class="col">
                <select name="answer" id="select_answer">
                  
                  <option value="">Select Answer</option>
                  <option value="A">A</option>
                  <option value="B">B</option>
                  <option value="C">C</option>
                  <option value="D">D</option>
              
               </select>
			   </div>

			   <div class="col"><input type="text" name="sno"></div>
              
             </div>



             <div class="row" id="option_col" style="">

              <div class="col" id="option">
                <input type="text" name="C" id="option_input" placeholder="C">
              </div>
            

              <div class="col" id="option">
                 <input type="text" name="D" id="option_input" placeholder="D">
              </div>
               
             </div>

              		 <input type="hidden" name="subject" value=<%=subject%>>
    	  <input type="hidden" name="difficulty" value=<%=difficulty%>>

           <div class="row" style="margin-top:10px;margin-left: 55%">
                <div class="col"><button type="submit" class="btn">Insert</button></div>
                
                 </div>
            
            </form>

             <div class="row" style="margin-top:10px;margin-left: 50%">

              <form action="admin_panel_home.jsp">
                <div class="col" style="max-width: 15%"><button type="submit" class="btn btn-success">Home</button></div>
				<input type="submit" value="ok">
               
               </form>

               <form action="">                 
                <div class="col" style="margin-left:5%;max-width: 15%"><button type="submit" class="btn btn-danger">Reset</button></div>
                
                 </div>
                  </form>



            </div>

        </div> 
         
      
      </div>
        </div>

     </div>
  </body>

</html>