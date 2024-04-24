/**
* @Author: Taylor Shipley
* @Class: CS2130
* @Program: 9
* @Name: Discrete Probability: Working with large and small populations
* @Desc: Calculates the permutations, combinations, and binomial distribution probabilities of given scenarios
* @Version:  1.0
* @Date: 11/25/2022
*/
package prog9;

import java.util.Scanner;

public class DiscreteProbability {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.printf(
				"60 cars at a dealer, 3 dead bateries. If we check 10, what is the probability"
				+ " no more than 1 will have a dead battery? \nProbability is: %.6f", Binomial(10, 1, 0.05));
		System.out.println("\n");
		System.out.printf("Auto recall: 8%% have defect. If we test 20, what is probability"
		+ " that at most 2 will have the defect? \nProbability is: %.6f", Binomial(20, 2, 0.08));
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
	 * Factorial. An overloaded method used to help prevent overflow when
	 * calculating fractions with factorials. Skips calculating the factorial in the
	 * numerator if the denominator has an equal factorial.
	 * 
	 *
	 * @param x the factorial base number in the numerator.
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
	 * where order of the arrangement matters Formula: P(n,r) = n!/(n-r)!
	 * 
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
	 * where order of the arrangement doesn't matters Formula: C(n,r) = n!/( (n-r)!
	 * * r!)
	 * 
	 * @param n length of the set
	 * @param r length of the subset
	 * @return the number of combinations possible
	 */
	private static long Combination(long n, long r) {
		long numbCombinations = Permutation(n, r) / Factorial(r);
		return numbCombinations;
	}

	/**
	 * Binomial. Calculates the probability of having at most (k) successes out of (n) trails
	 *
	 * @param n the number of trials
	 * @param k the number of minimum desired successes as a decimal
	 * @param p probability of success in 1 trail
	 * @return the binomial distribution probability as a decimal
	 */
	private static double Binomial(long n, long k, double p) {
		if(k < 0) {
			return 0;
		} else {
		double probSuccess = Math.pow(p, k);
		double probFail = Math.pow((1 - p), (n - k));
		long combin = Combination(n, k);
		double biDistProb = (combin * probSuccess * probFail);
		biDistProb = biDistProb + Binomial(n,k-1,p);
		return biDistProb;
		}
	}

}
