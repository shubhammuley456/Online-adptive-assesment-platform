package oaapDao;
import oaapDao.*;
import java.util.*;  
import java.sql.*; 

public class oaapAdminDao {  

  QuestionAnswerJavaBean qajb=new QuestionAnswerJavaBean();	
	
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("oracle.jdbc.driver.OracleDriver");  
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","shubham");  
        }
		catch(Exception e){System.out.println(e);}  
        return con;  
    } 

	public int oaapQuestionInsert(String subject,String difficulty,int sno,String question,String answer,String a,String b,String c,String d){  
    int status=0;
	try{

      Connection con=oaapAdminDao.getConnection();  

      String query="insert into ooa_"+subject+"_"+difficulty+" values(?,?,?,?,?,?,?,?)";
      PreparedStatement preparedstatement=con.prepareStatement(query);  
            

			preparedstatement.setInt(1,sno);
			preparedstatement.setInt(2,100); 
            preparedstatement.setString(3,question); 
            preparedstatement.setString(4,a); 
            preparedstatement.setString(5,b); 
            preparedstatement.setString(6,c); 
            preparedstatement.setString(7,d); 
			preparedstatement.setString(8,answer); 

	    status=preparedstatement.executeUpdate();
	 
	 
	  }
	   catch(Exception e){
	   System.out.println(e);
	   }


   return status;
    }

	public int oaapQuestionUpdate(String subject,String difficulty,int old_sno,int new_sno,String question,String answer,String a,String b,String c,String d){  
    int status=0;
	try{

      Connection con=oaapAdminDao.getConnection();  

	  PreparedStatement preparedstatement=con.prepareStatement("update ooa_"+subject+"_"+difficulty+" set sno=?,question=?,a=?,b=?,c=?,d=?,answer=? where sno="+old_sno);

 			 preparedstatement.setInt(1,new_sno);  
             preparedstatement.setString(2,question); 
             preparedstatement.setString(3,a); 
             preparedstatement.setString(4,b); 
             preparedstatement.setString(5,c); 
             preparedstatement.setString(6,d);
			 preparedstatement.setString(7,answer);
          
             status=preparedstatement.executeUpdate();
	
        	 con.commit();
  
 }
 catch(Exception e){
System.out.println(e);
}

return status;
 }

public int oaapQuestionDelete(String subject,String difficulty,int sno){  
    int status=0;
	try{

      Connection con=oaapAdminDao.getConnection();  
	  
	  String query="delete from ooa_"+subject+"_"+difficulty+" where sno=?";

       PreparedStatement preparedstatement=con.prepareStatement(query);

       preparedstatement.setInt(1,sno);

       status=preparedstatement.executeUpdate();

	    con.commit();

 }
 catch(Exception e){
System.out.println(e);
}

return status;
 }

public static int oaapUserQueries(String name,String email,String message){  
        int status=0;  

	oaapUserDao oud=new oaapUserDao();
    
		
        try{  
            Connection con=oaapAdminDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("insert into ooa_contactus values(?,?,?)");

       ps.setString(1,name);
       ps.setString(2,email);
       ps.setString(3,message);
 

    status=ps.executeUpdate();
              
            con.close();  

        }catch(Exception ex){System.out.println(ex);}  
          
        return status;  
    }




}

	
