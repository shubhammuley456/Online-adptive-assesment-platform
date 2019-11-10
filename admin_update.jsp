<%@page import="oaapDao.oaapAdminDao" %>


<html>
<body>

<%

oaapAdminDao oad=new oaapAdminDao();

String subject=request.getParameter("subject");
String difficulty=request.getParameter("difficulty");

int new_sno=Integer.parseInt(request.getParameter("new_sno"));
int old_sno=Integer.parseInt(request.getParameter("old_sno"));

String question=request.getParameter("question");
String answer=request.getParameter("answer");
String a=request.getParameter("A");
String b=request.getParameter("B");
String c=request.getParameter("C");
String d=request.getParameter("D");

System.out.println("question"+question);
System.out.println("old_sno"+old_sno);
System.out.println("new"+new_sno);
System.out.println("answer"+answer);
System.out.println("1"+a);
System.out.println("1"+b);
System.out.println("1"+c);
System.out.println("1"+d);

try
 {

int status=oad.oaapQuestionUpdate(subject,difficulty,old_sno,new_sno,question,answer,a,b,c,d);
			            
         
if(status>0){

	out.print("<h1>Successful</h1>");

RequestDispatcher rd1=request.getRequestDispatcher("admin_panel_update.jsp");
			  rd1.forward(request,response);
}
else{
	out.print("<h1>Failed</h1>");
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