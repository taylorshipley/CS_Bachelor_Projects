/*****************************************
 * Author : Taylor Shipley
 * Date : 02/15/2021
 * Assignment: Lab: Ball
 *******************************************/
public class Ball
{
   // fields
	private double ballSize;
	private int numOfBounces;
	// constructors
	public Ball(double size1)
   {
      if (size1 >= 0)
      {
         ballSize = size1;
      }
   }
 
   // methods
   public void roll() 
   {
      System.out.println("Rolling ...");
   }
   public double getSize() 
   {
      return ballSize;
   }
   
   public void setSize( double size2) 
   {
      if (size2 >= 0)
      {
         ballSize = size2;
      }
   }
   
   public void bounce( int bounce1) 
   {  
      if (bounce1 > 0)
      {   
         numOfBounces = bounce1;
         if (numOfBounces == 1)
         {
            System.out.println("Bouncing 1 time");
         }
         else
         {
            System.out.println("Bouncing " + numOfBounces + " times");
         }
      }
   }
   
}