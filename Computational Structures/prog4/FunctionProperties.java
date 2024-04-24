/**
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Program: 4
 * @Version:  1.0
 * @Date: 10/09/2022
 */

package prog4;

import java.util.Scanner;

/**
 * To-Do List Rework main to read in x & y values in one line Write methods code
 * Add testing to verify x & y are within domain/range Change methods to print
 * statements instead of returning boolean Clean up print statement that prints
 * ordered pairs
 */

public class FunctionProperties {
	static Scanner input = new Scanner(System.in);

	public static void main(String[] args) {
		boolean invalidInput = true;
		int numPairs;

		// Creates arrays for ordered pairs on user input.
		do {
			System.out.println("Please enter the number of paired values, between 0-5, as an integer: ");
			numPairs = input.nextInt();
			input.nextLine();
			if (numPairs < 0 || numPairs > 5) {
				System.out.println("The number must be 0-5 please try again\n");
			} else {
				invalidInput = false;
			}
		} while (invalidInput); // Loops until a valid number is entered
		// Creates int arrays for x and y
		int[] xValues = new int[numPairs];
		int[] yValues = new int[numPairs];
		for (int i = 0; i < numPairs; i++) {
			System.out.print("\nEnter value first for X and then Y: ");
			xValues[i] = input.nextInt();
			// input.nextLine();
			yValues[i] = input.nextInt();
			input.nextLine();
			System.out.println("ƒ(" + xValues[i] + ") = " + yValues[i]);
		}
		System.out.println();
		if (validFunction(xValues, yValues)) {
			System.out.println("Valid");
			if (oneToOne(yValues))
				System.out.println("1-to-1");
			else
				System.out.println("Not 1-to-1");
			if (onto(yValues))
				System.out.println("Onto");
			else
				System.out.println("Not Onto");
			if (bijection(yValues))
				System.out.println("Bijection");
			else
				System.out.println("Not Bijection");
		} else
			System.out.println("Not Valid");
		input.close();
	}

	// Methods
	private static boolean validFunction(int[] xValues, int[] yValues) {
		for (int i = 0; i < xValues.length; i++) {
			if (xValues[i] < 1 || xValues[i] > 5) {
				return false;
			}
			if (yValues[i] < 1 || yValues[i] > 5) {
				return false;
			}
			for (int j = i+1; j < xValues.length; j++)
				if (xValues[i] == xValues[j]) {
					return false;
				}
		}

		return true;
	}

	private static boolean oneToOne(int[] yValues) {
		for (int i = 0; i < yValues.length; i++) {
			for (int j = 0; j < yValues.length - i - 1; j++)
				if (yValues[j] == yValues[j + 1]) {
					return false;
				}
		}
		return true;
	}

	private static boolean onto(int[] yValues) {
		int[] range = { 1, 2, 3, 4, 5 };
		if (yValues.length != range.length) {
			return false;
		}
		int[] sortedY = yValues;
		bubbleSort(sortedY);
		for (int i = 0; i < sortedY.length; i++) {
			if (sortedY[i] != i + 1) {
				return false;
			}
		}
		return true;
	}

	private static boolean bijection(int[] yValues) {
		if (onto(yValues) && oneToOne(yValues)) {
			return true;
		}
		return false;

	}

	private static void bubbleSort(int[] array2Sort) {

		int arrayLength = array2Sort.length;
		for (int i = 0; i < arrayLength - 1; i++)
			for (int j = 0; j < arrayLength - i - 1; j++)
				if (array2Sort[j] > array2Sort[j + 1]) {
					int temp = array2Sort[j];
					array2Sort[j] = array2Sort[j + 1];
					array2Sort[j + 1] = temp;
				}
	}
}
