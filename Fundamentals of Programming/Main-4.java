/*****************************************
 * Author : Taylor Shipley
 * Date : 01/28/2021
 * Assignment: Lab – Pattern3
 *******************************************/
public class Main
{
	public static void main(String[] args) 
	{
		for (int i = 0; i < 5; i++)
		{
		   for (int n1 = i; n1 < 5; n1++)
		   {
		      System.out.print("O");
		   }
		   for (int n2 = (-1) * i + 5; n2 < 5; n2++)
		   {
		      System.out.print(".");
		   }
		System.out.println();
		}
	}
}
