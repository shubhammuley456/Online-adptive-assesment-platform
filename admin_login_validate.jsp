<%@page  import="java.sql.*" %>

<%

String admin_id=request.getParameter("admin_id");
String admin_password=request.getParameter("admin_password");

Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nilay");
PreparedStatement ps=con.prepareStatement("select * from ooa_admin where username=? and password=?");
ps.setString(1,admin_id);
ps.setString(2,admin_password);

System.out.println(admin_id);
System.out.println(admin_password);

ResultSet rs=ps.executeQuery();

 if (rs.next())
		   {
			   System.out.println("success");
		      out.flush();
              RequestDispatcher rd1=request.getRequestDispatcher("admin_panel_home.jsp");
			  rd1.include(request,response);
		  }

else
{
	 System.out.println("fail");
		out.flush();
      RequestDispatcher  rd1=request.getRequestDispatcher("admin_panel_login.html");
			  rd1.include(request,response);

}



%>

  