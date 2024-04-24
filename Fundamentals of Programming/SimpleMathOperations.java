/*****************************************
 * Author : Taylor Shipley
 * Date : 02/17/2021
 * Midterm: Simple Math Operations
 *******************************************/
import java.util.Scanner;
import java.util.*;

public class SimpleMathOperations
{
   public static void main(String[] args) 
   {
      Scanner input = new Scanner(System.in);
	   System.out.print("Enter 5 integer numbers separated by a space: ");
		int n1= input.nextInt();
      int n2= input.nextInt();
      int n3= input.nextInt();
      int n4= input.nextInt();
      int n5= input.nextInt();
		input.nextLine();
           
      int[] nums={n1, n2, n3, n4, n5};
      Arrays.sort(nums);
      System.out.println("Minimum: " + nums[0]);
      System.out.println("Maximum: " + nums[nums.length-1]);
      
      int sum= n1 + n2 + n3 + n4 + n5;
      System.out.println("Sum: " + sum);
      System.out.println("Average: " + sum / 5);
      System.out.println("Product: " + (n1 * n2 * n3 * n4 * n5));
      System.out.println("First number divided by second number: " + (n1 / n2));
      System.out.println("The remainder of the fourth number divided by the fifth number: " + (n4 % n5));
   }
}  
