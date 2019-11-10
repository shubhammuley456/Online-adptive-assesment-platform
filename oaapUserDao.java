package oaapDao;
import oaapDao.*;
import java.util.*;  
import java.sql.*; 

public class oaapUserDao {  

	
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("oracle.jdbc.driver.OracleDriver");  
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","shubham");  
        }
		catch(Exception e){System.out.println(e);}  
        return con;  
    } 

	public static int oaapUserInfo(String name,String username,String password,String email,String phone){  
        int status=0;  

	UserInfoJavaBean uijb=new UserInfoJavaBean();
    oaapUserDao oud=new oaapUserDao();
    
		
        try{  
            Connection con=oaapUserDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("insert into oaa_userinfo values (user_id_seq.nextval,?,?,?,?,?)");

       ps.setString(2,name);
       ps.setString(1,username);
       ps.setString(5,password);
       ps.setString(3,email); 
       ps.setString(4,phone);

    status=ps.executeUpdate();
              
            con.close();  

uijb=oud.oaapUserValidate(username,password);

System.out.println(uijb.getId());
		oud.oaapInsertSubjectAccuracy(String.valueOf(uijb.getId()));

	

        }catch(Exception ex){System.out.println(ex);}  
          
        return status;  
    }

	public static UserInfoJavaBean oaapUserValidate(String username,String password){

	UserInfoJavaBean uijb=new UserInfoJavaBean();

    
	System.out.println("username"+username);
	System.out.println("password"+password);

        try{  System.out.println("60");

            Connection con=oaapUserDao.getConnection();  
           System.out.println("63");

		   PreparedStatement preparedstatement=con.prepareStatement("select * from oaa_userinfo where username=? and password=?");
           preparedstatement.setString(1,username);
          preparedstatement.setString(2,password);

System.out.println("69");

        uijb.setStatus(0);
		System.out.println("72");

		ResultSet resultset=preparedstatement.executeQuery();
     System.out.println("75");

		if(resultset.next()){
        uijb.setStatus(1);
         uijb.setId(resultset.getInt(1));
        uijb.setName(resultset.getString(3));
        uijb.setEmail(resultset.getString(4));
        uijb.setPhone("999999");
        
    }

	System.out.println("userid="+uijb.getId());

		}
		catch(Exception ee){
		System.out.println(ee);
		}
	return uijb;
	}

public QuestionAnswerJavaBean oaapQuestionFetch(String mock_test_sub,String difficulty,int count){
	QuestionAnswerJavaBean qajb=new QuestionAnswerJavaBean();

        try{  
            Connection con=oaapUserDao.getConnection();  

         PreparedStatement preparedstatement=con.prepareStatement("select * from ooa_"+mock_test_sub+"_"+difficulty+" where sno="+count);

         ResultSet resultset=preparedstatement.executeQuery();

  if(resultset.next()){

         qajb.setStatus(1);
		 qajb.setQid(resultset.getInt(1));
		 qajb.setCid(resultset.getInt(2));
		 qajb.setQuestion(resultset.getString(3));
		 
         qajb.setA(resultset.getString(4));
         qajb.setB(resultset.getString(5));
         qajb.setC(resultset.getString(6));
         qajb.setD(resultset.getString(7));
		 qajb.setAnswer(resultset.getString(8));
	   System.out.println("if-result-set");
	  


}

System.out.println("test1");
   
   }
		catch(Exception ee){
		System.out.println(ee);
		}
	return qajb;


	}

	public float oaapFetchSubjectAccuracy(String subject,String uid){
  float accuracy=0;
  
  try{  

    Connection con=oaapUserDao.getConnection();  

         PreparedStatement preparedstatement=con.prepareStatement("select * from ooa_user_stats  where userid="+Integer.parseInt(uid));

ResultSet rs=preparedstatement.executeQuery();
    
  if (rs.next())
  {
	   accuracy=rs.getFloat(subject);
  }

	
   
		}
		catch(Exception e){
		System.out.println(e);
		}



return (accuracy);

}

	public int oaapInsertSubjectAccuracy(String uid){
int status=0;
        try{  

    Connection con=oaapUserDao.getConnection();  

         PreparedStatement preparedstatement=con.prepareStatement("insert into ooa_user_stats values(?,0,0,0,0)");
    
	   preparedstatement.setInt(1,Integer.parseInt(uid));
	   
  status=preparedstatement.executeUpdate();
		}
		catch(Exception e){
		System.out.println(e);
		}


return status;

}
 public void updateStats(String subject ,String userid ,float accuracy)throws Exception
	{
	 Connection con=oaapUserDao.getConnection();
	 PreparedStatement ps=con.prepareStatement("update ooa_user_stats set "+subject+"="+accuracy+"where userid="+userid);
   
    ps.executeUpdate();
	}

	public int selectEmail(String email)
	{ 

		int status=0;
		
		try
		{
			Connection con=oaapUserDao.getConnection();
		
         PreparedStatement preparedstatement=con.prepareStatement("select * from ooa_userinfo  where email="+email);

    ResultSet rs=preparedstatement.executeQuery();
    
    if (rs.next())
   {
	    status=1;
   }
		}
		catch (Exception e)
		{
		}

		return status;

	}

	public String selectPass(String email)
		
	{ 
		 String pass=null;
		try
		{
			Connection con=oaapUserDao.getConnection();
		
         PreparedStatement preparedstatement=con.prepareStatement("select * from ooa_userinfo  where email="+email);

    ResultSet rs=preparedstatement.executeQuery();
      
	 if(rs.next())
			{
		  pass=rs.getString("PASSWORD");
			}
		}
		catch (Exception e)
		{
		}
		
		return pass;
    
	}
}
	