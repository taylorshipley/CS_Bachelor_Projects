/*****************************************
 * Author : Taylor Shipley
 * Date : 01/28/2021
 * Assignment: Lab HoppityHop
 *******************************************/
public class Main
{
	public static void main(String[] args)
	{
		for (int i = 1; i < 26; i++) 
		{
		   if (i % 3 == 0 && i % 5 != 0)
		   {
		      System.out.println("Hoppity ");
		   }
		   if (i % 3 != 0 && i % 5 == 0)
		   {
		      System.out.println("Hop");
		   }
		   if (i % 3 == 0 && i % 5 == 0)
		      {
		         System.out.println("Hoppity Hop");
		      }
		   else if (i % 3 != 0 && i % 5 != 0)
		   {
		      System.out.println(i);
		   }
		}
	}
}
