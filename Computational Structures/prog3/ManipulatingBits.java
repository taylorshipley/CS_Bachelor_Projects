/*
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Program: 3-Manipulating Bits: Sets and Set Operations
 * @Version:  1.0
 * @Date: 10/03/2022
 */

package prog3;

import java.util.Scanner;

public class ManipulatingBits {

	public static void main(String[] args) {
		// Prints into message to user
		Scanner input = new Scanner(System.in);
		System.out.println("CS 2130 - Computational Structures  Taylor Shipley\n"
				+ "This program reads in the values of two sets and displays\n"
				+ "the results of several operations on the sets.\n\n");

		// Reads in number of elements in the setA
		int y;
		do {
			System.out.print("Please enter a number between 0-10 for the amount of elements in set A:  ");
			y = input.nextInt();
			if (y < 0 || y > 10) {
				System.out.println("Value entered is not allowed, please try again.");
			}
		} while (y < 0 || y > 10);

		// Reads in the value of the elements for setA
		int numElementsA = y;
		int setA = 0;
		for (int i = 1; i < numElementsA + 1; i++) {
			int x;
			do {
				System.out.print("\nPlease enter a integer between 0-9 for element " + i + ": ");
				x = input.nextInt();
				if (x < 0 || x > 9) {
					System.out.println("Value entered is not allowed, please try again.");
				} else {
					setA = (setA | (1 << x));
				}
			} while (x < 0 || x > 9);
		}
		System.out.println();

		int t;
		do {
			System.out.print("Please enter a number between 0-10 for the amount of elements in set B:  ");
			t = input.nextInt();
			if (t < 0 || y > 10) {
				System.out.println("Value entered is not allowed, please try again.");
			}
		} while (t < 0 || t > 10);

		// Reads in the value of the elements for setB
		int numElementsB = t;
		int setB = 0;
		for (int i = 1; i < numElementsB + 1; i++) {
			int x;
			do {
				System.out.print("\nPlease enter a integer between 0-9 for element " + i + ": ");
				x = input.nextInt();
				if (x < 0 || x > 9) {
					System.out.println("Value entered is not allowed, please try again.");
				} else {
					setB = (setB | (1 << x));
				}
			} while (x < 0 || x > 9);
		}
		input.close();

		// Finds and prints complement of A.
		System.out.print("\nCompliment of A is: {");
		boolean firstNum = false;
		int complimentA = ~setA;
		for (int i = 10; i >= 0; i--) {
			if ((complimentA >> i & 1) > 0) { // if the bit at position i is 1
				if (firstNum) {
					System.out.print(", ");
				}
				System.out.print(i); // prints the position of that 1
				firstNum = true;
			}
			if (i == 0) {
				System.out.print("}");
			}
		}
		System.out.println();

		// Prints union of A & B
		System.out.print("\nUnion of A and B = {");
		int unionAB = (setA | setB);
		firstNum = false;
		for (int i = 10; i >= 0; i--) {
			if ((unionAB >> i & 1) > 0) { // if the bit at position i is 1
				if (firstNum) {
					System.out.print(", ");
				}
				System.out.print(i); // prints the position of i
				firstNum = true;
			}
			if (i == 0) {
				System.out.print("}");
			}
		}
		System.out.println();

		// Prints intersection of A and B
		System.out.print("\nIntersection of A and B = {");
		firstNum = false;
		int intersectionAB = (setA & setB);
		for (int i = 10; i >= 0; i--) {
			if ((intersectionAB >> i & 1) > 0) { // if the bit at position i is 1
				if (firstNum) {
					System.out.print(", ");
				}
				System.out.print(i); // prints the position of i
				firstNum = true;
			}
			if (i == 0) {
				System.out.print("}");
			}
		}
		System.out.println();

		// Prints difference of A and B
		System.out.print("\nDifference of A and B = {");
		firstNum = false;
		for (int i = 10; i >= 0; i--) {
			if ((setA >> i & 1) > 0) { // if the bit at position i is 1
				if (((setB >> i & 1) > 0) == false) {
					if (firstNum) {
						System.out.print(", ");
					}
					System.out.print(i); // prints the position of i
					firstNum = true;
				}
			}
			if (i == 0) {
				System.out.print("}");
			}
		}
		System.out.println();

		// Prints symmetric difference between sets A and B
		System.out.print("\nSymmetric Difference of A and B = {");
		int symmDiffAB = (setA ^ setB);
		firstNum = false;
		for (int i = 10; i >= 0; i--) {
			if ((symmDiffAB >> i & 1) > 0) { // if the bit at position i is 1
				if (firstNum) {
					System.out.print(", ");
				}
				System.out.print(i); // prints the position of i
				firstNum = true;
			}
			if (i == 0) {
				System.out.print("}");
			}
		}
	}
}
