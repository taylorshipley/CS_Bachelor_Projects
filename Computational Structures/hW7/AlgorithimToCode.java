/**
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Homework: 7
 * @Name: Algorithm to Code
 * @Desc: Finds the prime factors that compose an inputed number
 * @Version:  1.0
 * @Date: 10/28/2022
 */
package hW7;

import java.util.Scanner;

public class AlgorithimToCode {

	public static void main(String[] args) {
		String tryAgain;
		int num1;
		Scanner input = new Scanner(System.in);
		System.out.println("This program prints the prime factorization of positive integers\n");
		do {
			//Prompts user to enter a number to find the prime factors that compose it.
			System.out.print("Please enter a positive integer for prime factorization: ");
			num1 = input.nextInt();
			input.nextLine();
			if (num1 < 2) {
				System.out.println("Input must be greater than 2\n"); //Error message
			} else {
				//Prints the output message
				System.out.println("The prime factorization of " + num1 + " is: ");
				int k = num1;
				boolean firstPass = true;
				//Loops through calculating the prime factors of input number 
				for (int i = 2; i * i <= num1; i++) {
					while (k % i == 0) {
						if(firstPass) {
							System.out.print(i);
							firstPass = false;
						} else {
							System.out.print(", " + i);
						}
						k = k / i;
					}
				}
				if (k > 1) {
					if(firstPass) {
						System.out.print(k);
					} else {
					System.out.print(", " + k);
					}
				}
				System.out.println("\n");
			}
			//Repeats the program unless user inputs "N" or "n"
			System.out.println("Would you like to try another number (N for no, anything else is yes): ");
			tryAgain = input.nextLine().toUpperCase(); //Changes input to uppercase
			System.out.println(""); // Advances cursor so additional runs do not appear on same line
		} while (!tryAgain.equals("N"));
		System.out.println("Goodbye!\n");
		input.close();
	}
}
