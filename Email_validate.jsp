<%@page import="oaapDao.*"%>
<%@page import="Mailer.*"%>
<html>
 <body>
 <%
 String email=request.getParameter("Email");

 oaapUserDao user=new oaapUserDao();
 EmailSend mail=new EmailSend();
 int status=user.selectEmail(email);

 if(status==1)
 {
	 
		 out.print("<h1 align=center>We have sent a mail to your registerd E-mail ID please check mail</h1>");
          out.flush();
     String pass=user.selectPass(email);
	  mail.sendMail(email,pass);
     
 }
 

 else
 {
	 out.print("<h1 align=center>Invalid Email ID </h1>");
	 out.print("<h1 align=center>Email id not regiister </h1>");
               out.flush();

			   
			   
              RequestDispatcher rd1=request.getRequestDispatcher("ForgotPassword.jsp");
			  rd1.include(request,response);
 }





 %>

  <a href= "Home.jsp" align= "center"></a>
 </body>
</html>
