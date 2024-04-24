/**
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Program: 8
 * @Name:Counting: Permutations and Combinations
 * @Desc: Counts the number of permutations and combinations of given scenarios
 * @Version:  1.0
 * @Date: 11/22/2022
 */
package prog8;

import java.util.Scanner;

public class PermutationsCombinations {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		boolean repeat;
		// Begins loop that will repeat until user chooses to exit program
		do {
			// Prompts user to input length of the set (n)
			System.out.print("Enter the number of objects (n): ");
			long n = input.nextLong();
			input.nextLine();

			// Prompts user to enter length of the subset (r)
			System.out.print("Enter the number of objects selected (r): ");
			long r = input.nextLong();
			input.nextLine();

			// Prints the number of Permutations and Combinations calculated from user input
			System.out.println("Permutations: " + Permutation(n, r) + " Combinations: " + Combination(n, r));

			// Asks user if they want to break the loop
			System.out.println("Would you like try again? Enter 'Y' for yes or anything else for no: ");
			String answer = input.nextLine();
			// Repeats loop if user enters 'Y'.
			// Any other input will exit loop
			if (answer.equalsIgnoreCase("y")) {
				repeat = true;
			} else {
				repeat = false;
			}
			System.out.println();
		} while (repeat);
		System.out.println();
		input.close();
	}

	/**
	 * Factorial. Calculates the factorial of inputed number. (x!)
	 * 
	 * @param x base number inputed for the factorial
	 * @return the calculated factorial of x
	 */
	private static long Factorial(long x) {
		long factorialN;
		if (x > 1) {
			factorialN = x * Factorial(x - 1);
		} else {
			return 1;
		}
		return factorialN;
	}

	/**
	 * Factorial. An overloaded method used to help prevent overflow when calculating fractions with factorials. Skips
	 * calculating the factorial in the numerator if the denominator has an equal
	 * factorial. 
	 * 
	 *
	 * @param x       the factorial base number in the numerator.
	 * @param stopNum the factorial base number in the denominator
	 * @return the calculated factorial of the fraction
	 */
	private static long Factorial(long x, long stopNum) {
		long factorialN;
		if (x > stopNum) {
			factorialN = x * Factorial(x - 1, stopNum);
		} else {
			return 1;
		}
		return factorialN;
	}

	/**
	 * Permutation. Calculates the number of ways a particular set can be arranged,
	 * where order of the arrangement matters
	 * Formula: P(n,r) = n!/(n-r)!
	 * @param n length of the set
	 * @param r length of the subset
	 * @return the number of permutations possible
	 */
	private static long Permutation(long n, long r) {
		long stopNum = n - r;
		long numbPermutations = Factorial(n, stopNum);
		return numbPermutations;
	}

	/**
	 * Combination. Calculates the number of ways a particular set can be arranged,
	 * where order of the arrangement doesn't matters
	 * Formula: C(n,r) = n!/( (n-r)! * r!)
	 * @param n length of the set
	 * @param r length of the subset
	 * @return the number of combinations possible
	 */
	private static long Combination(long n, long r) {
		long numbCombinations = Permutation(n, r) / Factorial(r);
		return numbCombinations;
	}

}
