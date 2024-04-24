package hW10;

/* This is a Java  program to read in strings and count the number of 
 * occurrences of each letter of the alphabet.  Strings are read as long 
 * as the input is at least one character.
 */

import java.util.*;

public class CountChars {

	public static void main(String args[]) {
		String theInput;
		int[] charCount = new int[26]; // count array auto initialized to zeros

		Scanner in = new Scanner(System.in); // instantiate a scanner

		do {
			System.out.print("\nPlease enter a string, press return to stop: ");
			theInput = in.nextLine(); // get a line of input and store in a string
			countChar(theInput.toUpperCase(), charCount); // count the characters
		} while (theInput.length() > 0);

		System.out.println(); // print a blank line
		outputCount(charCount);
		System.out.println();
		in.close();
	}

	public static void countChar(String aString, int counts[]) {
// this function takes an array of character counts and a string and 
// counts the number of each letter occurrence
		int i;

		for (i = 0; i < aString.length(); i++) {
			if (Character.isLetter(aString.charAt(i)))
				counts[(int) aString.charAt(i) - 'A']++;
		}
	} // end of function countChar

	public static void outputCount(int counts[]) {
// This function prints the character count to the screen
		char i; // loop control variable

		System.out.println("------------- The number of occurrences for each letter: --------------");
		for (i = 'A'; i <= 'Z'; i++) {
			System.out.printf("%2c - %3d    ", i, counts[i - 'A']);
			if ((i - 64) % 8 == 0)
				System.out.println();
		}
		System.out.println();
	} // end of function outputCount
} // end of the class
