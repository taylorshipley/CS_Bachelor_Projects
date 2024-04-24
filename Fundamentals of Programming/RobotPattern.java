/*************************************************
/*****************************************
 * Author : Taylor Shipley
 * Date : 03/22/2021
 * Assignment: A08 Robot 2
 *******************************************/
import java.util.Random;
public class RobotPattern
{
	public static void main(String[] args)
   { 
      Random rand = new Random();
      int n = 4;
      while (n == 4)
      {
         n = rand.nextInt(2) + 5;
      }
      // square nxn grid with the robot in the north east corner
      Robot robot = new Robot(n, n, n-1, 0);      
      challenge1(robot); 
         
      n = 4;
      while (n == 4)
      {
         n = rand.nextInt(4) + 2;
      }
      robot = new Robot(n, n, n-1, 0);    
      challenge2(robot);
      
      n = 4;
      while (n == 4)
      {
         n = rand.nextInt(4) + 2;
      }
      robot = new Robot(n, n, n-1, 0);
      challenge3(robot);
	}
     
   private static void challenge1(Robot robot)
   {  
      int i = 0;
      while (robot.check('W')) 
         {
   			robot.go('W');
            i++;
         }
      int m = 0;      
      while (m < i)
      {
         if (robot.check('S') == true) 
         {
   			robot.go('S');
            m++;
   		}
         while (robot.check('E')) 
         {
   			robot.go('E');
         }
         if (robot.check('S') == true) 
         {
   			robot.go('S');
            m++;
         }
         while (robot.check('W')) 
         {
   			robot.go('W');
   		}
		}
   robot.say("done");
   }
   
   private static void challenge2(Robot robot)
   {
      int i = 0;
      while (robot.check('S')) 
      {
			robot.go('S');
         i++;
		}
      while ( i>0)
      {
         for (int w = 0; w < i; w++)
         {
            robot.go('W');
         }
         for (int n = 0; n < i; n++)
         {
            robot.go('N');
         }
         i--;
         for (int e = 0; e < i; e++)
         {
            robot.go('E');
         }
         for (int s = 0; s < i; s++)
         {
            robot.go('S');
         }
         i--;
      }
  robot.say("done");    
  }
   
   private static void challenge3(Robot robot)
   {
      int i = 0;
      while (robot.check('S')) 
      {
			robot.go('S');
         i++;
		}
      while ( i>0)
      {  
         for (int w = 0; w < i; w++)
         {
            robot.go('W');
         }
         robot.go('N');
         i--;
         for (int e = 0; e < i; e++)
         {
            robot.go('E');
         }
         for (int n = 0; n < i; n++)
         {
            robot.go('N');
         }
         if (robot.check('W') == true && i != 0)   
         {
            robot.go('W');
            i--;
         }
         for (int s = 0; s < i; s++)
         {
            robot.go('S');
         }
      }
  robot.say("done");    
  }

}
