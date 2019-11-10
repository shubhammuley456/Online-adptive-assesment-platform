<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>



<div class="container">

<%
try{
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nilay");
PreparedStatement ps=con.prepareStatement("select * from ooa_userinfo");



   ResultSet rs=ps.executeQuery();
 
int count=0,i=1;
%>
<h1 style="text-align:center">Registered Users </h1>
<hr style="background-color:red">

<table class="table table-hover">
	<thead>

      <tr>
        <th>User Id</th>
        <th>Name</th>
        <th>Username</th>
        <th>Password</th>
        <th>Email</th>
        <th>Mobile</th>
      </tr>
    </thead>
<tbody>

	<% 
	 while(rs.next())
     {
  
	   %>
      <tr>
        <td><%=rs.getInt(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        
      </tr>
<%

	 }
}
catch(Exception e){
out.print(e);
}
%>
  </tbody>
  </table>
</div>

</body>
</html>
