/*****************************************
 * Author : Taylor Shipley
 * Date : 02/10/2021
 * Assignment: Golden Ratio
 *******************************************/
public class Main
{
  public static void main (String[]args)
  {
    int number1 = 100004;
    int number2 = 161800;
      System.out.printf ("isGoldenRatio(%d,%d): %b%n",
			 number1, number2, isGoldenRatio (number1, number2));
  }
   private static boolean isGoldenRatio (int number1, int number2)   
   {
      double d1 = number1;
      double d2 = number2;
      
      if (number1 > number2)
      {
         double ratio = d1 / d2;
         ratio = (double)Math.round(ratio * 100d) / 100d; 
         if (ratio == 1.618)
         {
           return true;
         }
         else 
         {
            return false;
         }
      }
      else if (number1 < number2)
      {
         double ratio = d2 / d1;
         ratio = (double)Math.round(ratio * 1000d) /1000d;
         if (ratio == 1.618)
         {
           return true;
         }
         else 
         {
            return false;
         }
      }
      else 
      {
         return false;
      }
   }
}