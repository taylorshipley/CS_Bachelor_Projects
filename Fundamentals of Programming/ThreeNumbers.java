/*****************************************
 * Author : Taylor Shipley
 * Date : 02/04/2021
 * Assignment: A03 Sorting 3 Numbers
 *******************************************/
import java.util.Scanner;

public class ThreeNumbers
{
    public static void main(String[] args) 
    {
      Scanner input = new Scanner(System.in);
	   System.out.print("Enter 3 wholenumbers separated by a space: ");
		int n1= input.nextInt();
      int n2= input.nextInt();
      int n3= input.nextInt();
		input.nextLine();
      System.out.print("Sorted numbers: " );     
      
      if (n1<n2 && n1<n3)
      {
         System.out.print(n1+" ");
         if(n2<n3)
         {
            System.out.print(n2+ " " +n3);
         }
         else
         {
            System.out.print(n3+ " " +n2);
         }
      } 
         
      else if (n2<n1 && n2<n3)
      {
         System.out.print(n2 + " ");
         if (n1<n3)
         {
            System.out.print(n1 + " " +n3);
         }
         else
         {
            System.out.print(n3 + " " +n2);
         }
      }
      else 
      {
         System.out.print(n3 + " ");
         if (n1<n2)
         {
            System.out.print(n1 + " " +n2);
         }
         else
         {
            System.out.print(n2 + " " +n1);
         }
      }
    }
}

