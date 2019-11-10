<%@page import="oaapDao.oaapAdminDao" %>

<%
oaapAdminDao oad=new oaapAdminDao();

String subject=request.getParameter("subject");
String difficulty=request.getParameter("difficulty");
int sno=Integer.parseInt(request.getParameter("sno"));
String question=request.getParameter("question");
String answer=request.getParameter("answer");
String a=request.getParameter("A");
String b=request.getParameter("B");
String c=request.getParameter("C");
String d=request.getParameter("D");

int status=oad.oaapQuestionInsert(subject,difficulty,sno,question,answer,a,b,c,d);

if(status>0){

	 RequestDispatcher rd1=request.getRequestDispatcher("admin_panel_insert.jsp");
			  rd1.forward(request,response);
	 }
	 else{
	 RequestDispatcher rd1=request.getRequestDispatcher("admin_panel_insert.jsp");
			  rd1.forward(request,response);
	 
	 }



%>