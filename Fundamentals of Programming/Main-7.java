/*****************************************
 * Author : Taylor Shipley
 * Date : 04/26/2021
 * Assignment: Lab – Party Guest
 *******************************************/
import java.util.Random; 
import java.util.Scanner;
import java.util.ArrayList;
public class Main
{
	public static void main(String[] args)
	{
	   int numberOfGuests = 4;
		Scanner input = new Scanner(System.in);
		Random rand = new Random();
		ArrayList<String> guestList = new ArrayList<String>();
		System.out.println("Please enter 4 guests:");
		for (int i = 1; i <= 4; i++)
		{
		   System.out.print("guest" + i + ": ");
		   String guestName = input.nextLine();
		   guestList.add(guestName);
		}
		System.out.print("Guest list: [");
		for (int i = 0; i < 4; i++)
		{
		   System.out.print(guestList.get(i));
		   if (i == 3)
		   {
		      System.out.println("]");
		   }
		   else
		   {
		      System.out.print(", ");
		   }
		}
		int number = rand.nextInt(4);
		System.out.println(guestList.get(number) + " can't come");
		guestList.remove(number);
		System.out.print("Updated guest list: [");
		for (int i = 0; i < 3; i++)
		{
		   System.out.print(guestList.get(i));
		   if (i == 2)
		   {
		      System.out.println("]");
		   }
		   else
		   {
		      System.out.print(", ");
		   }
		}
	}
}
