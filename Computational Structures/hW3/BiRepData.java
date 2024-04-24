/*
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Homework: 3
 * @Version:  1.0
 * @Date: 10/02/2022
 */
package hW3;
import java.util.Scanner;

public class BiRepData 
{

	public static void main(String[] args) 
	{
		int x = 1;
		Scanner input = new Scanner(System.in);
		System.out.println("Welcome to Taylor's Bitopia program \n");
		do { 	// Loops program until user enters 0
			System.out.print("Please enter an integer to display the bit representation: ");
			int userValue = input.nextInt();
			printBinary(userValue);
			System.out.print("\nEnter Zero to quit, any other integer to do it again: ");
			x = input.nextInt();
			System.out.println();
		} while (x != 0); // Closes loop
		System.out.print("\nThanks! Have a great day!!");
		input.close();
	}

	static void printBinary(int theValue)
	{
		System.out.println("\nThe bit representation of " + theValue + " is: ");
		for (int i = 31; i >= 0; i--) {  // note we are looping from high bits to low
		    if ((theValue >> i & 1) > 0) { // if the bit at position i is one
		       System.out.print("1 ");      // print a one followed by a space
		    } else {      // otherwise the bit is zero
		    	System.out.print("0 " );     // print a zero followed by a space
		    }
		}  // end of the for loop, but we still need to print a newline
		System.out.println();
	}
}
