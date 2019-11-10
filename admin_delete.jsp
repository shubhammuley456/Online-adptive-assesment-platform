<%@page import="oaapDao.oaapAdminDao" %>

<html>
<body>

<%
oaapAdminDao oad=new oaapAdminDao();
try
 {

String subject=request.getParameter("subject");
String difficulty=request.getParameter("difficulty");
int sno=Integer.parseInt(request.getParameter("sno"));

int status=oad.oaapQuestionDelete(subject,difficulty,sno);


if(status>0){
	
RequestDispatcher rd1=request.getRequestDispatcher("admin_panel_update.jsp");
			  rd1.forward(request,response);
}
else{
RequestDispatcher rd1=request.getRequestDispatcher("admin_panel_update.jsp");
			  rd1.forward(request,response);

}
 
 }
 
 catch(Exception e){
 System.out.print(e);
 }


%>
</body>
</html>