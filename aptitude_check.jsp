<%@page import="checker.*"%>

<html>
 <body>
 <%
   increment increment=new increment();
   String option=""+request.getParameter("answer_option");
   String answer=(String)session.getAttribute("answer");
   String correct_count=(String)session.getAttribute("correct_question");
   String marks=(String)session.getAttribute("mark");
   String difficulty=(String)session.getAttribute("difficulty");
   	 String correct_count_easy=null;
	 String correct_count_medium=null;
	 String correct_count_hard=null;

  

   System.out.println(option);
   System.out.println(answer);
   System.out.println(correct_count);
   System.out.println(marks);
   
   int buf_correct_count=Integer.parseInt(correct_count);
   int buf_marks=Integer.parseInt(marks);
   if(option.equals(answer))
   {
	   buf_correct_count=buf_correct_count+1;
	   buf_marks=buf_marks+3;

	   if(difficulty.equals("1")){
          correct_count_easy=(String)session.getAttribute("correct_count_easy");
          correct_count_easy=String.valueOf(increment.inc(Integer.parseInt(correct_count_easy)));
          session.setAttribute("correct_count_easy",correct_count_easy);

	   }else if(difficulty.equals("2")){
		   correct_count_medium=(String)session.getAttribute("correct_count_medium");
           correct_count_medium=String.valueOf(increment.inc(Integer.parseInt(correct_count_medium)));
           session.setAttribute("correct_count_medium",correct_count_medium);  
  
	   
	   } else if(difficulty.equals("3")){
		   correct_count_hard=(String)session.getAttribute("correct_count_hard");
           correct_count_hard=String.valueOf(increment.inc(Integer.parseInt(correct_count_hard)));
           session.setAttribute("correct_count_hard",correct_count_hard);  
	   
	   }

}

   session.setAttribute("mark",buf_marks+"");
   session.setAttribute("correct_question",buf_correct_count+"");

   
 %>
 <jsp:forward page="Exam_panel.jsp" />
 </body>
</html>
