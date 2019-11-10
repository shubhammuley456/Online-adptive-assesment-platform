<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
 </head>
 <body>
  <%@page  import="java.sql.*" %>
<%@page import ="javax.servlet.*" %>

<html>
 <body>
 <%


 String admin_id=request.getParameter("admin_id");
String admin_password=request.getParameter("admin_password");


Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nilay");
PreparedStatement ps=con.prepareStatement("select * from ooa_admin where username=? and password=?");
ps.setString(1,admin_id);
ps.setString(2,admin_password);
ResultSet rs=ps.executeQuery();

 if (rs.next())
		   {
			    out.print("<h1 align=center>Welcome</h1>");
               out.flush();

			   session.setAttribute("admin_login_status","true");
			   
              RequestDispatcher rd1=request.getRequestDispatcher("admin_panel_home.jsp");
			  rd1.include(request,response);

		   }


else
{
		out.print("<h1 align=center>Invalid Id or Password</h1>");
		out.flush();
      RequestDispatcher  rd1=request.getRequestDispatcher("admin_panel_login.jsp");
			  rd1.include(request,response);

}




%>
  
 </body>
</html>

 </body>
</html>
