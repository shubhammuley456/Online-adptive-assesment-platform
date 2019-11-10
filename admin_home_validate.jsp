<%@page import="java.sql.*" %>

<%

String subject=request.getParameter("subject");
String difficulty=request.getParameter("difficulty");
String operation=request.getParameter("operation");

String page_name="admin_panel_"+operation+".jsp";
	 %>
	 <input type="hidden" name="subject" value=<%=subject%>>
	  <input type="hidden" name="difficulty" value=<%=difficulty%>>

<%
	 RequestDispatcher rd1=request.getRequestDispatcher(page_name);
			  rd1.forward(request,response);

%>	 

						 
