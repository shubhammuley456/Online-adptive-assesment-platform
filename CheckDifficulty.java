package checker;

import javax.servlet.*;
import javax.servlet.http.*;

public class CheckDifficulty extends HttpServlet
{
	//HttpServletRequest request;
	public int difficultyCheck(int que_count ,int cor_count, int dif)
	{
		if(que_count==3)
		{
			if(cor_count<2)
			{
				if (dif==1)
				{
				 return dif;	
				}
				else
				{
					return dif-1;

				}
			}

			else
			{
				if (dif==3)
				{
					return dif;
				}
				else
				{
				   return dif+1;
				} 
			}
			
			

			
			

		}


		else
		{
			return dif;

		}

	}
}