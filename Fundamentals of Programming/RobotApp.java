/**********************************************
* Author: Taylor Shipley
* 
* RobotApp solved three challenges where a 
* robot needs to figure out the number
* of rooms in a given grid.
*
* Important: 
* The code still needs to work when you change
* the values of the variables n, h, and w.
***********************************************/

public class RobotApp {
	public static void main(String[] args) 
   { 
      // square 4x4 grid to demo how the robotcan be controlled
      Robot robot = new Robot(4, 4, 3, 0); 
      demo(robot);    
      
      int n = 5;
      int h = 4;
      int w = 6;
      
      // square nxn grid with the robot in the north-east corner
      robot = new Robot(n, n, n-1, 0);        
      challenge1(robot);
          
      
      // rectangular grid with width w and height h
      // robot in the north-east corner
      robot = new Robot(w, h, w-1, 0);  
      challenge2(robot);
      
      // square nxn grid 
      // robot's starting position: 1 over, 2 down 
      robot = new Robot(n, n, 1, 2);   
      challenge3(robot);      
      
      // rectangular grid with width w and height h
      // robot's starting position: 3 over, 1 down 
      robot = new Robot(w, h, 3, 1);   
      challenge4(robot);
	}
     
   private static void challenge1(Robot robot)
   {      
      // TODO: Solve challenge 1 and update the text below
      int n = 1;
      while (robot.check('W')) 
      {
			robot.go('W');
         n++;
		}
      int x = n * n;
      robot.say(x + " rooms n-1 moves");		
   }
   
   private static void challenge2(Robot robot) {      
      // TODO: Solve challenge 2 and update text below
      int n = 1;
      while (robot.check('W')) 
      {
			robot.go('W');
         n++;
		}
      int g = 1;
      while (robot.check('S')) 
      {
			robot.go('S');
         g++;
		}
      int x = n * g;
      robot.say(x + " rooms n-1 by g-1 moves");   
   }
   
   private static void challenge3(Robot robot) {   
      // TODO: Solve challenge 3 and update text below
      int g = 0;
      while (robot.check('N'))
      {
   		robot.go('N');
         g++;
      }
      int n = 1;
      while (robot.check('S')) 
      {
			robot.go('S');
         n++;
		}
      int x = n * n;
      robot.say(x + " rooms g+n-1 moves");	  
   }
      
   private static void challenge4(Robot robot)
   {   
      int g = 0;
      while (robot.check('N'))
      {
   		robot.go('N');
         g++;
      }
      
      int m = 0;
      while (robot.check('E')) 
      {
			robot.go('E');
         m++;
		}
      
      int n = 1;
      while (robot.check('S')) 
      {
			robot.go('S');
         n++;
         g++;
		}
      int t = 1;
      while (robot.check('W')) 
      {
			robot.go('W');
         t++;
         m++;
		}
      int x = t * n;
   
      robot.say(x + " rooms " + g + " and " + m + " moves");   
   }
   
   //This method briefly demonstrates how the robot
   // can be controlled.  
   private static void demo(Robot robot)
      {
		int x = 3;
		robot.go('S');
      robot.go('W');
		if (robot.check('N')) 
      {
			robot.go('N');
         x++;
		}
		robot.go('E');
      //robot.go('E'); // uncomment this line and see what happens
      
		robot.say( x + " rooms 2n + 5 moves");
   }
}