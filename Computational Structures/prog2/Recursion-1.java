/*
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Homework: 5
 * @Version:  1.0
 * @Date: 10/14/2022
 */

package hW5;

import java.util.Scanner;

public class Recursion {

	public static void main(String[] args) {
		int val1;
		int val2;
		int position;
		Scanner input = new Scanner(System.in);
		// Prompts user to enter numbers for summation recursion.
		System.out.println("Please enter your range of integers (on one or more lines)");
		val1 = input.nextInt(); // Assigns first number to val1
		val2 = input.nextInt(); // Assigns second number to val2
		input.nextLine(); // Clears scanner buffer
		// Prints out the result of sumRange
		System.out.println("The sum of all the integers from " + val1 + " to " + val2 + " is " + sumRange(val1, val2));
		System.out.println("\nPlease enter a string: ");
		String theString = input.nextLine();
		position = theString.length();
		printRevString(theString,position);
		input.close();
	}

	/**
	 * @param val1 The first number for the range
	 * @param val2 The second number for the range
	 * @return Sum of the range of integers between val1 and val2
	 */
	public static int sumRange(int val1, int val2) {
		//Sorts val1 and val2 by largest to smallest
		if (val1 < val2) {
			int tempInt = val1;
			val1 = val2;
			val2 = tempInt;
		}
		if (val1 == val2) {
			return val1;
		}
		return val1 + sumRange(val1 - 1, val2);
	}
	/**
	 * @param theString The string to be printed in reverse
	 * @param position The length of the string
	 */
	public static void printRevString(String theString, int position) {
		// Decreases by 1 since length is 1 greater than array position
		// Also moves position through word during recursion
		position--; 
		if(position > -1) {
			System.out.print(theString.charAt(position));
			printRevString(theString,position);
		}
	}
}
