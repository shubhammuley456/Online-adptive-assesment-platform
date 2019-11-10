<%@page import="java.sql.*" %>

<%

String admin_operation=request.getParameter("admin_work");


String page_name="admin_panel_"+admin_operation+".jsp";
	
	 RequestDispatcher rd1=request.getRequestDispatcher(page_name);
			  rd1.forward(request,response);
			  System.out.println(page_name);

%>	 

						 
