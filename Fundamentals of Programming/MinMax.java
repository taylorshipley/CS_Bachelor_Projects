/*****************************************
 * Author : Taylor Shipley
 * Date : 01/28/2021
 * Assignment: Lab–if_Statement
 *******************************************/
import java.util.Scanner;

public class MinMax
{
    public static void main(String[] args) 
    {
      Scanner input = new Scanner(System.in);
		System.out.print("number1: ");
		int number1= input.nextInt();
		input.nextLine();
		System.out.print("number2: ");
		int number2= input.nextInt();
		input.nextLine();
		
		if (number1 > number2)
		{
		    System.out.println(number1 + " is greater than " + number2);
		}
		else if (number1 < number2)
		{
		    System.out.println(number1 + " is less than " + number2);
		}
		else if (number1 == number2)
		{
		    System.out.println(number1 + " is equal to " + number2);
		}
    }
}