/*****************************************
 * Author : Taylor Shipley
 * Date : 02/20/2021
 * Assignment: Lab Triangle
 *******************************************/

public class Triangle
{
   // fields
   private double s1Values;
	private double s2Values;
	private double s3Values;
	
	// constructors
	
	public Triangle(double side1, double side2, double side3)
   {
      if (isTriangle(side1, side2, side3) == true)
      {
         s1Values = side1;
	      s2Values = side2;
	      s3Values = side3;
      }
	   else 
	   {
	      s1Values = 1d;
	      s2Values = 1d;
	      s3Values = 1d;
      }
   }
 
   // methods
   private boolean isTriangle(double a, double b, double c)
	{
	   if (a+b >c && a+c > b && b+c > a)
	   {
	      return true;
	   }
	   else 
	   {
	      return false;
	   }
	}
   boolean isEquilateral()
	{
	   double a = s1Values;
	   double b = s2Values;
	   double c = s3Values;
	   if (a == b && b == c)
	   {
	      return true;
	   }
	   else 
	   {
	      return false;
	   }
	}
	boolean isRight()
	{
	   double a = s1Values;
	   double b = s2Values;
	   double c = s3Values;
	   if (a*a + b*b == c*c || c*c + b*b == a*a || a*a + c*c == b*b)
	   {
	      return true;
	   }
	   else 
	   {
	      return false;
	   }
	}
   public double getSide1() 
   {
      return s1Values;
   }
   
   public double getSide2() 
   {
      return s2Values;
   }
   
   public double getSide3() 
   {
      return s3Values;
   }
}