<%@page  import="java.sql.*" %>
<%@page  import="oaapDao.UserInfoJavaBean" %>
<%@page  import="oaapDao.oaapUserDao" %>
<%@page  import="oaapDao.oaapAdminDao" %>
<html>
<body>
<%

  String name=request.getParameter("contact_name");
  String email=request.getParameter("contact_email");
  String message=request.getParameter("contact_message");

  System.out.println(message);

oaapAdminDao oad=new oaapAdminDao();

int status=oad.oaapUserQueries(name,email,message);


if(status>0){

System.out.println("Queries Inserted Succefully");

%>
<jsp:include page="Home.jsp"/>
<%
}

%>
  </body>
  </html>