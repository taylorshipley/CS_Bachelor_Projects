/**
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Program: 7
 * @Name: Number Theory
 * @Desc: Identifies if two numbers are prime and their GCD/LCD.
 * @Version:  1.0
 * @Date: 11/04/2022
 */
package prog7;

import java.util.Scanner;

public class NumberTheory {

	public static void main(String[] args) {
		int x;
		int y;
		int gcd;
		int lcd;
		Scanner input = new Scanner(System.in);
		// Prints welcome message and reads in user input.
		System.out.println("This program reads in two positive integers and determines if they are prime.");
		System.out.println(
				"It then computes the greatest common divisor of the two positive integers using Euclid's Algorithm.\n");
		// Loops until x and y are greater than 0
		do {
			System.out.print("Enter the first positive integer: ");
			x = input.nextInt();
			input.nextLine();
			System.out.print("Enter the second positive integer: ");
			y = input.nextInt();
			input.nextLine();
			// Prints an error message if x or y is less than 0.
			if (x < 0 || y < 0) {
				System.out.println("Inputs must be greater than 0. Try again...\n");
			}
		} while (x < 0 || y < 0);
		System.out.println();

		System.out.println("Results: ");
		isPrime(x);
		isPrime(y);
		gcd = findGCD(x, y);
		System.out.printf("The gcd(%d,%d) is %d.\n", x, y, gcd);
		lcd = (x * y) / gcd;
		System.out.printf("The lcm(%d,%d) is %d.\n", x, y, lcd);
		System.out.println();
		input.close();
	}

	private static void isPrime(int num1) {
		int k = num1;
		// Loops through calculating the prime factors of input number
		for (int i = 2; i * i <= num1; i++) {
			while (k % i == 0) {
				k = k / i;
			}
		}
		if (k == num1) {
			// If the number has no prime factors, then it is a prime number.
			System.out.println(k + " is a prime number.");
		} else {
			// If the number has prime factors, then it is not a prime number.
			System.out.println(num1 + " is not a prime number.");
		}
	}

	// Uses Euclid's algorithm recursively. Intakes 2 integers and returns the
	// greatest common denominator between them.
	private static int findGCD(int num1, int num2) {
		// base case
		if (num2 == 0) {
			return num1;
		}
		return findGCD(num2, num1 % num2);
	}

}
