/*
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Homework: 4
 * @Version:  1.0
 * @Date: 10/09/2022
 */
package hW4;

import java.util.Scanner;

public class arrayBubblSrt {
	static Scanner input = new Scanner(System.in);

	public static void main(String[] args) {

		System.out.print("Please enter the number of slots for the array: ");
		int arraySize = input.nextInt();
		input.nextLine();
		int[] intArray = new int[arraySize];
		for (int i = 0; i < arraySize; i++) {
			System.out.println("\nPlease enter value for array slot " + (i) + ": ");
			int arrayValue = input.nextInt();
			input.nextLine();
			intArray[i] = arrayValue;
		}
		// Calls the method bubbleSort and prints it out
		bubbleSort(intArray);
		for (int i = 0; i < intArray.length; i++) {
			System.out.println("Element at index " + i + ": " + intArray[i]);
		}

		// Reads in a string and counts how many times a letter occurs
		int[] letterArray = new int[26];
		System.out.print("\nPlease enter your string: ");
		String strInput = input.nextLine();
		System.out.println();
		for (int i = 0; i < strInput.length(); i++) {
			if (Character.isLetter(strInput.charAt(i)))
				letterArray[Character.toUpperCase(strInput.charAt(i)) - 'A']++;
		}

		// Prints result of letter count
		String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		for (int i = 0; i < letterArray.length; i++) {
			System.out.print(alphabet.charAt(i) + ": ");
			System.out.println(letterArray[i]);
		}
		input.close();
	}

	/**
	 * Sorts an int array from least to greatest. Should not be used for large
	 * arrays as it's slow.
	 * 
	 * @param Array2Sort The int array that needs to be sorted
	 */
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
