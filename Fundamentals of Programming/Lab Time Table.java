/*****************************************
 * Author : Taylor Shipley
 * Date : 03/12/2021
 * Assignment: Lab – Time Table
 *******************************************/
import java.util.Scanner;

public class Main
{
   public static void main(String[] args) 
   {
      Scanner input = new Scanner(System.in);
      System.out.println("Time Table:");
      int userNum = 0;
      while (userNum <1 || userNum >10)
      {
         System.out.print("Please enter a number from 1 to 10: ");
         userNum = input.nextInt();
		   input.nextLine();
		   if (userNum <1 || userNum >10)
		   {
		      System.out.println("Invalid number entry...");
		      System.out.println();
		   }
      }
		
	   for (int i = 1; i <=10; i++)
	   {
	      int equation = i * userNum;
         System.out.printf("%2d * %2d = ", i, userNum);
         System.out.printf("%-2d\n", equation);
      }
	}
}
