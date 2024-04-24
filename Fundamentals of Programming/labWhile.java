/*****************************************
 * Author : Taylor Shipley
 * Date : 03/14/2021
 * Assignment: Lab – While
 *******************************************/
import java.util.Scanner;
public class labWhile
{ 
   public static void main(String[] args)
      { 
         multiplyNumbers();
      }
      
   public static void multiplyNumbers()
   {
      double product = 1;
      double number = 1;
      Scanner input = new Scanner(System.in);
      while (number != 0)
      {
         System.out.print("Enter 0 to exit or Enter a number to multiply ");
         number = input.nextDouble();
         input.nextLine();
         if (number != 0)
         {
            product *= number;
         }
         else
         {
            product = (product * 100) / 100;
            System.out.println("Output: " + product);
         }
      }
      
   } 
}